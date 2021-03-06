# coding: utf-8

from __future__ import absolute_import
from datetime import date, datetime  # noqa: F401

from typing import List, Dict  # noqa: F401

from mcenter_server_api.models.base_model_ import Model
from mcenter_server_api import util


class ModelSourceDetails(Model):
    """NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).

    Do not edit the class manually.
    """

    def __init__(self, created_time=None, description=None, user=None):  # noqa: E501
        """ModelSourceDetails - a model defined in OpenAPI

        :param created_time: The created_time of this ModelSourceDetails.  # noqa: E501
        :type created_time: int
        :param description: The description of this ModelSourceDetails.  # noqa: E501
        :type description: str
        :param user: The user of this ModelSourceDetails.  # noqa: E501
        :type user: str
        """
        self.openapi_types = {
            'created_time': 'int',
            'description': 'str',
            'user': 'str'
        }

        self.attribute_map = {
            'created_time': 'createdTime',
            'description': 'description',
            'user': 'user'
        }

        self._created_time = created_time
        self._description = description
        self._user = user

    @classmethod
    def from_dict(cls, dikt) -> 'ModelSourceDetails':
        """Returns the dict as a model

        :param dikt: A dict.
        :type: dict
        :return: The ModelSource_details of this ModelSourceDetails.  # noqa: E501
        :rtype: ModelSourceDetails
        """
        return util.deserialize_model(dikt, cls)

    @property
    def created_time(self):
        """Gets the created_time of this ModelSourceDetails.


        :return: The created_time of this ModelSourceDetails.
        :rtype: int
        """
        return self._created_time

    @created_time.setter
    def created_time(self, created_time):
        """Sets the created_time of this ModelSourceDetails.


        :param created_time: The created_time of this ModelSourceDetails.
        :type created_time: int
        """

        self._created_time = created_time

    @property
    def description(self):
        """Gets the description of this ModelSourceDetails.


        :return: The description of this ModelSourceDetails.
        :rtype: str
        """
        return self._description

    @description.setter
    def description(self, description):
        """Sets the description of this ModelSourceDetails.


        :param description: The description of this ModelSourceDetails.
        :type description: str
        """

        self._description = description

    @property
    def user(self):
        """Gets the user of this ModelSourceDetails.


        :return: The user of this ModelSourceDetails.
        :rtype: str
        """
        return self._user

    @user.setter
    def user(self, user):
        """Sets the user of this ModelSourceDetails.


        :param user: The user of this ModelSourceDetails.
        :type user: str
        """

        self._user = user
