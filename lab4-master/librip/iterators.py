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
        self.ignore_case = kwargs.get('ignore_case', False)
        self.index = 0
        self.item_set = set()
        self.items = iter(items)

    def next(self):
        # Нужно реализовать __next__

        for i in self.items:
            if i is not None:
                original = i.encode('utf-8')
                if self.ignore_case:
                    i = i.encode('utf-8').lower()
                if i not in self.item_set:
                    self.item_set.add(i)
                    return original
        raise StopIteration()

    def __iter__(self):
        return self
