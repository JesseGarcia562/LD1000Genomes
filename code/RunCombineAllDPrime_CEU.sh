#!/bin/bash
. /u/local/Modules/default/init/modules.sh

module load R
R CMD BATCH /u/scratch/j/jessegar/LD1000Genomes/code/CombineAllDPrime_CEU.sh
