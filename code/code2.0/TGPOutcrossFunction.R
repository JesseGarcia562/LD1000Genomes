setwd("~/Downloads")


install.packages("readxl")
install.packages("testthat")
library(readxl)
library(tools)
library(testthat)

file <- "srep17453-s3.xls"
TGSampleNames <- read_excel(file)

#Keeping Only Outbred Individuals with high Quality Scores
#For FSuite, the quality of estimation was measured by a Q-score (see Methods). 
#Based on simulations, estimation was defined as low quality if the Q-score was less than or equal to 50, 
#this threshold being adequate to check whether the allelic frequencies were adapted for the f estimation (Table S1).
set.seed(10)

IndividualsFromTGP <- function(Population, SampleSize){

TGSampleNames$`Mating type` == "OUT" 
TGSampleNames <- subset(TGSampleNames, `Mating type` == "OUT" & `Q-score` >= 50)

Individuals <-  subset(TGSampleNames, POP == Population)
#Randomly Sample 50 Individuals
expect_gt(nrow(Individuals), SampleSize, label="Individuals in Population that Pass Filter")
IndividualRows <- sample(nrow(Individuals), size=SampleSize)
Sampled <- Individuals[IndividualRows,]
IndividualID <- Sampled$IID
cat(cat(SampleSize, " Individuals From ", Population, ": "),cat(IndividualID, sep = ","))
}

#IndividualsFromTGP("YRI", 50)

#IndividualsFromTGP("CHB", 50)


#IndividualsFromTGP("CEU", 50)

