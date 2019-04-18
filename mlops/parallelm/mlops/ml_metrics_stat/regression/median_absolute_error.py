from parallelm.mlops.metrics_constants import RegressionMetrics
from parallelm.mlops.mlops_exception import MLOpsStatisticsException
from parallelm.mlops.stats.single_value import SingleValue
from parallelm.mlops.stats_category import StatCategory


class MedianAbsoluteError(object):
    """
    Responsibility of this class is basically creating stat object out of median absolute error.
    """

    @staticmethod
    def get_mlops_mae_stat_object(mae):
        """
        Method will create MLOps Single value stat object from numeric real number - median absolute error
        It is not recommended to access this method without understanding single value data structure that it is returning.
        :param mae: mean absolute error
        :return: Single Value stat object which has median absolute error embedded inside
        """
        single_value = None

        if isinstance(mae, (int, float)):
            single_value = \
                SingleValue() \
                    .name(RegressionMetrics.MEDIAN_ABSOLUTE_ERROR.value) \
                    .value(mae) \
                    .mode(StatCategory.TIME_SERIES)
        else:
            raise MLOpsStatisticsException \
                ("For outputting median absolute error, mae should be of type numeric but got {}."
                 .format(type(mae)))

        return single_value
