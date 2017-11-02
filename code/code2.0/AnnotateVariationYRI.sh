#!/bin/bash
#$ -cwd
#$ -V
#$ -N AnnotateVariantsYRI
#$ -l h_data=4G,time=2:00:00
#$ -M eplau
#$ -m ea
#$ -t 1-22:1

#TODO:
ANNOVAR='/u/scratch/j/jessegar/1000GenomesLD/annovar/table_annovar.pl'
database='/u/scratch/j/jessegar/1000GenomesLD/annovar/'


# YRI
chrNum=${SGE_TASK_ID}
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI2/YRI_Chr'${chrNum}'_EPORefAlleleRecode_ACFIX_rmHomo.vcf'
outVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI2/chr'${chrNum}'_10YRI_rmHomozygous_Annotated.vcf'
$ANNOVAR $inVCF ${database}/humandb/ -buildver hg19 -out $outVCF -remove -protocol refGene -operation g -nastring . -vcfinput
