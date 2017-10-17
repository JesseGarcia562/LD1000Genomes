#!/bin/bash

#TODO:
ANNOVAR='/u/scratch/j/jessegar/1000GenomesLD/annovar/table_annovar.pl'
database='/u/scratch/j/jessegar/1000GenomesLD/annovar/'


# YRI
for i in {1..22}
do
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI/chr'${i}'_10YRI_rmHomozygous.vcf'
outVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI/chr'${i}'_10YRI_rmHomozygous_Annotated.vcf'
$ANNOVAR $inVCF ${database}/humandb/ -buildver hg19 -out $outVCF -remove -protocol refGene -operation g -nastring . -vcfinput
done

# CEU
for i in {1..22}
do
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CEU/chr'${i}'_10CEU_rmHomozygous.vcf'
outVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CEU/chr'${i}'_10CEU_rmHomozygous_Annotated.vcf'
$ANNOVAR $inVCF ${database}/humandb/ -buildver hg19 -out $outVCF -remove -protocol refGene -operation g -nastring . -vcfinput
done

# CHB
for i in {1..22}
do
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CHB/chr'${i}'_10CHB_rmHomozygous.vcf'
outVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CHB/chr'${i}'_10CHB_rmHomozygous_Annotated.vcf'
$ANNOVAR $inVCF ${database}/humandb/ -buildver hg19 -out $outVCF -remove -protocol refGene -operation g -nastring . -vcfinput
done

