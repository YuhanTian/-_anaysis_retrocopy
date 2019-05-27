tar zxfv GSE63525_NHEK_interchromosomal_contact_matrices.tar.gz NHEK_interchromosomal/250kb_resolution_interchromosomal/
find -name MAPQG0 | xargs -i rm -rf {} #The raw Hi-C data of interchromosomal contact frequencies with mapping quality ≥ 30 for cell lines.
#Normalize the raw contact matrices at 250 kb using the normalization vectors derived by the Knight-Ruiz matrix balancing algorithm.
cd NHEK_interchromosomal/250kb_resolution_interchromosomal/
./AttachScript/interKRnorm250kb.sh
find -name chr*_*_250kb_KRnorm | xargs -i cat {} > /NHEKinter_250kb_KRnorm
#Produce strict or permissive datasets of contact maps that contained the top 10% or 50% normalized Hi-C contact pairs.
Rscript ./3FilterByKRvalue.R
