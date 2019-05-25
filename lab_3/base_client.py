class BaseClient:
  
    # URL vk api
    BASE_URL = 'https://api.vk.com/method/'

    method = None
    # GET, POST, ...
    http_method = None


    def get_params(self):
        return None


    def get_json(self):
        return None


    def get_headers(self):
        return None


    def generate_url(self, method):
        return '{0}{1}'.format(self.BASE_URL, method)


    def _get_data(self, method):
        response = None



        return self.response_handler(response)


    def response_handler(self, response):
        return response


    def execute(self):
        return self._get_data(self.method)
