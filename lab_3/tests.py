# -*- coding: utf-8 -*-

class Imp:
    def __init__(self, lst):
        self.lst = lst
        self.index = 0

    def next(self):
        if self.index == len(self.lst) - 1:
            raise StopIteration
        self.index += 1
        return self.lst[self.index]

    def __iter__(self):
        # Чтобы можно было вызывать iter() над нашим объектом
        return self


arl = Imp([1, 2, 3, 4])
for i in arl:
    print i