from parallelm.mlops.metrics_constants import ClassificationMetrics
from parallelm.mlops.singelton import Singleton


@Singleton
class MLOpsMetrics(object):
    """
    Class is responsible for giving user sklearn alike code representation for using ParallelM's mlops apis.
    Class will support classification, regression and clustering stats.
    :Example:

    >>> from parallelm.mlops import mlops

    >>> # Output ML Stat - For Example Confusion Matrix as Table
    >>> labels_pred = [1, 0 , 1] # prediction labels
    >>> labels = [0, 1, 0] # actual labels
    >>> labels_ordered = [0, 1] # order of labels to use for creating confusion matrix.

    >>> mlops.metrics.accuracy_score(y_true=labels, y_pred=labels_pred)

    >>> fpr, tpr, thresholds = sklearn.metrics.roc_curve(labels, labels_pred, pos_label=2)

    >>> mlops.metrics.auc(x=fpr, y=tpr)

    >>> mlops.metrics.confusion_matrix(y_true=labels, y_pred=labels_pred, labels=labels_ordered)
    """

    # classification stats
    @staticmethod
    def accuracy_score(y_true, y_pred, normalize=True, sample_weight=None):
        # need to import only on run time.
        from parallelm.mlops import mlops as mlops
        import sklearn

        accuracy_score = sklearn.metrics.accuracy_score(y_true=y_true, y_pred=y_pred, normalize=normalize,
                                                        sample_weight=sample_weight)

        mlops.set_stat(ClassificationMetrics.ACCURACY_SCORE, data=accuracy_score)

    @staticmethod
    def auc(x, y):
        # need to import only on run time.
        from parallelm.mlops import mlops as mlops
        import sklearn

        auc = sklearn.metrics.auc(x=x, y=y)

        mlops.set_stat(ClassificationMetrics.AUC, data=auc)

    @staticmethod
    def confusion_matrix(y_true, y_pred, labels, sample_weight=None):
        # need to import only on run time.
        from parallelm.mlops import mlops as mlops
        import sklearn

        cm = sklearn.metrics.confusion_matrix(y_true, y_pred, labels, sample_weight)

        mlops.set_stat(ClassificationMetrics.CONFUSION_MATRIX, data=cm, labels=labels)
