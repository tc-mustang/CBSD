#!/usr/bin/env python 

#   Extract Intersect genes with different trends (Up_down down_UP)
#   Depending on the file it would need some tweeks
#   rjl278@cornell.edu
#   File > output

import sys
import re
from itertools import islice

import gzip
lista = list()
lista_set = set()

######## List with the markers to be on the genetic map file

diccionario = dict()

with open(sys.argv[1]) as f:
    tmp = list()
    for line in f:
        a = line.split()
        key = a[0]
        diccionario.setdefault(key, [])
        diccionario[key].append(a[5])


for elements in diccionario.keys():
    if float(diccionario[elements][0]) > 0 and float(diccionario[elements][1]) < 0 :
        print elements
    elif float(diccionario[elements][1]) > 0 and float(diccionario[elements][0]) < 0 :
        print elements
              
