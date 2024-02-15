rm(list=ls())
#install.packages('seqinr')
library('seqinr')

# Define functions:
source('nucleo_content.R')
source('create_complement.R')

# Get the sequence:
mito_fasta <- read.fasta('NC_012920.fasta')
mito_seq <- mito_fasta$NC_012920.1

# Print out length and content statistics:
cat('Length ', length(mito_seq), fill=T)
nucleo_content(mito_seq)
cat('Complementary sequence statistics:\n')
nucleo_content(create_complement(mito_seq))
