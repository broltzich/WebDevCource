#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from librip.gens import field

goods = [
    {'title': 'Carpet', 'price': 2000, 'color': 'green'},
    {'title': 'Sofa', 'price': 5300, 'color': 'black'},
    {'title': 'Shelf', 'price': 7000, 'color': 'white'},
    {'title': 'Hanger', 'price': 800, 'color': 'white'}
]

# Реализация задания 1
#field(goods, 'title','color')

args = ['title', 'color']
a = []
for x, c in goods[0].items():
    if x in args:
        a.append("'%s': '%s'" % (x, c))
#print '{' + ', '.join(a) + '}'
field(goods, args)