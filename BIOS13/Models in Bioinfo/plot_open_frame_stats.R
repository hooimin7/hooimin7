# Ex. 15 Plot the frequency of the different amino acids 
#        of the longest reading frame in a histogram.

rm(list=ls())
#install.packages('seqinr')
library('seqinr')
source('find_all_open_frames.R')
source('translate_sequence.R')

# load the sequence:
mito_fasta <- read.fasta('NC_012920.fasta')
mito_seq <- mito_fasta$NC_012920.1

# Find the longest open reading frame:
longest_frame_length <- 0
# Look in all possible reading frames (1,2,3):
for (rf in 1:3) {
  open_frames <- find_all_open_frames(mito_seq, rf)
  frame_lengths <- open_frames[,2] - open_frames[,1]
  if(max(frame_lengths) > longest_frame_length) {
    longest_frame_length <- max(frame_lengths)
    longest_frame_position <- which.max(frame_lengths) # position of longest frame
    longest_frame <- open_frames[longest_frame_position,]
  }
}

# Translate the longest frame to an amino acid sequence:
frame_seq <- mito_seq[longest_frame[1]:longest_frame[2]]
frame_translation <- translate_sequence(frame_seq)

# Calculate the frequency of all amino acids
amino_acids <- strsplit("*ACDEFGHIKLMNPQRSTVWY","")[[1]]
amino_count <- rep(0,length(amino_acids))
for(i in 1:length(frame_translation)) {
  amino_index <- which(frame_translation[i]==amino_acids)
  if(length(amino_index)>0) { # Error check
    amino_count[amino_index] <- amino_count[amino_index] + 1
  }
}

# Plot the frequencies as a barplot
barplot(amino_count, names.arg = amino_acids)
