# -*- :coding utf-8 -*-


def print_result(func):
    def wrapped():
        result = func()
        print(func.__name__)
        if type(result) == dict:
            for key, value in result.items():
                print('%s = %s' %(key, value))
        elif type(result) == list:
            for i in result:
                print(i)
        else:
            print(result)

        return result
    return wrapped
