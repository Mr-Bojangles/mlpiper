# coding: utf-8

from __future__ import absolute_import
from datetime import date, datetime  # noqa: F401

from typing import List, Dict  # noqa: F401

from mcenter_server_api.models.base_model_ import Model
from mcenter_server_api import util


class InlineResponse2001(Model):
    """NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).

    Do not edit the class manually.
    """

    def __init__(self, token=None):  # noqa: E501
        """InlineResponse2001 - a model defined in OpenAPI

        :param token: The token of this InlineResponse2001.  # noqa: E501
        :type token: str
        """
        self.openapi_types = {
            'token': 'str'
        }

        self.attribute_map = {
            'token': 'token'
        }

        self._token = token

    @classmethod
    def from_dict(cls, dikt) -> 'InlineResponse2001':
        """Returns the dict as a model

        :param dikt: A dict.
        :type: dict
        :return: The inline_response_200_1 of this InlineResponse2001.  # noqa: E501
        :rtype: InlineResponse2001
        """
        return util.deserialize_model(dikt, cls)

    @property
    def token(self):
        """Gets the token of this InlineResponse2001.


        :return: The token of this InlineResponse2001.
        :rtype: str
        """
        return self._token

    @token.setter
    def token(self, token):
        """Sets the token of this InlineResponse2001.


        :param token: The token of this InlineResponse2001.
        :type token: str
        """

        self._token = token