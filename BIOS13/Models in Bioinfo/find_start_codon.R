source('find_codon.R')
find_start_codon <- function(seqv, read_frame) {
   # Search for start codons in a given sequence, 
   # using a specified reading frame (1, 2, or 3)
   starts <- c('atg', 'ata', 'att','atc', 'gtg')
   positions <- c()
   for (si in 1:length(starts)) {
      positions <- c( positions, find_codon(seqv,starts[si],read_frame) )
   }
   return(sort(positions))
}