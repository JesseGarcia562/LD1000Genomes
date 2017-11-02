##Merging Binned LD
require(data.table)
setwd("/u/scratch/j/jessegar/1000GenomesLD/LDStats/YRI/BinnedLD")
#TODO SET PATH AND fileExtension
#Path is where the files are located "." means we are in the working directory
path="."
#FileExtension is the extension of the files you want to process
fileExtension <- "_LD.hap.ld_Binned$"
fileNames <- dir(path, pattern = fileExtension)
MergingBinnedStats <- function(LDFileName){
  LDFile <- LDFileName
  LDFile <- fread(LDFile)
  #Is this a summary with BGS? If completely neutral, no BGS. 
  if(grepl("YRI", LDFileName)){
    Population="YRI"
  } else if(grepl("CHB", LDFileName)) {
    Population="CHB"
  } else if(grepl("CEU", LDFileName)) {
    Population="CEU"
  } else {
    #Defense against not being properly formated. Needs h0.0 or h0.5
    stop("NOT A PROPERLY FORMATTED FILE. Data does not come from CEU,CHB, or YRI")
  }
  
  #Split
  LDFileNameSplit <- unlist(strsplit(LDFileName, split = "_"))
  
  print(LDFileNameSplit)
  
  
  
  
  #Mutation Type
  MutationType <- LDFileNameSplit[5]
  if(MutationType=="Intron"){
    MutationType <- "Intronic"
  } else if (MutationType=="Nonsynonymous"){
    MutationType <- "Nonsynonymous"
  } else if (MutationType=="Synonymous"){
    MutationType <-"Synonymous" 
  } else if (MutationType=="Intergenic"){
    MutationType <- "Intergenic"
  } else {
    #Defense against not being properly formated. Needs NeutralVCF, NonsynonymousVCF, SynonymousVCF
    stop("NOT A PROPERLY FORMATTED FILE (VCF type is wrong) Mutation Types do Not Match")
  }
  
  Chromosome <- LDFileNameSplit[2]

  #Attaching Attributes
  
  LDFile$Chromosome <- Chromosome
  LDFile$Population <- Population
  LDFile$Variant <- MutationType
  
  return(LDFile)
}


#Binning LD
require(data.table)


BinnedLDTableYRIAll <- data.frame(matrix(ncol = 10, nrow = 1))
colnames(BinnedLDTableYRIAll) <- c(c("BIN_START", "BIN_END", "DPRIMESUM", "NumberSNPs", "POSITIVE1DPrime", "NEGATIVE1DPrime", "RSQUAREDSum", "Chromosome", "Population", "Variant") )

#For loop to do the function

for(fileName in fileNames){
  cat("\n",fileName)
  ProcessedLDFile <-MergingBinnedStats(fileName)
  BinnedLDTableYRIAll <- rbind(BinnedLDTableYRIAll, ProcessedLDFile)
}

BinnedLDTableYRIAll <- BinnedLDTableYRIAll[-1,]

write.csv(BinnedLDTableYRIAll, file="BinnedLDTableYRIAll.csv", quote=FALSE)

