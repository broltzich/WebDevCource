#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from __future__ import print_function
from librip.gens import field, gen_random


goods = [
    {'title': 'Carpet', 'price': 2000, 'color': 'green'},
    {'title': 'Sofa', 'price': 5300, 'color': 'black'},
    {'title': 'Shelf', 'price': 7000, 'color': 'white'},
    {'title': 'Hanger', 'price': 800, 'color': 'white'}
]

# Реализация задания 1


print(', '.join(field(goods, 'title')))

for i in field(goods, 'title', 'price'):
    print(i, end=', ')

print()


for i in gen_random(1, 11, 4):
    print(i)