countnum <- function(HRetroTPE,contacts){
  Hr <- GRanges(seqnames = HRetroTPE$V3,ranges = IRanges(start = HRetroTPE$V4,end = HRetroTPE$V5))
  Hp <- GRanges(seqnames = HRetroTPE$V9,ranges = IRanges(start = HRetroTPE$V10,end = HRetroTPE$V11))
  HRP <- GenomicInteractions(Hr,Hp,counts=1)
  paired_hits <- findOverlaps(HRP,contacts)
  num <- length(unique(queryHits(paired_hits)))
  return(num)
}
