#!/bin/bash
#$ -cwd
#$ -V
#$ -N subsetCHB2
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
mkdir '/u/scratch2/j/jessegar/1000GenomesLD/1000GVCF_subset/CHB2/'
outfile='/u/scratch2/j/jessegar/1000GenomesLD/1000GVCF_subset/CHB2/chr'${chrNum}'_10CHB.vcf'
##

Individuals=NA18567,NA18533,NA18570,NA18574,NA18642,NA18639,NA18647,NA18591,NA18618,NA18573,NA18624,NA18630,NA18544,NA18593,NA18614,NA18632,NA18550,NA18619,NA18599,NA18611,NA18535,NA18559,NA18555,NA18582,NA18745,NA18545,NA18595,NA18558,NA18615,NA18621,NA18616,NA18530,NA18603,NA18643,NA18549,NA18547,NA18592,NA18608,NA18749,NA18566,NA18645,NA18542,NA18531,NA18644,NA18634,NA18617,NA18638,NA18564,NA18622,NA18641

/u/project/klohmuel/tanya_data/softwares/vcftools_perl/src/perl/vcf-subset -c ${Individuals} ${vcf} > ${outfile}

