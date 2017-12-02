#!/bin/bash
#$ -cwd
#$ -V
#$ -N LDDecCHB
#$ -l h_data=4G,time=00:45:00
#$ -M eplau
#$ -m ea





Script="/u/scratch/j/jessegar/LD1000Genomes/code/estimateLDdecay2.py"


##TODO:
Population="CHB"
VariationType="Nonsynonymous"

outDir="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/Doubletons/LDStats/BinnedLD"
inDir="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/Doubletons/LDStats"
mkdir ${outDir}

for chrNUM in {1..22}
do
inputFileName="chr_${chrNUM}_10_${Population}_${VariationType}_LD.hap.ld"

inputFile="${inDir}/${inputFileName}"
python ${Script} \
--input ${inputFile} \
--outfile ${outDir}/${inputFileName}_Binned \
--format vcftools \
--bin 250
done

##TODO:

VariationType="Synonymous"

outDir="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/Doubletons/LDStats/BinnedLD"
inDir="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/Doubletons/LDStats"
mkdir ${outDir}

for chrNUM in {1..22}
do
inputFileName="chr_${chrNUM}_10_${Population}_${VariationType}_LD.hap.ld"

inputFile="${inDir}/${inputFileName}"
python ${Script} \
--input ${inputFile} \
--outfile ${outDir}/${inputFileName}_Binned \
--format vcftools \
--bin 250
done

##TODO:

VariationType="Intron"

outDir="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/Doubletons/LDStats/BinnedLD"
inDir="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/Doubletons/LDStats"
mkdir ${outDir}

for chrNUM in {1..22}
do
inputFileName="chr_${chrNUM}_10_${Population}_${VariationType}_LD.hap.ld"

inputFile="${inDir}/${inputFileName}"
python ${Script} \
--input ${inputFile} \
--outfile ${outDir}/${inputFileName}_Binned \
--format vcftools \
--bin 250
done

##TODO:

VariationType="Intergenic"

outDir="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/Doubletons/LDStats/BinnedLD"
inDir="/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/"${Population}"2/VariantSplit/Doubletons/LDStats"
mkdir ${outDir}

for chrNUM in {1..22}
do
inputFileName="chr_${chrNUM}_10_${Population}_${VariationType}_LD.hap.ld"

inputFile="${inDir}/${inputFileName}"
python ${Script} \
--input ${inputFile} \
--outfile ${outDir}/${inputFileName}_Binned \
--format vcftools \
--bin 250
done

