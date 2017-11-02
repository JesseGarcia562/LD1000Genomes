SimulationLDDir="/u/scratch/j/jessegar/LdStastistics"
Script="/u/scratch/j/jessegar/LD1000Genomes/code/estimateLDdecay2.py"


outDir="${SimulationLDDir}/BinnedLD"

mkdir ${outDir}
cd ${SimulationLDDir}

for fileName in *Ld.hap.ld
do
python ${Script} \
--input ${fileName} \
--outfile ${outDir}/${fileName}_Binned \
--format vcftools \
--bin 250
done
