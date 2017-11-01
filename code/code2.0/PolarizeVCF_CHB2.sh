#!/bin/bash
#$ -cwd
#$ -V
#$ -N PolarizeCHB2
#$ -l h_data=4G,time=00:45:00
#$ -M eplau
#$ -m ea
#$ -t 1-22:1







in_dir='/u/scratch/j/jessegar/1000GenomesLD/1000GVCF_subset/CHB2'
out_dir='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CHB2'
EPO_fasta='/u/scratch/j/jessegar/LD1000Genomes/data/homo_sapiens_ancestor_GRCh37_e71'

mkdir ${out_dir}

CHROM=${SGE_TASK_ID}


Polarizer=/u/scratch/j/jessegar/1000GenomesLD/scripts/ForJesse/AssignEPOAncestral_Allele_rmLowQual.py
MasterFile_vcfin=${in_dir}/'chr'${CHROM}'_10CHB.vcf'
anc_allele=${EPO_fasta}/'homo_sapiens_ancestor_'${CHROM}'.fa'
ancRecode_intout=${out_dir}/'Intermediate_CHB_EPORecode_Chr'${CHROM}'.tmp'
ancRecode_vcfout=${out_dir}/'CHB_Chr'${CHROM}'_EPORefAlleleRecode.vcf'

source /u/local/Modules/default/init/modules.sh
module load python 

python ${Polarizer} ${anc_allele} ${MasterFile_vcfin} ${ancRecode_intout} ${ancRecode_vcfout}

sleep 200
