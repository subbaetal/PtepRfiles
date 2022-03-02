# open package RTrack layer for BSgenome.Ptep file
library(rtracklayer)
# import small hays_small.bed file for TE genome assemblies and start/end locations
HTE <- import("hays_small.bed", format = "bed")

# load in HTE as character, separating assemblies by unique assembly scaffold ID. There is probably better way to do this so all scaffolds are grouped together in one object
TE <- as.character(unique(seqnames(HTE)))

# open packages to create track visualizations for TE on Ptep.fna
library(Gviz)
library(BSgenome)
# i created a package for Ptep V2 to be used by BSgenome for our visualizations, will send the package through email since it is too large for github
library(BSgenome.Ptepidariorum.NCBI.v2)

# uses the information from our package instead of using UCSC's database, trying to use UCSC's data base brings up error if "TRUE"
options(ucscChromosomeNames=FALSE)

# load in Ptep.v2 from Ptep BSgenome package. I've used other methods to get same result
geno <- BSgenome.Ptepidariorum.NCBI.v2::BSgenome.Ptepidariorum.NCBI.v2

# create track for Ptep.v2 genome, shows nucleotides in sequence when zoomed in and gives relative position for TEs
strack <- SequenceTrack(geno)

# create generegiontrack for transposable elements based on their location on the Ptep genome
grtrack <- GeneRegionTrack(HTE,chromosome = TE, name = "Transposable elements")

# create track with markers for kb, matches length of Ptep genome
axtrack <- GenomeAxisTrack()

# plot tracks! yields all TE of one genome assembly ID (ugh) on Ptep genome
plotTracks(list(grtrack, strack, axtrack), from = 0, to = 16533)
# end goal is to have ALL TEs show up on one track so they can be plotted against genome and patterns can be found.
# also wondering if assembly IDs/different colors would be beneficial to have on plot of all TEs on genome. Will figure out once we get there :^)
