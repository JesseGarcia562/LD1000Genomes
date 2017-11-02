#!/bin/bash
#$ -cwd
#$ -V
#$ -N DoubletonsYRI
#$ -l h_data=4G,time=2:00:00
#$ -M eplau
#$ -m ea
#$ -t 1-22:1

#TODO
. /u/local/Modules/default/init/modules.sh
module load gcc/4.9.3
Population="YRI"
VariantFunc="Intergenic"
chrNum=${SGE_TASK_ID}
vcftools="/u/project/klohmuel/jessegar/vcftools/src/cpp/vcftools"
vcfsort="/u/project/klohmuel/jessegar/vcftools/src/perl/vcf-sort"

outDir='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'2/VariantSplit/Doubletons'
mkdir ${outDir}
inVCF="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/chr"${chrNum}"_10"${Population}"Annotated.vcf_"${VariantFunc}".recode.vcf"
outName=${outDir}/'chr_'${chrNum}'_10_'${Population}'_'${VariantFunc}'_doubletons'
LDOUTDir='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'2/VariantSplit/Doubletons/LDStats'
mkdir ${LDOUTDir}

${vcftools} --vcf ${inVCF} --non-ref-ac 2 --max-non-ref-ac 2 --recode --recode-INFO-all --out ${outName}



outName2=${LDOUTDir}/'chr_'${chrNum}'_10_'${Population}'_'${VariantFunc}'_LD'

${vcftools} --vcf ${outName}.recode.vcf --ld-window-bp 10000 --hap-r2 --out ${outName2}

#TODO

VariantFunc="Synonymous"
chrNum=${SGE_TASK_ID}
inVCF="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/chr"${chrNum}"_10"${Population}"Annotated.vcf_"${VariantFunc}".recode.vcf"
outName=${outDir}/'chr_'${chrNum}'_10_'${Population}'_'${VariantFunc}'_doubletons'
LDOUTDir='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'2/VariantSplit/Doubletons/LDStats'


${vcftools} --vcf ${inVCF} --non-ref-ac 2 --max-non-ref-ac 2 --recode --recode-INFO-all --out ${outName}



outName2=${LDOUTDir}/'chr_'${chrNum}'_10_'${Population}'_'${VariantFunc}'_LD'

${vcftools} --vcf ${outName}.recode.vcf --ld-window-bp 10000 --hap-r2 --out ${outName2}

#TODO

VariantFunc="Nonsynonymous"
chrNum=${SGE_TASK_ID}
inVCF="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/chr"${chrNum}"_10"${Population}"Annotated.vcf_"${VariantFunc}".recode.vcf"
outName=${outDir}/'chr_'${chrNum}'_10_'${Population}'_'${VariantFunc}'_doubletons'
LDOUTDir='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'2/VariantSplit/Doubletons/LDStats'


${vcftools} --vcf ${inVCF} --non-ref-ac 2 --max-non-ref-ac 2 --recode --recode-INFO-all --out ${outName}



outName2=${LDOUTDir}/'chr_'${chrNum}'_10_'${Population}'_'${VariantFunc}'_LD'

${vcftools} --vcf ${outName}.recode.vcf --ld-window-bp 10000 --hap-r2 --out ${outName2}

#TODO
VariantFunc="Intron"
chrNum=${SGE_TASK_ID}
inVCF="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/chr"${chrNum}"_10"${Population}"Annotated.vcf_"${VariantFunc}".recode.vcf"
outName=${outDir}/'chr_'${chrNum}'_10_'${Population}'_'${VariantFunc}'_doubletons'
LDOUTDir='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'2/VariantSplit/Doubletons/LDStats'


${vcftools} --vcf ${inVCF} --non-ref-ac 2 --max-non-ref-ac 2 --recode --recode-INFO-all --out ${outName}



outName2=${LDOUTDir}/'chr_'${chrNum}'_10_'${Population}'_'${VariantFunc}'_LD'

${vcftools} --vcf ${outName}.recode.vcf --ld-window-bp 10000 --hap-r2 --out ${outName2}


