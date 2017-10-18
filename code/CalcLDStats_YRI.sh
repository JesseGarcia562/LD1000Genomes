. /u/local/Modules/default/init/modules.sh
module load gcc/4.9.3

Population='YRI'
outDir='/u/scratch/j/jessegar/1000GenomesLD/LDStats/'${Population}
mkdir ${outDir}

for chrNUM in {1..22}
do
VariantFunc="Intergenic"
vcftools="/u/project/klohmuel/jessegar/vcftools/src/cpp/vcftools"
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'/VariantSplit/chr'${chrNUM}'_10'${Population}'Annotated.vcf_'${VariantFunc}'.recode.vcf'
outName=${outDir}/'chr_'${chrNUM}'_10_'${Population}'_'${VariantFunc}'_LD'
${vcftools} --vcf $inVCF --ld-window-bp 10000 --hap-r2 --out ${outName}
done

for chrNUM in {1..22}
do
VariantFunc="Nonsynonymous"
vcftools="/u/project/klohmuel/jessegar/vcftools/src/cpp/vcftools"
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'/VariantSplit/chr'${chrNUM}'_10'${Population}'Annotated.vcf_'${VariantFunc}'.recode.vcf'
outName=${outDir}/'chr_'${chrNUM}'_10_'${Population}'_'${VariantFunc}'_LD'
${vcftools} --vcf $inVCF --ld-window-bp 10000 --hap-r2 --out ${outName}
done


for chrNUM in {1..22}
do
VariantFunc="Synonymous"
vcftools="/u/project/klohmuel/jessegar/vcftools/src/cpp/vcftools"
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'/VariantSplit/chr'${chrNUM}'_10'${Population}'Annotated.vcf_'${VariantFunc}'.recode.vcf'
outName=${outDir}/'chr_'${chrNUM}'_10_'${Population}'_'${VariantFunc}'_LD'
${vcftools} --vcf $inVCF --ld-window-bp 10000 --hap-r2 --out ${outName}
done

for chrNUM in {1..22}
do
VariantFunc="Intron"
vcftools="/u/project/klohmuel/jessegar/vcftools/src/cpp/vcftools"
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'/VariantSplit/chr'${chrNUM}'_10'${Population}'Annotated.vcf_'${VariantFunc}'.recode.vcf'
outName=${outDir}/'chr_'${chrNUM}'_10_'${Population}'_'${VariantFunc}'_LD'
${vcftools} --vcf $inVCF --ld-window-bp 10000 --hap-r2 --out ${outName}
done
