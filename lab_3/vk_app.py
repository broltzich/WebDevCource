import requests
import json
import datetime
from base_client import BaseClient

class IdFinder(BaseClient):

    def __init__(self, screen_name):
        self.screen_name = screen_name
        self.method = 'users.get?user_ids=' + str(screen_name)

    def _get_data(self, method):
        response = requests.get(self.generate_url(self.method))
        return self.response_handler(response)

    def response_handler(self, response):
        response = json.loads(response.text)
        return response['response'][0]['uid']


class FriendFinder(BaseClient):

    def __init__(self, person_id):
        self.method = 'friends.get?'
        self.person_id = person_id
        self.params = {
            'user_id': str(self.person_id),
            'fields': 'bdate',
            'v': '5.57'
        }

    def get_params(self, method, params):
        params_str = ''
        for key in params:
            params_str += '%s=%s&' % (key, params[key])
        return method + params_str

    def _get_data(self, method):
        response = requests.get(self.generate_url(self.get_params(self.method, self.params)))
        print(self.generate_url(self.get_params(self.method, self.params)))
        return self.response_handler(response)

    def response_handler(self, response):
        self.response = json.loads(response.text)
        now = datetime.date.today()
        age_dict = {}

        for item in self.response['response']['items']:
            if ("bdate" in item.keys()) and (len(item["bdate"].split('.')) == 3):
                d = item['bdate'].split('.')
                bdate = datetime.date(int(d[2]), int(d[1]), int(d[0]))
                age = str((now - bdate) / 365).split()[0]
                if age not in age_dict.keys():
                    age_dict[age] = 0
                age_dict[age] += 1
        return age_dict


