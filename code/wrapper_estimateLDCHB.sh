
Script="/u/scratch/j/jessegar/LD1000Genomes/code/estimateLDdecay2.py"


##TODO:
Population="CHB"
VariationType="Nonsynonymous"

outDir="/u/scratch/j/jessegar/1000GenomesLD/LDStats/${Population}/BinnedLD"
inDir="/u/scratch/j/jessegar/1000GenomesLD/LDStats/${Population}"
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

outDir="/u/scratch/j/jessegar/1000GenomesLD/LDStats/${Population}/BinnedLD"
inDir="/u/scratch/j/jessegar/1000GenomesLD/LDStats/${Population}"
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

outDir="/u/scratch/j/jessegar/1000GenomesLD/LDStats/${Population}/BinnedLD"
inDir="/u/scratch/j/jessegar/1000GenomesLD/LDStats/${Population}"
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

outDir="/u/scratch/j/jessegar/1000GenomesLD/LDStats/${Population}/BinnedLD"
inDir="/u/scratch/j/jessegar/1000GenomesLD/LDStats/${Population}"
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
