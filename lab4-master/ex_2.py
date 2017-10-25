# -*- coding: utf-8 -*-
#!/usr/bin/env python3

from librip.gens import gen_random
from librip.iterators import Unique

data1 = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2]
data2 = gen_random(1, 3, 10)
data3 = ['a', 'A', 'b', 'B']


# Реализация задания 2

a = Unique(data1)
b = Unique(data2)
c = Unique(data3)
d = Unique(data3, ignore_case=True)
drow = [a, b, c, d]
for i in drow:
    print (', '.join(str(x) for x in i))

