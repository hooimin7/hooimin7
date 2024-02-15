find_codon <- function(seq, codon, reading.frame) {
  # Look for a codon in a sequence, using a specified reading frame
  # seq : the sequence, as a vector of (gcat) characters
  # codon : a 3-letter string specifying the codon (e.g. "ata")
  # reading.frame : starting position (1, 2 or 3)
  # The return value is a vector of positions where the codon was found.
  
  positions = c() # empty vector
  # step through the sequence in steps of 3:
  for (pos in seq(reading.frame, length(seq)-2, by=3)) {
    if (seq[pos]==substr(codon,1,1) && seq[pos+1]==substr(codon,2,2) && seq[pos+2]==substr(codon,3,3)) {
      # add to the end of the positions vector
      positions = c(positions, pos)
    }
  }
  return(positions)
}

find_codon(c('a', 'c', 'g', 'g', 'a', 't','g', 'a', 'a'), 'gaa', 2)
