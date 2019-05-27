#TOP50(top 50% contacts), TOP10(top 25% contacts).
KRinter <- read.table("./NHEKinter_250kb_KRnorm")
KRinterquantile <- data.frame(quantile(KRinter$V7,c(0.50,0.90)))

KRinterTOP50 <- KRinterquantile[1,]
KRinterTOP10 <- KRinterquantile[2,]

system(paste("awk '$7>",KRinterTOP50,"{print $0;}' NHEKinter_250kb_KRnorm > inter250kb_TOP50_NHEK",sep = ""))
system(paste("awk '$7>",KRinterTOP10,"{print $0;}' NHEKinter_250kb_KRnorm > inter250kb_TOP10_NHEK",sep = ""))


library("GenomicInteractions")
source("./4ContactsTOGenomicInteractions.R")
#TOP50
inter250kb_TOP50_NHEKcontacts <- read.table("./inter250kb_TOP50_NHEK")
inter250kb_TOP50_NHEK <- ContactsTOGenomicInteractions(inter250kb_TOP50_NHEKcontacts)
a<-ls()
rm(list=a[which(a!='inter250kb_TOP50_NHEK' & a!='ContactsTOGenomicInteractions')])
save.image("./inter250kb_TOP50_NHEK.RData")
#TOP10
inter250kb_TOP10_NHEKcontacts <- read.table("./inter250kb_TOP10_NHEK")
inter250kb_TOP10_NHEK <- ContactsTOGenomicInteractions(inter250kb_TOP10_NHEKcontacts)
a<-ls()
rm(list=a[which(a!='inter250kb_TOP10_NHEK' & a!='ContactsTOGenomicInteractions')])
save.image("./inter250kb_TOP10_NHEK.RData")
