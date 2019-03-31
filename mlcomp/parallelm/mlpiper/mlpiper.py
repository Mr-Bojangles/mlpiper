#!/usr/bin/env python3

import glob
import json
import logging
import os
import shutil
import subprocess
import sys
import tempfile

from parallelm.mlpiper.component_scanner import ComponentScanner
from parallelm.pipeline import json_fields
from parallelm.common.base import Base
from parallelm.pipeline import java_mapping
from parallelm.pipeline.executor import Executor


class MLPiper(Base):
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    COMPONENT_PACKAGE = "parallelm/code_components"
    COMP_PKG_DIR = "comp_pkg"
    DIST_DIR = "mlpiper_dist"
    COMPONENTS_SETUP_PY = "mcenter_components_setup.py"

    MLPIPER_SCRIPT = "mlpiper"
    DEPLOYMENT_PIPELINE = "pipeline.json"

    def __init__(self, options):
        super(MLPiper, self).__init__()
        self.set_logger(logging.getLogger(self.logger_name()))
        self._comp_repo_info = None
        self._dist_dir = None
        self._deploy_dir = None
        self._bin_dir = None
        self._pipeline_dict = None
        self._use_color = True
        self._engine = None
        self._options = options

        self._skip_clean = False
        self._skip_mlpiper_deps = False

        self._input_model_filepath = None
        self._output_model_filepath = None
        self._force = False

    def _print_info(self):
        self._logger.info("dist_dir: {}".format(self._dist_dir))
        self._logger.info("bin_dir: {}".format(self._bin_dir))

    def comp_repo(self, comp_root_dir):
        self._comp_repo_info = ComponentScanner().scan_dir(comp_root_dir)
        return self

    def deployment_dir(self, deploy_dir):
        self._deploy_dir = os.path.abspath(deploy_dir)
        return self

    def bin_dir(self, bin_dir):
        self._bin_dir = os.path.realpath(bin_dir)
        return self

    def skip_clean(self, skip_clean):
        self._skip_clean = skip_clean
        return self

    def skip_mlpiper_deps_install(self, skip_deps):
        self._skip_mlpiper_deps = skip_deps
        return self

    def use_color(self, use_color):
        self._use_color = use_color
        return self

    def pipeline(self, pipeline):
        if hasattr(pipeline, 'read'):
            self._pipeline_dict = json.load(pipeline)
        elif os.path.exists(pipeline):
            self._logger.debug("Detected pipeline as a file")

            with open(pipeline, 'r') as f:
                self._pipeline_dict = json.load(f)
        else:
            self._logger.debug("Trying to load pipeline as a string")
            self._pipeline_dict = json.loads(pipeline)

        self._engine = self._pipeline_dict[json_fields.PIPELINE_ENGINE_TYPE_FIELD]

        return self

    def input_model(self, model_filepath):
        if not os.path.exists(model_filepath):
            raise Exception("Input model file path not exists! " + model_filepath)

        self._input_model_filepath =  model_filepath

    def output_model(self, model_filepath):
        self._output_model_filepath = model_filepath

    def force(self, force):
        self._force = force
        return self

    def deploy(self):
        self._logger.info("Preparing pipeline for run")
        self._print_info()

        if not self._deploy_dir:
            raise Exception("Deployment dir was not provided")

        if os.path.exists(self._deploy_dir):
            if self._force:
                shutil.rmtree(self._deploy_dir)
            else:
                raise Exception("Deployment dir already exists: {}".format(self._deploy_dir))

        if not self._pipeline_dict:
            raise Exception("Pipeline was not provided")

        if not self._dist_dir:
            self._dist_dir = os.path.join(self._deploy_dir, MLPiper.DIST_DIR)

        self._validate_pipeline()
        self._fix_pipeline()
        self._create_components_pkg()
        self._create_deployment()
        if not self._skip_clean:
            self._cleanup()

    def _get_comp_repo_folder_structure(self, comp_name):
        return self._comp_repo_info[self._engine][comp_name]

    def _get_pipeline_components(self):
        return set([e['type'] for e in self._pipeline_dict['pipe']])

    def _validate_pipeline(self):
        if self._engine not in self._comp_repo_info:
            raise Exception("Pipeline Engine: {} has not component".format(self._engine))

        for comp_name in self._get_pipeline_components():
            try:
                self._get_comp_repo_folder_structure(comp_name)
            except Exception as e:
                raise Exception("Component {} is not found in loaded components".format(comp_name))

    def _fix_pipeline(self):
        if json_fields.PIPELINE_SYSTEM_CONFIG_FIELD not in self._pipeline_dict:
            self._logger.debug("Adding {} to pipeline".format(json_fields.PIPELINE_SYSTEM_CONFIG_FIELD))
            system_config = {}
            self._pipeline_dict[json_fields.PIPELINE_SYSTEM_CONFIG_FIELD] = system_config

        if self._input_model_filepath:
            self._pipeline_dict[json_fields.PIPELINE_SYSTEM_CONFIG_FIELD][java_mapping.MODEL_FILE_SOURCE_PATH_KEY] = \
                self._input_model_filepath

        if self._output_model_filepath:
            self._pipeline_dict[json_fields.PIPELINE_SYSTEM_CONFIG_FIELD][java_mapping.MODEL_FILE_SINK_PATH_KEY] = \
                self._output_model_filepath

    def _copy_components(self, dest_dir):
        self._logger.debug("Copying pipeline components to staging area")
        comp_copied = {}
        for comp_name in self._get_pipeline_components():
            # Copying each component only once (some pipelines can contain the same component multiple times)
            if comp_name not in comp_copied:
                comp_repo_folder_struct = self._get_comp_repo_folder_structure(comp_name)
                src_comp_root = comp_repo_folder_struct["root"]
                src_comp_files = comp_repo_folder_struct["files"]
                comp_dst_root = os.path.join(dest_dir, comp_name)
                os.mkdir(comp_dst_root)
                for f in src_comp_files:
                    try:
                        src_path = os.path.join(src_comp_root, f)
                        dst_path = os.path.join(comp_dst_root, f)
                        shutil.copy(src_path, dst_path)
                    except IOError as e:
                        os.makedirs(os.path.dirname(dst_path))
                        shutil.copy(src_path, dst_path)
                    self._logger.debug("Copied src comp file to dst: {} ==> {}".format(src_path, dst_path))

                with open(os.path.join(comp_dst_root, "component.json"), "w") as f:
                    json.dump(comp_repo_folder_struct["comp_desc"], f)

                open(os.path.join(comp_dst_root, "__init__.py"), 'a').close()

                self._logger.debug("Created tmp dst component dir: {}".format(comp_dst_root))

                comp_copied[comp_name] = True

    def _add_pkg_files(self, comp_pkg_dir):
        self._logger.debug("Copying setup.py to component package")
        src_comp_pkg_setup = os.path.join(self._bin_dir, MLPiper.COMPONENTS_SETUP_PY)
        dst_comp_pkg_setup = os.path.join(comp_pkg_dir, "setup.py")
        shutil.copy(src_comp_pkg_setup, dst_comp_pkg_setup)

        dst_comp_tmp_dir = os.path.join(comp_pkg_dir, MLPiper.COMPONENT_PACKAGE)
        # This is the __init__ at the namespace directory
        with open(os.path.join(dst_comp_tmp_dir, '..', '__init__.py'), 'w') as f:
            f.write("__import__('pkg_resources').declare_namespace(__name__)")

        # This is the __init__ at the lower level dirctory (the directory containing all components as dirs)
        open(os.path.join(dst_comp_tmp_dir, '__init__.py'), 'w').close()

    def _create_pkg(self, comp_pkg_dir):
        create_egg_script = os.path.join(self._bin_dir, "create-egg.sh")
        if not os.path.exists(create_egg_script):
            raise Exception("Script {} does not exists, might be bad installation".format(create_egg_script))

        create_pkg_cmd = '{} --root={} --silent'.format(create_egg_script, comp_pkg_dir)
        self._logger.debug("create_pkg_cmd: {}".format(create_pkg_cmd))

        subprocess.check_call(create_pkg_cmd, shell=True)

    def _create_components_pkg(self):

        comp_pkg_dir = os.path.join(self._dist_dir, MLPiper.COMP_PKG_DIR)
        os.makedirs(comp_pkg_dir)
        self._logger.debug("comp_pkg_dir: {}".format(comp_pkg_dir))
        dst_comp_tmp_dir = os.path.join(comp_pkg_dir, MLPiper.COMPONENT_PACKAGE)
        self._logger.info("dest_comp_tmp_dir: {}".format(dst_comp_tmp_dir))
        os.makedirs(dst_comp_tmp_dir)

        self._copy_components(dst_comp_tmp_dir)
        self._add_pkg_files(comp_pkg_dir)
        self._create_pkg(comp_pkg_dir)

    def _copy_pkg(self, comp_pkg_dir):

        for pkg_filepath in glob.glob(comp_pkg_dir + '/' + 'dist/*.egg'):
            self._logger.debug("Copying pkg {}".format(pkg_filepath))
            shutil.copy(pkg_filepath, self._deploy_dir)

        for pkg_filepath in glob.glob(comp_pkg_dir + '/' + 'dist/*.whl'):
            self._logger.debug("Copying pkg {}".format(pkg_filepath))
            shutil.copy(pkg_filepath, self._deploy_dir)

    def _create_deployment(self):

        comp_pkg_dir = os.path.join(self._dist_dir, MLPiper.COMP_PKG_DIR)
        self._copy_pkg(comp_pkg_dir)

        # TODO - add system config to pipeline
        #self._pipeline_json['systemConfig']['modelFileSinkPath'] = self._model_save_path
        pipeline_file = os.path.join(self._deploy_dir, MLPiper.DEPLOYMENT_PIPELINE)
        with open(pipeline_file, 'w') as f:
            json.dump(self._pipeline_dict, f, indent=4)

        src_mlpiper = os.path.join(self._bin_dir, MLPiper.MLPIPER_SCRIPT)
        shutil.copy2(src_mlpiper, self._deploy_dir)

    def _cleanup(self):
        self._logger.info("Cleaning up ... " + self._deploy_dir)
        shutil.rmtree(self._dist_dir)

    def _install_deps(self, py_deps):
        self._logger.info("Installing py dependencies ... {}".format(py_deps))

        fd, reqs_pathname = tempfile.mkstemp(prefix="mlpiper_requirements_", dir="/tmp", text=True)
        os.write(fd, "\n".join(py_deps).encode())
        os.close(fd)

        cmd = "yes | {} -m pip install --disable-pip-version-check --requirement {}"\
            .format(sys.executable, reqs_pathname)

        self._logger.info("cmd: " + cmd)
        try:
            subprocess.check_call(cmd, shell=True)
        except subprocess.CalledProcessError as ex:
            print(str(ex))
        finally:
            if os.path.exists(reqs_pathname):
                os.remove(reqs_pathname)

    def run_deployment(self):
        self._logger.info("Running prepared deployment, {}".format(self._deploy_dir))
        py_version_major = sys.version_info[0]

        sys.path.insert(0, self._deploy_dir)
        eggs = glob.glob("{}/*py{}*.egg".format(self._deploy_dir, py_version_major))
        if len(eggs) == 0:
            self._logger.warning("No eggs found for py{}. Trying to find all possible eggs.".format(py_version_major))
            eggs = glob.glob("{}/*.egg".format(self._deploy_dir))
        for egg in eggs:
            sys.path.insert(0, egg)

        import pkg_resources
        if py_version_major < 3:
            reload(pkg_resources)
        else:
            import importlib
            importlib.reload(pkg_resources)

        pipeline_file = os.path.join(self._deploy_dir, MLPiper.DEPLOYMENT_PIPELINE)
        if not os.path.exists(pipeline_file):
            raise Exception("Pipeline file not exists! path: {}".format(pipeline_file))

        pipeline_runner = Executor().pipeline_file(open(pipeline_file)).use_color(self._use_color)

        if not self._skip_mlpiper_deps:
            py_deps = pipeline_runner.all_py_component_dependencies()
            if py_deps:
                self._install_deps(py_deps)

        pipeline_runner.go()

