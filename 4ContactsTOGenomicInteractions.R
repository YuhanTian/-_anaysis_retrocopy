ContactsTOGenomicInteractions <- function(contacts){
  R1 <- GRanges(seqnames = contacts$V1,ranges = IRanges(start = contacts$V2,end = contacts$V3))
  R2 <- GRanges(seqnames = contacts$V4,ranges = IRanges(start = contacts$V5,end = contacts$V6))
  NHEK_250kb <- GenomicInteractions(R1, R2,KR_value = contacts$V7,Reads=contacts$V8)
  return(NHEK_250kb)
}
