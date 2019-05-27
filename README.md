## Anaysis retrocopy using Hi-c data

#### **Dependence of R package:**  
	
	GenomicInteractions;  
	rtracklayer  
#### 0. Normalize the Hi-C raw contact matrices using the Knight-Ruiz matrix balancing algorithm and produce strict or permissive datasets of contact maps.
     ./1hicdataprocessed
#### 1. Calculate the proportions of parent-retrocopy pairs that are spatially colocalized based on the interacting chromatin contact maps.
    library("GenomicInteractions")
    HRPPairs <- read.table("./HRPPairs") #### HRPPairs: Information of retrocopies and parental genes in human genome
    source("./5countnum.R")
    load("./inter250kb_TOP50_NHEK.RData")
    countnum(HRPPairs,inter250kb_TOP50_NHEK)
    load("./inter250kb_TOP10_NHEK.RData")
    countnum(HRPPairs,inter250kb_TOP10_NHEK)
#### 2. Assess the statistical significance of interchromosomal colocalization of parent-retrocopy pairs.
    library(GenomicInteractions)
    library(rtracklayer)
    chrm_sizes <- read.table("./human_chr_sizes")
    HRPPairs <- read.table("./HRPPairs")
    load("./inter250kb_TOP50_NHEK.RData")
#### 3. First simulation method.
    source("./8shuffleBed.R")
    source("./6RandomizedTEST1.R")
    Inter_NHEK <- RandomizedTEST1(inter250kb_TOP50_NHEK,HRPPairs)
    Inter_NHEK <- as.data.frame(Inter_NHEK)
    write.table(Inter_NHEK,file = "./Test1Top50_NHEK",row.names = FALSE,col.names = FALSE)
#### 4. Second simulation method.
    source("./7RandomizedTEST2.R")
    Inter_NHEK <- RandomizedTEST2(inter250kb_TOP50_NHEK,HRPPairs)
    Inter_NHEK <- as.data.frame(Inter_NHEK)
    write.table(Inter_NHEK,file = "./Test2Top50_NHEK",row.names = FALSE,col.names = FALSE)
