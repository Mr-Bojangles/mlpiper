# coding: utf-8

from __future__ import absolute_import
from datetime import date, datetime  # noqa: F401

from typing import List, Dict  # noqa: F401

from mcenter_server_api.models.base_model_ import Model
from mcenter_server_api import util


class DataComparisonView(Model):
    """NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).

    Do not edit the class manually.
    """

    def __init__(self, attribute=None, name=None, series=None, similarity_score=None, type=None):  # noqa: E501
        """DataComparisonView - a model defined in OpenAPI

        :param attribute: The attribute of this DataComparisonView.  # noqa: E501
        :type attribute: str
        :param name: The name of this DataComparisonView.  # noqa: E501
        :type name: str
        :param series: The series of this DataComparisonView.  # noqa: E501
        :type series: List[DataComparisonViewSeries]
        :param similarity_score: The similarity_score of this DataComparisonView.  # noqa: E501
        :type similarity_score: float
        :param type: The type of this DataComparisonView.  # noqa: E501
        :type type: str
        """
        self.openapi_types = {
            'attribute': 'str',
            'name': 'str',
            'series': 'List[DataComparisonViewSeries]',
            'similarity_score': 'float',
            'type': 'str'
        }

        self.attribute_map = {
            'attribute': 'attribute',
            'name': 'name',
            'series': 'series',
            'similarity_score': 'similarityScore',
            'type': 'type'
        }

        self._attribute = attribute
        self._name = name
        self._series = series
        self._similarity_score = similarity_score
        self._type = type

    @classmethod
    def from_dict(cls, dikt) -> 'DataComparisonView':
        """Returns the dict as a model

        :param dikt: A dict.
        :type: dict
        :return: The DataComparisonView of this DataComparisonView.  # noqa: E501
        :rtype: DataComparisonView
        """
        return util.deserialize_model(dikt, cls)

    @property
    def attribute(self):
        """Gets the attribute of this DataComparisonView.


        :return: The attribute of this DataComparisonView.
        :rtype: str
        """
        return self._attribute

    @attribute.setter
    def attribute(self, attribute):
        """Sets the attribute of this DataComparisonView.


        :param attribute: The attribute of this DataComparisonView.
        :type attribute: str
        """

        self._attribute = attribute

    @property
    def name(self):
        """Gets the name of this DataComparisonView.


        :return: The name of this DataComparisonView.
        :rtype: str
        """
        return self._name

    @name.setter
    def name(self, name):
        """Sets the name of this DataComparisonView.


        :param name: The name of this DataComparisonView.
        :type name: str
        """

        self._name = name

    @property
    def series(self):
        """Gets the series of this DataComparisonView.


        :return: The series of this DataComparisonView.
        :rtype: List[DataComparisonViewSeries]
        """
        return self._series

    @series.setter
    def series(self, series):
        """Sets the series of this DataComparisonView.


        :param series: The series of this DataComparisonView.
        :type series: List[DataComparisonViewSeries]
        """

        self._series = series

    @property
    def similarity_score(self):
        """Gets the similarity_score of this DataComparisonView.


        :return: The similarity_score of this DataComparisonView.
        :rtype: float
        """
        return self._similarity_score

    @similarity_score.setter
    def similarity_score(self, similarity_score):
        """Sets the similarity_score of this DataComparisonView.


        :param similarity_score: The similarity_score of this DataComparisonView.
        :type similarity_score: float
        """

        self._similarity_score = similarity_score

    @property
    def type(self):
        """Gets the type of this DataComparisonView.


        :return: The type of this DataComparisonView.
        :rtype: str
        """
        return self._type

    @type.setter
    def type(self, type):
        """Sets the type of this DataComparisonView.


        :param type: The type of this DataComparisonView.
        :type type: str
        """

        self._type = type
