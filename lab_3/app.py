from base_client import BaseClient
import requests
import json
import datetime


class VkAges(BaseClient):
    def __init__(self, method):
        self.BASE_URL = 'https://api.vk.com/method/'
        self.method = method

    def get_dict_data(self):
        dict_data = json.loads(self.execute())
        return dict_data

    def _get_data(self, method):

    def response_handler(self, response):
        dict_data = json.loads(response.text)
        if "error" in dict_data.keys():
            raise Exception
        return response.text

    def get_params(self, args):




if __name__ == "__main__":
    name = input('Enter ID: ')
    vk_id = VkAges('users.get?user_ids=' + name)
    name = vk_id.get_dict_data()
    args = {
        "user_id": name['response'][0]['uid'],
        "fields": "bdate",

    }
    vk_friends = VkAges('friends.get?')
