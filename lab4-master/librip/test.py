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