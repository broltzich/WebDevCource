# -*- coding: utf-8 -*-
#!/usr/bin/env python3
import json
import sys
from librip.ctxmngrs import Timer
from librip.decorators import print_result
from librip.gens import field, gen_random
from librip.iterators import Unique as unique


path = 'data_light.json'



with open(path) as f:
    data = json.load(f)


@print_result
def f1(arg):
    return sorted(unique(field(arg, 'job-name'), ignore_case=True),
             key=lambda item: item.lower())


@print_result
def f2(arg):
    return list(filter(lambda x: 'программист' in x, arg))


@print_result
def f3(arg):
    return list(map(lambda x: x + ' с опытом Python', arg))


@print_result
def f4(arg):
    return(['%s, зарплата %s руб.' % (spec, sal) for spec, sal
            in zip(arg, gen_random(100000, 200000, len(arg)))])


with Timer():
    f4(f3(f2(f1(data))))
