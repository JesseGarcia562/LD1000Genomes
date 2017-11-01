#!/bin/bash
#$ -cwd
#$ -V
#$ -N subsetYRI
#$ -l h_data=2G,time=24:00:00
#$ -M eplau
#$ -m ea
#$ -t 1-22:1

. /u/local/Modules/default/init/modules.sh
module load perl

export PERL5LIB=$PERL5LIB:/u/project/klohmuel/tanya_data/softwares/vcftools_perl/src/perl/

chrNum=${SGE_TASK_ID}

##TODO
vcf='/u/project/klohmuel/1000genomes/vcfs_zipped/ALL.chr'${chrNum}'.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz'
mkdir '/u/scratch2/j/jessegar/1000GenomesLD/1000GVCF_subset/YRI2/'
outfile='/u/scratch2/j/jessegar/1000GenomesLD/1000GVCF_subset/YRI2/chr'${chrNum}'_10YRI.vcf'
##

Individuals=NA18907,NA19235,NA18867,NA18933,NA18853,NA19108,NA18917,NA18923,NA18908,NA19247,NA18489,NA18510,NA18915,NA18881,NA19149,NA19131,NA19092,NA19225,NA18504,NA19239,NA18502,NA18916,NA19095,NA18912,NA19222,NA19213,NA18871,NA19146,NA19198,NA18520,NA19118,NA18877,NA19209,NA19153,NA18517,NA18488,NA19184,NA18523,NA19214,NA19119,NA18873,NA19138,NA18879,NA19117,NA18861,NA18924,NA19207,NA19238,NA18909,NA19130

/u/project/klohmuel/tanya_data/softwares/vcftools_perl/src/perl/vcf-subset -c ${Individuals} ${vcf} > ${outfile}

