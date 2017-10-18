#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load gcc/4.9.3

Population='CEU'
outDir='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'/VariantSplit'
mkdir ${outDir}

for i in {1..22}
do


vcftools="/u/project/klohmuel/jessegar/vcftools/src/cpp/vcftools"
inVCF='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'/chr'${i}'_10'${Population}'_rmHomozygous_Annotated.vcf.hg19_multianno.vcf'
outDir='/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/'${Population}'/VariantSplit'
fileName='/chr'${i}'_10'${Population}'Annotated.vcf'




#ExonicFunc.refGene=nonsynonymous_SNV is the mutation type of Nonsynymous mutations in exons
grep "ExonicFunc.refGene=nonsynonymous_SNV" ${inVCF} | gawk '{print $1,$2}'  > ${inVCF}_Nonsynonymous.bed

#ExonicFunc.refGene=synonymous_SNV is the mutation type of Synonymous mutations in exons
grep "ExonicFunc.refGene=synonymous_SNV" ${inVCF}  | gawk '{print $1,$2}'  > ${inVCF}_Synonymous.bed

#Func.refGene=intronic is the mutation type of Intronic mutations
grep "Func.refGene=intronic" ${inVCF}  | gawk '{print $1,$2}' > ${inVCF}_Intron.bed


#Func.refGene=UTR3 Func.refGene=UTR5 is the mutation type of Intergenic Mutations
grep -E "Func.refGene=UTR3|Func.refGene=UTR5" ${inVCF} | gawk '{print $1,$2}' > ${inVCF}_Intergenic.bed


sed -i '1i#chromosome position' ${inVCF}_Nonsynonymous.bed
sed -i '1i#chromosome position' ${inVCF}_Synonymous.bed
sed -i '1i#chromosome position' ${inVCF}_Intron.bed
sed -i '1i#chromosome position' ${inVCF}_Intergenic.bed



sed -i "s_/s_\t_g" ${inVCF}_Nonsynonymous.bed
sed -i "s_/s_\t_g" ${inVCF}_Synonymous.bed
sed -i "s_/s_\t_g" ${inVCF}_Intron.bed
sed -i "s_/s_\t_g" ${inVCF}_Intergenic.bed


#Counting the Variants
wc -l ${inVCF}_Nonsynonymous.bed
wc -l ${inVCF}_Synonymous.bed
wc -l ${inVCF}_Intron.bed
wc -l ${inVCF}_Intergenic.bed

##Filtering out different mutation types in RecessiveVCF
${vcftools} --vcf ${inVCF} --positions ${inVCF}_Nonsynonymous.bed --recode \
--recode-INFO-all --out ${outDir}'/'${fileName}_Nonsynonymous



${vcftools} --vcf ${inVCF} --positions ${inVCF}_Synonymous.bed --recode \
--recode-INFO-all --out ${outDir}'/'${fileName}_Synonymous



${vcftools} --vcf ${inVCF} --positions ${inVCF}_Intron.bed --recode \
--recode-INFO-all --out ${outDir}'/'${fileName}_Intron

${vcftools} --vcf ${inVCF} --positions ${inVCF}_Intergenic.bed --recode \
--recode-INFO-all --out ${outDir}'/'${fileName}_Intergenic

rm -f ${inVCF}_Nonsynonymous.bed
rm -f ${inVCF}_Synonymous.bed
rm -f ${inVCF}_Intron.bed
rm -f ${inVCF}_Intergenic.bed

done


