
#R Script that splits Neutral Regions from NRE Into Septrate Files Per Chromosome

######TODO:
#Set Path for Raw Neutral Regions
NeutralRegionPath <- "./data/results_Hard.tsv"

#Set Path for Neutral Regions Seperated by Chromosome to Go 
SplitPath <- "./data/NeutralRegions/"
#####

require(plyr)
dir.create(SplitPath)

NeutralRegions <- read.table(NeutralRegionPath, header = T)

#Function to Print seperate Files for each chromosome
SplitChrom <- function(NeutralRegionTable) write.table(NeutralRegionTable,
                                                     file=paste( SplitPath, NeutralRegionTable$chrom[[1]],"_output_from_nre.txt",sep=""),
                                                     quote = FALSE,
                                                     row.names = FALSE,
                                                     sep = "\t")



#Applies function to all chromosomes. 
d_ply(NeutralRegions, .(chrom), SplitChrom )

