#!/usr/bin/env python

# Wrapper for extract_snps.py
# Go into the folder containing the modules and then run the script as:
# wrapper_snps.py <distance threshold> 
# Roberto Lozano rjl278@cornell.edu

import sys
import re
import os
from itertools import islice
import subprocess

# Distance threshold variable
distance = sys.argv[1];

# Get a list with the modules inside the folder
modules = subprocess.check_output("ls -lh | grep -Po [a-z]+_module.txt$", shell=True)
module = modules.split()

# Run extract_snps.py on every module
for elements in module:
    os.system("extract_snps.py %s %s" %(elements, distance))