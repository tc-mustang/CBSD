#! /usr/bin/env python

import sys
import os
###comment
ped_file = sys.argv[1]
        
with open(ped_file) as h:
    for lines in h:
        a = lines.rstrip().split("\t")
        first = a[0].split(':')[0]
        second = a[2:]
        print first+"\t"+first + "\t" +"\t".join(second)
        
