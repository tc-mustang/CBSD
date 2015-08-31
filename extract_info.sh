#!/bin/bash

a=`pwd | cut -d "/" -f 8`
echo "Working with $a\\n"

b=`awk '{if($13<0.01)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |wc -l`
echo "Number of genes q value < 0.01 = $b"
up=`awk '{if($13<0.01)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |  awk '{if($10>0)print;}' |wc -l`
down=`awk '{if($13<0.01)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |  awk '{if($10<0)print;}' | wc -l`

echo "Number of upregulated q value < 0.01 = $up"
echo "Number of downregulated q value < 0.01 = $down"

awk '{if($13<0.01)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |wc -l > $a\_$b\_0.01.list
awk '{if($13<0.01)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |  awk '{if($10>0)print;}' |wc -l > $a\_$up\_0.01_up.list
awk '{if($13<0.01)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |  awk '{if($10<0)print;}' |wc -l > $a\_$down\_0.01_down.list



echo "\n"


c=`awk '{if($13<0.05)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |wc -l`
echo "Number of genes q value < 0.05 = $c"
up1=`awk '{if($13<0.05)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |  awk '{if($10>0)print;}' |wc -l`
down1=`awk '{if($13<0.05)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |  awk '{if($10<0)print;}' | wc -l`

echo "Number of upregulated q value < 0.05 = $up1"
echo "Number of downregulated q value < 0.05 = $down1"


awk '{if($13<0.05)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |wc -l > $a\_$c\_0.05.list
awk '{if($13<0.05)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |  awk '{if($10>0)print;}' |wc -l > $a\_$up1\_0.05_up.list
awk '{if($13<0.05)print;}' gene_exp.diff | awk '{if($8>1 && $9>1)print;}' |  awk '{if($10<0)print;}' |wc -l > $a\_$down1\_0.05_down.list
