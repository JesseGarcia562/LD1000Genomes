
Script="/u/scratch/j/jessegar/LD1000Genomes/code/estimateLDdecay2.py"


##TODO:
Population="YRI"
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
Population="YRI"
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
Population="YRI"
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
Population="YRI"
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
