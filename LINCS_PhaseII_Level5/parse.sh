#!/bin/bash

#SBATCH --time=5:00:00   # walltime
#SBATCH --ntasks=8   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=32768M   # memory per CPU core

#Directory variables
redirectedTempFolder=tmp
softwareFolder=Software

#Downloaded in download.sh
sigFileName=$redirectedTempFolder/GSE70138_Broad_LINCS_sig_info_2017-03-06.txt.gz
gctxFileName=$redirectedTempFolder/LINCS_PhaseII_Level5.gctx
geneFile=$redirectedTempFolder/GSE70138_Broad_LINCS_gene_info_2017-03-06.txt.gz

#Will Create
dataOutFile=data.tsv.gz
metadataOutFile=metadata.tsv.gz

#Other Metadata files that are included in final output
cellInfo=$redirectedTempFolder/GSE70138_Broad_LINCS_cell_info_2017-04-28.txt.gz
pertInfo=$redirectedTempFolder/GSE70138_Broad_LINCS_pert_info_2017-03-06.txt.gz
sigMetrics=$redirectedTempFolder/GSE70138_Broad_LINCS_sig_metrics_2017-03-06.txt.gz

#miniconda is used to store panda software in environments need to activate environment
#source activate WishBuilderDependencies2 
source activate lincs_env

python2 parse.py $sigFileName $gctxFileName $metadataOutFile $dataOutFile $geneFile $cellInfo $pertInfo $sigMetrics
