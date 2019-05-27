#shuffleBed
shuffleBed <- function(x) {
  stopifnot(class(x)=="GRanges")
  if (nchar(Sys.which("bedtools"))==0) stop("shuffleBed must be in the PATH")
  if (any(is.na(seqlengths(x)))) stop("seqlengths of x must be defined")
  genome_file <- tempfile()
  writeLines(paste(names(seqlengths(x)), seqlengths(x), sep="\t"), genome_file)
  
  bed_file <- tempfile()
  writeLines(paste(as.character(seqnames(x)), start(x), end(x), sep="\t", strand(x)), bed_file)
  
  shuffle_file <- tempfile()
  system(paste("bedtools shuffle -i", bed_file, "-g", genome_file, "-chrom", ">", shuffle_file))
  shuffled <- import.bed(shuffle_file)
  seqlevels(shuffled, force=TRUE) <- seqlevels(x)
  seqlengths(shuffled) <- seqlengths(x)
  
  unlink(c(genome_file, bed_file, shuffle_file))
  shuffled
}
