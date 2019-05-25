# -*- :coding utf-8 -*-
import time


class Timer:
    def __init__(self):
        pass

    def __enter__(self):
        self.start_time = time.time()

    def __exit__(self, exc_type, exc_val, exc_tb):
        print(time.time() - self.start_time)
