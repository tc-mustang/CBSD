#!/bin/bash

awk -F"\t" '{print$10"\t"$14"\t"$18"\t"$22"\t"$26}' genes.fpkm_tracking > WGCNA/Alberts_WGCNA.matrix

awk -F"\t" '{for(i=1;i<=NF;i++) if($i<1) {$i="0"}}1' OFS="\t" Alberts_WGCNA.matrix > Alberts.matrix

log_transform_GSE_matrix.pl -i Alberts_WGCNA.matrix -o Alberts_matrix_log

coefficient_of_variation_filtering_simple.pl  -i Alberts_matrix_log  -o Alberts_filtered_1  -c 1

R --slave --args Alberts_filtered_1 Alberts /home/DB/M.esculenta/CBSD_RNASeq_V6/CUFFDIFF/DIFF/Alberts_WGCNA/WGCNA/ < /home/roberto/Desktop/RNAseq/WGCNA/wgcna_scripts_for_roberto/wgcna_initial_sample_clustering_simple_parameters.R

R --slave --args Alberts-dataInput.RData Alberts /home/DB/M.esculenta/CBSD_RNASeq_V6/CUFFDIFF/DIFF/Alberts_WGCNA/WGCNA < /home/roberto/Desktop/RNAseq/WGCNA/wgcna_scripts_for_roberto/wgcna_pick_threshold_power_simple_parameters.R

R --slave --args Alberts-threshold_data.RData Alberts_13_0.6 13 0.6 signed /home/DB/M.esculenta/CBSD_RNASeq_V6/CUFFDIFF/DIFF/Alberts_WGCNA/WGCNA < /home/roberto/Desktop/RNAseq/WGCNA/wgcna_scripts_for_roberto/wgcna_create_and_plot_modules_simple_paramemters.R

R --slave --args  Alberts_26_0.4-networkConstruction-auto.RData  Alberts_26_0.4 /home/DB/M.esculenta/CBSD_RNASeq_V6/CUFFDIFF/DIFF/Alberts_WGCNA/WGCNA/0.4  <  /home/roberto/Desktop/RNAseq/WGCNA/wgcna_scripts_for_roberto/wgcna_extract_module_data_simple_parameters.R

extract_module_level_expression_data_non_rice.pl -e Alberts_WGCNA.matrix -d Alberts_26_0.4/


######### Selecting for differentially expressed genes and setting values lower than 1 to 0 ###########

awk -F"\t" '{print$10"\t"$14"\t"$18"\t"$22"\t"$26}' genes.fpkm_tracking > WGCNA/Alberts_WGCNA.matrix

grep -f ../../Results/ALL_0.05.list Alberts_WGCNA.matrix > Alberts_WGCNA.filtered.matrix

awk -F"\t" '{for(i=1;i<=NF;i++) if($i<1) {$i="0"}}1' OFS="\t" Alberts_WGCNA.filtered.matrix > Alberts_differential.matrix

log_transform_GSE_matrix.pl -i Alberts_differential.matrix -o Alberts_matrix_log

coefficient_of_variation_filtering_simple.pl  -i Alberts_matrix_log  -o Alberts_filtered_0.7  -c 1

R --slave --args Alberts_filtered_0.7 Alberts /home/DB/M.esculenta/CBSD_RNASeq_V6/CUFFDIFF/DIFF/Alberts_WGCNA/WGCNA/ < /home/roberto/Desktop/RNAseq/WGCNA/wgcna_scripts_for_roberto/wgcna_initial_sample_clustering_simple_parameters.R

R --slave --args Alberts-dataInput.RData Alberts /home/DB/M.esculenta/CBSD_RNASeq_V6/CUFFDIFF/DIFF/Alberts_WGCNA/WGCNA < /home/roberto/Desktop/RNAseq/WGCNA/wgcna_scripts_for_roberto/wgcna_pick_threshold_power_simple_parameters.R


#create WGCNA folder






