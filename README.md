## Anaysis retrocopy using Hic data

## **Dependence of R package:**  
	
	optparse;  
	e1071;  
	randomForest;  
	bamsignals;  
	GenomicFeatures;  


### Normalize the raw contact matrices at 250 kb using the normalization vectors derived by the Knight-Ruiz matrix balancing algorithm and produce strict or permissive datasets of contact maps that contained the top 10% or 50% normalized Hi-C contact pairs.
    ./1hicdataprocessed 

### Calculate the proportions of parent-retrocopy pairs that are spatially colocalized based on the interacting chromatin contact maps.
    library("GenomicInteractions")
### HRPPairs: Information of retrocopies and parental genes in human genome
    HRPPairs <- read.table("./HRPPairs")
    source("./5countnum.R")
    load("./inter250kb_TOP50_NHEK.RData")
    countnum(HRPPairs,inter250kb_TOP50_NHEK)
    load("./inter250kb_TOP10_NHEK.RData")
    countnum(HRPPairs,inter250kb_TOP10_NHEK)
### To assess the statistical significance of interchromosomal colocalization of parent-retrocopy pairs, we performed simulation analysis according to two null models.
    library(GenomicInteractions)
    library(rtracklayer)
    chrm_sizes <- read.table("./human_chr_sizes")
    HRPPairs <- read.table("./HRPPairs")
    load("./inter250kb_TOP50_NHEK.RData")
### TEST1
    source("./8shuffleBed.R")
    source("./6RandomizedTEST1.R")
    Inter_NHEK <- RandomizedTEST1(inter250kb_TOP50_NHEK,HRPPairs)
    Inter_NHEK <- as.data.frame(Inter_NHEK)
    write.table(Inter_NHEK,file = "./Test1Top50_NHEK",row.names = FALSE,col.names = FALSE)
### TEST2
    source("./7RandomizedTEST2.R")
    Inter_NHEK <- RandomizedTEST2(inter250kb_TOP50_NHEK,HRPPairs)
    Inter_NHEK <- as.data.frame(Inter_NHEK)
    write.table(Inter_NHEK,file = "./Test2Top50_NHEK",row.names = FALSE,col.names = FALSE)
