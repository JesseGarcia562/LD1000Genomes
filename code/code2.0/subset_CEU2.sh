#!/bin/bash
#$ -cwd
#$ -V
#$ -N subsetCEU2
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
mkdir '/u/scratch2/j/jessegar/1000GenomesLD/1000GVCF_subset/CEU2/'
outfile='/u/scratch2/j/jessegar/1000GenomesLD/1000GVCF_subset/CEU2/chr'${chrNum}'_10CEU.vcf'
##

Individuals=NA12827,NA11843,NA07037,NA11829,NA11992,NA11831,NA10851,NA11920,NA12814,NA07056,NA12413,NA12154,NA12004,NA12815,NA12414,NA11892,NA12400,NA12776,NA12283,NA12156,NA12144,NA12347,NA12340,NA12777,NA12751,NA11994,NA07051,NA12872,NA12750,NA11918,NA11894,NA12749,NA11930,NA11933,NA11995,NA12044,NA12286,NA12046,NA12763,NA07347,NA06994,NA12341,NA06989,NA11931,NA12348,NA12716,NA11932,NA12874,NA12890,NA12830


/u/project/klohmuel/tanya_data/softwares/vcftools_perl/src/perl/vcf-subset -c ${Individuals} ${vcf} > ${outfile}

