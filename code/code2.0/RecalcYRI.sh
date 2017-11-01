#!/bin/bash
#$ -cwd
#$ -V
#$ -N recalcYRI
#$ -l h_data=4G,time=00:45:00
#$ -M eplau
#$ -m ea
#$ -t 1-22:1

. /u/local/Modules/default/init/modules.sh
module load perl

export PERL5LIB=$PERL5LIB:/u/project/klohmuel/tanya_data/softwares/vcftools_perl/src/perl/

chrNum=${SGE_TASK_ID}
##TODO
vcf='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI2/YRI_Chr'${chrNum}'_EPORefAlleleRecode.vcf'
outfile='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI2/YRI_Chr'${chrNum}'_EPORefAlleleRecode_ACFIX.vcf.tmp'
outfile2='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/YRI2/YRI_Chr'${chrNum}'_EPORefAlleleRecode_ACFIX_rmHomo.vcf'
##

/u/project/klohmuel/tanya_data/softwares/vcftools_perl/src/perl/fill-an-ac ${vcf} > ${outfile}



grep -w -v "AC=0" ${outfile} | grep -w -v "AC=100" > ${outfile2}



