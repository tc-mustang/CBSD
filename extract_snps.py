#!/usr/bin/env python

import sys
import os

list_genes = sys.argv[1]
threshold = sys.argv[2]


IDs = list()
f1=open('tmp', 'w+')
        
with open(list_genes) as h:
    for lines in h:
        IDs.append(lines.rstrip())

with open("/home/DB/M.esculenta/V6_assembly/Annotation/V6_official/SNPs/gff.bed") as n:
    for lines in n:
        b = lines.split("\t")
        beg= int(threshold)
        end= int(threshold)
        
        resta=int(b[1])-beg
        if (b[3] in IDs and int(resta) < 0):
            f= b[0]+"\t"+str(0)+"\t"+str(end + int(b[2]))+"\t"+b[3]+"\n"
            f1.write(f)
        elif (b[3] in IDs and int(resta) > 0):
            f= b[0]+"\t"+str(int(b[1])-beg)+"\t"+str(end + int(b[2]))+"\t"+b[3]+"\n"    
            f1.write(f)

f1.close()

os.system("bedtools intersect -a tmp -b /home/DB2/Imputation/BEAGLE_imputation/CBSD/Imputed/Stage2/WGI_stage2.snps  -wa -wb > %s.intersect" %(list_genes))
#os.system("bedtools intersect -a tmp -b /home/DB2/Imputation/BEAGLE_imputation/CBSD/Imputed/Stage1/WGI_stage1.snps  -wa -wb > %s.intersect" %(list_genes))
#os.system("bedtools intersect -a tmp -b /home/DB2/Imputation/BEAGLE_imputation/CBSD/Imputed/Stage1/GBS_stage0.snps  -wa -wb > %s.intersect" %(list_genes))
os.system("awk -F\"\t\"  '{print$8}' %s.intersect | sort -n | uniq > %s.snps" %(list_genes, list_genes))

os.system("rm tmp")

