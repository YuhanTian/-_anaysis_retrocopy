#RandomizedTEST1
RandomizedTEST1 <- function(contacts,retro){
  gp_pairs1 <- GRanges(seqnames = retro$V3,ranges = IRanges(start = retro$V4,end = retro$V5))
  gp_pairs2 <- GRanges(seqnames = retro$V9,ranges = IRanges(start = retro$V10,end = retro$V11))
  
  seqlengths(gp_pairs1)<-chrm_sizes$V2[match(names(seqlengths(gp_pairs1)),chrm_sizes$V1)]
  gp_pairs1 <-trim(gp_pairs1)
  seqlengths(gp_pairs2)<-chrm_sizes$V2[match(names(seqlengths(gp_pairs2)),chrm_sizes$V1)]
  gp_pairs2 <-trim(gp_pairs2)
  
  num <- c()
  for(i in 1:1000)
  {
    shuffle_gp_pairs1 <- shuffleBed(gp_pairs1)
    shuffle_gp_pairs2 <- shuffleBed(gp_pairs2)
    shuffle_pairs <- GenomicInteractions(shuffle_gp_pairs1, shuffle_gp_pairs2, counts=1)
    paired_hits<-findOverlaps(shuffle_pairs,contacts)
    r <- length(unique(queryHits(paired_hits))) 
    num <- c(num,r)
  }
  return(num)
}

