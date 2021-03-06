# coding: utf-8

from __future__ import absolute_import
from datetime import date, datetime  # noqa: F401

from typing import List, Dict  # noqa: F401

from mcenter_server_api.models.base_model_ import Model
from mcenter_server_api import util


class Agent(Model):
    """NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).

    Do not edit the class manually.
    """

    def __init__(self, address=None, created=None, created_by=None, id=None):  # noqa: E501
        """Agent - a model defined in OpenAPI

        :param address: The address of this Agent.  # noqa: E501
        :type address: str
        :param created: The created of this Agent.  # noqa: E501
        :type created: int
        :param created_by: The created_by of this Agent.  # noqa: E501
        :type created_by: str
        :param id: The id of this Agent.  # noqa: E501
        :type id: str
        """
        self.openapi_types = {
            'address': 'str',
            'created': 'int',
            'created_by': 'str',
            'id': 'str'
        }

        self.attribute_map = {
            'address': 'address',
            'created': 'created',
            'created_by': 'createdBy',
            'id': 'id'
        }

        self._address = address
        self._created = created
        self._created_by = created_by
        self._id = id

    @classmethod
    def from_dict(cls, dikt) -> 'Agent':
        """Returns the dict as a model

        :param dikt: A dict.
        :type: dict
        :return: The Agent of this Agent.  # noqa: E501
        :rtype: Agent
        """
        return util.deserialize_model(dikt, cls)

    @property
    def address(self):
        """Gets the address of this Agent.


        :return: The address of this Agent.
        :rtype: str
        """
        return self._address

    @address.setter
    def address(self, address):
        """Sets the address of this Agent.


        :param address: The address of this Agent.
        :type address: str
        """
        if address is None:
            raise ValueError("Invalid value for `address`, must not be `None`")  # noqa: E501

        self._address = address

    @property
    def created(self):
        """Gets the created of this Agent.


        :return: The created of this Agent.
        :rtype: int
        """
        return self._created

    @created.setter
    def created(self, created):
        """Sets the created of this Agent.


        :param created: The created of this Agent.
        :type created: int
        """
        if created is not None and created < 0:  # noqa: E501
            raise ValueError("Invalid value for `created`, must be a value greater than or equal to `0`")  # noqa: E501

        self._created = created

    @property
    def created_by(self):
        """Gets the created_by of this Agent.


        :return: The created_by of this Agent.
        :rtype: str
        """
        return self._created_by

    @created_by.setter
    def created_by(self, created_by):
        """Sets the created_by of this Agent.


        :param created_by: The created_by of this Agent.
        :type created_by: str
        """

        self._created_by = created_by

    @property
    def id(self):
        """Gets the id of this Agent.


        :return: The id of this Agent.
        :rtype: str
        """
        return self._id

    @id.setter
    def id(self, id):
        """Sets the id of this Agent.


        :param id: The id of this Agent.
        :type id: str
        """

        self._id = id
