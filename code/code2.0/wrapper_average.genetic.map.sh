#!/bin/bash


wd=/u/home/j/jessegar/project-klohmuel/LD1000GenomePolarizedVCF/GeneticMap

for i in {1..22}
do
python average_genetic_map.py --female_genetic_map ${wd}/chr${i}_female_noncarrier.gmap --male_genetic_map ${wd}/chr${i}_male_noncarrier.gmap --outfile ${wd}/chr${i}_average_noncarrier.gmap
done

