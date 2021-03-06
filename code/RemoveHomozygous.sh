#!/bin/bash

# YRI
for i in {1..22}
do
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI/YRI_Chr'${i}'_EPORefAlleleRecode.vcf'
outVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI/chr'${i}'_10YRI_rmHomozygous.vcf'
grep -w -v "AC=0" ${inVCF} | grep -w -v "AC=20" > ${outVCF}
done

# CEU
for i in {1..22}
do
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CEU/CEU_Chr'${i}'_EPORefAlleleRecode.vcf'
outVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CEU/chr'${i}'_10CEU_rmHomozygous.vcf'
grep -w -v "AC=0" ${inVCF} | grep -w -v "AC=20" > ${outVCF}
done

# CHB
for i in {1..22}
do
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CHB/CHB_Chr'${i}'_EPORefAlleleRecode.vcf'
outVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CHB/chr'${i}'_10CHB_rmHomozygous.vcf'
grep -w -v "AC=0" ${inVCF} | grep -w -v "AC=20" > ${outVCF}
done

