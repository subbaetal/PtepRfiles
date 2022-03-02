# PtepRfiles
Collection of files and documentation used for creating plot of Ptep TEs on Ptep genome
BSgenome.Ptepidariorum.NCBI.v2 was too large to submit through github. Will send directly through email or slack.
With these files I'm hoping to produce one graph with all TEs from hays_small.bed. BSgenome wants to default to only showing TEs from the first assembly scaffold out of the 72 scaffolds in hays_small.bed.
Tinyhaysbed.py is the script I created to check the positions of the TEs against the Ptep.fna file. I used this to double check that the TEs shown on defaulted assembly scaffold were coming from one single assemble, this is the error that I found.
Once this problem is fixed I will analyze the full hays.bed file in R :^)
