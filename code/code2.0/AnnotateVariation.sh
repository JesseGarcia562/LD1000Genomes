#!/bin/bash
#$ -cwd
#$ -V
#$ -N AnnotateVariants
#$ -l h_data=4G,time=2:00:00
#$ -M eplau
#$ -m ea


#TODO:
ANNOVAR='/u/scratch/j/jessegar/1000GenomesLD/annovar/table_annovar.pl'
database='/u/scratch/j/jessegar/1000GenomesLD/annovar/'


# YRI
for i in {1..22}
do
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI2/YRI_Chr'${i}'_EPORefAlleleRecode_ACFIX_rmHomo.vcf'
outVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI2/chr'${i}'_10YRI_rmHomozygous_Annotated.vcf'
$ANNOVAR $inVCF ${database}/humandb/ -buildver hg19 -out $outVCF -remove -protocol refGene -operation g -nastring . -vcfinput
done

# CEU
for i in {1..22}
do
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CEU2/CEU_Chr'${i}'_EPORefAlleleRecode_ACFIX_rmHomo.vcf'
outVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CEU2/chr'${i}'_10CEU_rmHomozygous_Annotated.vcf'
$ANNOVAR $inVCF ${database}/humandb/ -buildver hg19 -out $outVCF -remove -protocol refGene -operation g -nastring . -vcfinput
done

# CHB
for i in {1..22}
do
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CHB2/CHB_Chr'${i}'_EPORefAlleleRecode_ACFIX_rmHomo.vcf'
outVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CHB2/chr'${i}'_10CHB_rmHomozygous_Annotated.vcf'
$ANNOVAR $inVCF ${database}/humandb/ -buildver hg19 -out $outVCF -remove -protocol refGene -operation g -nastring . -vcfinput
done
