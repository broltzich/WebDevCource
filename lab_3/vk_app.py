import requests
import json
import datetime
from bases.base_client import BaseClient

class IdFinder(BaseClient):

    def __init__(self, screen_name):

        self.screen_name = screen_name

    def _get_data(self, method):
        response = requests.get()
        return self.response_handler(response)

