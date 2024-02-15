source('find_codon.R')
find_stop_codon <- function(seqv, read_frame) {
   # Search for stop codons in a given sequence, 
   # using a specified reading frame (1, 2, or 3)
   stops <- c('taa', 'tag', 'aga','agg')
   positions <- c()
   for (si in 1:length(stops)) {
      positions <- c( positions, find_codon(seqv,stops[si],read_frame) )
   }
   return(sort(positions))
}