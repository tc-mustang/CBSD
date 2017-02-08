#! /usr/bin/env python

import sys
import os
from itertools import islice
from collections import defaultdict


#### Description ####

'''
This script will transform the coseq output table to list of genes belonging to each module in separate files.
Needs a threshold value for the conditional probability of each gene belonging to a module.
Development version can be fund as a jupyter notebook
For bugs, rjl278@cornell.edu
'''

#### Variables ####

table = sys.argv[1]  # name of the table file
thresh = sys.argv[2] # threshold of the conditional probability of belonging to each module
output = sys.argv[3] # name of the output suffix (everything should look like module1.NC, module2.NI and so on)

#### Code ####

nmodules = 0
keys= list()
values = list()
d = dict()

# Load the files 

with open(table) as h:
    # Remove first line
    head = list(islice(h, 1))
    
    # Count the number of modules
    for elements in head:
        a = elements.split()
        nmodules = len(a)
        next
    
    # Remove the lines if none of the values reach the significance level         
    
    for elements in h:
        b = elements.split()
        
        lista = b[1:nmodules+1]
        listo = [float(i) for i in lista]
        
        # Remove genes with a conditional probability lower than 0.9
        if any(float(i) >= float(thresh) for i in listo):
            m = max(b[1:nmodules+1])
            indice = [i for i, j in enumerate(b[1:nmodules+1]) if j == m]
            index = indice[0]+1
            
        
            keys.append(index)
            values.append(b[0])

            if index in d:
                d[index] = d[index] + " " + (b[0])
            else:
                d[index] = (b[0])                 
        else: 
            next

# Create a folder to put all the module lists
if not os.path.exists(output):
    os.makedirs(output)
    
# Output the dictionary into separate files
for keys in d.keys():
    readyto = d[keys].split(" ")
    f1 = open('%s/module%s.%s' %(output,keys,output), 'w')
    for elements in readyto:
        printhis = elements + "      "
        f1.write(elements)    
        f1.write("\n")
        
f1.close()
    



