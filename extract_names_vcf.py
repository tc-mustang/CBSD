#!/usr/bin/env python

import sys
import re
import itertools
from operator import itemgetter

dosage = sys.argv[1]
names = sys.argv[2]

IDs = list()
columns = list()

columns.append(0)

header = str()
matches = list()

with open(names) as n:
        for lines in n:
                IDs.append(lines)
        
with open(dosage) as g:
        header = g.readline()
        
        a = header.split("\t")
     

print "Los siguientes IDs no se encuentran en el dosage file:"

for elements in IDs:
        regex = elements.rstrip()+":*\d*"
        #print regex
        
        if re.search(regex,header):
                out = re.findall(regex, header, re.IGNORECASE)
                matches.append(out)
        else:
                next
                #print elements.rstrip() 

extract = list(itertools.chain(*matches))



###################################################################### extract the index of every match ##########################################################

for elements in extract:
        try:
                tmp = a.index(elements)
                columns.append(tmp)
        except:
                next



with open(dosage) as g:
        for lines in g:
                a = lines.split("\t")
                b = itemgetter(*columns)(a)
                print "\t".join(map(str,b))
        




