#!/bin/bash
#$ -cwd
#$ -V
#$ -N RemoveEdgesAndFreqFilt_CHB
#$ -l h_data=4G,time=00:30:00
#$ -M eplau
#$ -m ea
#$ -t 1-22:1

#CHB

#Lets use chrNum instead of i Next time...
i=${SGE_TASK_ID}

#TODO
workDir='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CHB'
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/CHB/chr'${i}'_10CHB_rmHomozygous_Annotated.vcf.hg19_multianno.vcf'
vcftools="/u/project/klohmuel/jessegar/vcftools/src/cpp/vcftools"
vcfsort="/u/project/klohmuel/jessegar/vcftools/src/perl/vcf-sort"

. /u/local/Modules/default/init/modules.sh
module load perl


. /u/local/Modules/default/init/modules.sh
module load gcc/4.9.3

#Sorting vcf
$vcfsort ${inVCF} > ${inVCF}.tmp


#Removing Low and High Frequency SNPS
${vcftools} --vcf ${inVCF}.tmp --maf 0.05 --max-maf 0.95 --recode --recode-INFO-all --out ${inVCF}.tmp2


#Enter How much must be removed off from both edges to remove edge effects
#TODO:
removeOffVCFForEdge=1000000
sizeOfChromosome=$(tail -1l ${inVCF}.tmp2.recode.vcf | awk '{print $2}')



##STEP 2: Creating BED File to Remove Edges. 


chromosomeStart=${removeOffVCFForEdge}
chromosomeEnd=$((sizeOfChromosome-removeOffVCFForEdge))


cat > ${workDir}/removeEdges_${i}  << EOM
#chromosome start end
${i} ${chromosomeStart} ${chromosomeEnd}
EOM

sed 's_ _\t_g' ${workDir}/removeEdges_${i}  > ${workDir}/removeEdges_${i}.bed

. /u/local/Modules/default/init/modules.sh
module load bedtools


bedtools intersect -b ${workDir}/removeEdges_${i}.bed -a ${inVCF}.tmp2.recode.vcf -header > ${inVCF}.tmp3

