# -*- coding: utf-8 -*-
# Итератор для удаления дубликатов


class Unique(object):
    def __init__(self, items, **kwargs):
        # Нужно реализовать конструктор
        # В качестве ключевого аргумента, конструктор должен принимать bool-параметр ignore_case,
        # в зависимости от значения которого будут считаться одинаковые строки в разном регистре
        # Например: ignore_case = True, Aбв и АБВ разные строки
        #           ignore_case = False, Aбв и АБВ одинаковые строки, одна из них удалится
        # По-умолчанию ignore_case = False
        if ('ignore_case' in kwargs.keys()) and (kwargs['ignore_case']):
            self.lst = [str(i).lower() for i in items]
        else:
            self.lst = items
        self.index = 0
        self.unique_arr = []

    def __next__(self):
        # Нужно реализовать __next__    

        while self.index < len(self.lst):
            if self.lst[self.index] in self.unique_arr:
                raise StopIteration
        self.index += 1
        return self.lst[self.index]

    def __iter__(self):
        return self
