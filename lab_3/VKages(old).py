import requests
import json
import datetime
from bases.base_client import BaseClient

class VkAges(BaseClient):

    BASE_URL = 'https://api.vk.com/method/'

    def __init__(self, method):
        self.method = method
        self.http_method = 'get'

    def _get_data(self, method):
        response = requests.get(self.generate_url(method))
        return self.response_handler(response)

    def response_handler(self, response):
        json_dict = json.loads(response.text)
        return json_dict

    def generate_url(self, method):
        return '{0}{1}'.format(self.BASE_URL, method)

    def get_json_dict(self):
        return self._get_data(self.method)


def check_bdate(user):
    return ("bdate" in user.keys()) and (len(user["bdate"].split('.')) == 3)

def get_params(params):
    params_str = ''
    for key in params:
        params_str += '&%s=%s' % (key, params[key])
    return params_str

if __name__ == "__main__":
    name = raw_input('Enter vk name or id: ')

    vk_user = VkAges('users.get?user_ids=' + str(name))
    vk_user_json = vk_user.get_json_dict()
    vk_id = vk_user_json['response'][0]['uid']

    print(vk_id)
    print('Username VK: ' + vk_user_json['response'][0]['first_name'] +
          ' ' + vk_user_json['response'][0]['last_name'])

    args = {
        'user_id': vk_id,
        'fields': 'bdate',
        'v': '5.57'
    }

    friendFinder = VkAges('friends.get?' + get_params(args))
    friends = friendFinder.get_json_dict()['response']['items']

    now = datetime.date.today()
    age_dict = {}
    for friend in friends:
        if check_bdate(friend):
            d = friend['bdate'].split('.')
            bdate = datetime.date(int(d[2]), int(d[1]), int(d[0]))
            age = str((now - bdate)/365).split()[0]
            if age not in age_dict.keys():
                age_dict[age] = 0
            age_dict[age] += 1

    for key in sorted(age_dict):
        print (str(key) + ' ' + '#'.join('' for i in range(age_dict[key] + 1)))
