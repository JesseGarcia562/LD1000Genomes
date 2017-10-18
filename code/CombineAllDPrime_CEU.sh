##Summing D Primes


##Dprime Statistics
require(data.table)
setwd("/u/scratch/j/jessegar/1000GenomesLD/LDStats/CEU")
#TODO SET PATH AND fileExtension
#Path is where the files are located "." means we are in the working directory
path="."
#FileExtension is the extension of the files you want to process
fileExtension <- "_LD.hap.ld$"
fileNames <- dir(path, pattern = fileExtension)
summingDPrime <- function(LDFileName){
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
  
  #Dprime Negative and Positve
  totalDPrimeNegative <- sum(LDFile$Dprime==-1)
  totalDPrimePositive <- sum(LDFile$Dprime==1)
  
  #Dprime Positive/Negative Ratio
  DprimePositveNegativeRatio <- totalDPrimePositive/totalDPrimeNegative
  
  metaData <- c(MutationType, totalDPrimePositive,totalDPrimeNegative,DprimePositveNegativeRatio)
  
  return(metaData)
}


##Dprime Statistics
require(data.table)


DPrimeStratifyTableCEUAll <- data.frame(matrix(ncol = 4, nrow = 1))
colnames(DPrimeStratifyTableCEUAll) <- c("MutationType", "totalDPrimePositive","totalDPrimeNegative","DprimePositveNegativeRatio" )

#For loop to do the function

for(fileName in fileNames){
  cat("\n",fileName)
  metaData <-summingDPrime(fileName)
  cat("\n",metaData)
  DPrimeStratifyTableCEUAll <- rbind(DPrimeStratifyTableCEUAll, metaData)
}

DPrimeStratifyTableCEUAll <- DPrimeStratifyTableCEUAll[-1,]

save(DPrimeStratifyTableCEUAll, file="DPrimeStratifyTableCEUAll")


