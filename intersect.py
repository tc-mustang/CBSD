#!/usr/bin/env python 

import sys
import re

lista = list()
lista2 = list()

intersect = list()
Namikonga = list()
Alberts = list()

with open(sys.argv[1]) as f:
    for line in f:
        lista.append(line)
        
with open(sys.argv[2]) as f:
    for line in f:
        lista2.append(line)
        if line in lista:
            intersect.append(line.rstrip())
        else:
            Alberts.append(line.rstrip())
            
with open(sys.argv[1]) as f:
    for line in f:
        if line not in lista2:
            Namikonga.append(line.rstrip())
            

f1=open('Intersect.snps', 'w+')
f1.write("\n".join(intersect))
f1.close()

f1=open('Namikonga_uniq.snps', 'w+')
f1.write("\n".join(Namikonga))
f1.close()

f1=open('Alberts_uniq.snps', 'w+')
f1.write("\n".join(Alberts))
f1.close()