import pytest
import sklearn
from sklearn import metrics

from parallelm.mlops import mlops as pm
from parallelm.mlops.metrics_constants import ClassificationMetrics
from parallelm.mlops.mlops_exception import MLOpsStatisticsException
from parallelm.mlops.mlops_mode import MLOpsMode


def test_mlops_accuracy_score_apis():
    pm.init(ctx=None, mlops_mode=MLOpsMode.STAND_ALONE)

    labels_pred = [1, 0, 1, 1, 1, 0]
    labels_actual = [0, 1, 0, 0, 0, 1]

    accuracy_score = metrics.accuracy_score(labels_actual, labels_pred)

    # first way
    pm.set_stat(ClassificationMetrics.ACCURACY_SCORE, accuracy_score)

    # second way
    pm.metrics.accuracy_score(y_true=labels_actual, y_pred=labels_pred)

    # should throw error if not numeric number is provided
    with pytest.raises(MLOpsStatisticsException):
        pm.set_stat(ClassificationMetrics.ACCURACY_SCORE, [1, 2, 3])

    # should throw error if labels predicted is different length than actuals
    with pytest.raises(ValueError):
        labels_pred_missing_values = [0, 0, 0, 1]
        pm.metrics.accuracy_score(y_true=labels_actual, y_pred=labels_pred_missing_values)

    sample_weight = [0.9, 0.1, 0.5, 0.9, 1.0, 0]

    # testing with sample weights as well
    pm.metrics.accuracy_score(y_true=labels_actual,
                              y_pred=labels_pred,
                              sample_weight=sample_weight)

    pm.done()


def test_mlops_auc_apis():
    pm.init(ctx=None, mlops_mode=MLOpsMode.STAND_ALONE)

    labels_pred = [1, 0, 1, 1, 1, 0]
    labels_actual = [0, 1, 0, 0, 0, 1]

    fpr, tpr, thresholds = sklearn.metrics.roc_curve(labels_actual, labels_pred, pos_label=2)
    auc = sklearn.metrics.auc(fpr, tpr)

    # first way
    pm.set_stat(ClassificationMetrics.AUC, auc)

    # second way
    pm.metrics.auc(x=fpr, y=tpr)

    # should throw error if not numeric number is provided
    with pytest.raises(MLOpsStatisticsException):
        pm.set_stat(ClassificationMetrics.AUC, [1, 2, 3])

    pm.done()


def test_mlops_bas_apis():
    pm.init(ctx=None, mlops_mode=MLOpsMode.STAND_ALONE)

    labels_pred = [1, 0, 1, 1, 1, 0]
    labels_actual = [0, 1, 0, 0, 0, 1]

    bas = sklearn.metrics.balanced_accuracy_score(labels_actual, labels_pred)

    # first way
    pm.set_stat(ClassificationMetrics.BALANCED_ACCURACY_SCORE, bas)

    # second way
    pm.metrics.balanced_accuracy_score(y_true=labels_actual, y_pred=labels_pred)

    # should throw error if not numeric number is provided
    with pytest.raises(MLOpsStatisticsException):
        pm.set_stat(ClassificationMetrics.BALANCED_ACCURACY_SCORE, [1, 2, 3])

    # should throw error if labels predicted is different length than actuals
    with pytest.raises(ValueError):
        labels_pred_missing_values = [0, 0, 0, 1]
        pm.metrics.balanced_accuracy_score(y_true=labels_actual, y_pred=labels_pred_missing_values)

    sample_weight = [0.9, 0.1, 0.5, 0.9, 1.0, 0]

    # testing with sample weights as well
    pm.metrics.balanced_accuracy_score(y_true=labels_actual,
                                       y_pred=labels_pred,
                                       sample_weight=sample_weight)

    pm.done()


def test_mlops_bsl_apis():
    pm.init(ctx=None, mlops_mode=MLOpsMode.STAND_ALONE)

    labels_actual = [1, 0, 1, 1, 1, 0]
    labels_pred_prob = [0.9, 0.8, 0.7, 0.9, 0.75, 1]

    bsl = sklearn.metrics.brier_score_loss(labels_actual, labels_pred_prob)

    # first way
    pm.set_stat(ClassificationMetrics.BRIER_SCORE_LOSS, bsl)

    # second way
    pm.metrics.brier_score_loss(y_true=labels_actual, y_prob=labels_pred_prob)

    # should throw error if not numeric number is provided
    with pytest.raises(MLOpsStatisticsException):
        pm.set_stat(ClassificationMetrics.BRIER_SCORE_LOSS, [1, 2, 3])

    # should throw error if labels predicted is different length than actuals
    with pytest.raises(ValueError):
        labels_prob_missing_values = [0, 0, 0, 1]
        pm.metrics.brier_score_loss(y_true=labels_actual, y_prob=labels_prob_missing_values)

    sample_weight = [0.9, 0.1, 0.5, 0.9, 1.0, 0]

    # testing with sample weights as well
    pm.metrics.brier_score_loss(y_true=labels_actual,
                                y_prob=labels_pred_prob,
                                sample_weight=sample_weight)

    pm.done()


def test_mlops_classification_report_apis():
    pm.init(ctx=None, mlops_mode=MLOpsMode.STAND_ALONE)

    labels_pred = [1, 0, 1, 1, 1, 0]
    labels_actual = [0, 1, 0, 0, 0, 1]

    cr = metrics.classification_report(labels_actual, labels_pred)

    # first way
    pm.set_stat(ClassificationMetrics.CLASSIFICATION_REPORT, cr)

    # second way
    pm.metrics.classification_report(y_true=labels_actual, y_pred=labels_pred)

    # should throw error if empty string is provided
    with pytest.raises(MLOpsStatisticsException):
        pm.set_stat(ClassificationMetrics.CLASSIFICATION_REPORT, "")

    # should throw error if None string is provided
    with pytest.raises(MLOpsStatisticsException):
        pm.set_stat(ClassificationMetrics.CLASSIFICATION_REPORT, None)

    # should throw error if weird string
    with pytest.raises(MLOpsStatisticsException):
        pm.set_stat(ClassificationMetrics.CLASSIFICATION_REPORT, "Hello ParallelM")

    # should throw error if labels predicted is different length than actuals
    with pytest.raises(ValueError):
        labels_pred_missing_values = [0, 0, 0, 1]
        pm.metrics.classification_report(y_true=labels_actual, y_pred=labels_pred_missing_values)

    sample_weight = [0.9, 0.1, 0.5, 0.9, 1.0, 0]
    target_names = ["class Yes", "class No"]
    # testing with sample weights as well
    pm.metrics.classification_report(y_true=labels_actual,
                                     y_pred=labels_pred,
                                     target_names=target_names,
                                     sample_weight=sample_weight)

    pm.done()


def test_mlops_confusion_metrics_apis():
    pm.init(ctx=None, mlops_mode=MLOpsMode.STAND_ALONE)

    labels_pred = [1, 0, 1, 1, 1, 0]
    labels_actual = [0, 1, 0, 0, 0, 1]
    labels_ordered = [0, 1]

    cm = metrics.confusion_matrix(labels_actual, labels_pred, labels=labels_ordered)

    # first way
    pm.set_stat(ClassificationMetrics.CONFUSION_MATRIX, cm, labels=labels_ordered)

    # second way
    pm.metrics.confusion_matrix(y_true=labels_actual, y_pred=labels_pred, labels=labels_ordered)

    # should throw error if labels are not provided
    with pytest.raises(MLOpsStatisticsException):
        pm.set_stat(ClassificationMetrics.CONFUSION_MATRIX, cm)

    with pytest.raises(MLOpsStatisticsException):
        pm.metrics.confusion_matrix(y_true=labels_actual, y_pred=labels_pred, labels=None)

    # should throw error if labels predicted is different length than actuals
    with pytest.raises(ValueError):
        labels_pred_missing_values = [0, 0, 0, 1]
        pm.metrics.confusion_matrix(y_true=labels_actual, y_pred=labels_pred_missing_values, labels=None)

    sample_weight = [0.9, 0.1, 0.5, 0.9, 1.0, 0]

    # testing with sample weights as well
    pm.metrics.confusion_matrix(y_true=labels_actual,
                                y_pred=labels_pred,
                                labels=labels_ordered,
                                sample_weight=sample_weight)

    pm.done()
