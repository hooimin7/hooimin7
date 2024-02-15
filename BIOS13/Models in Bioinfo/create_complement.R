create_complement <- function(seqv) {
  # swap G <=> C and A <=> T, and reverse order
  n <- length(seqv)
  # start with a vector of the right length,
  # filled with 'x' to make sure we replace every element
  rev_seq <- rep('x',n)
  # First swap g <-> c and a <-> t
  rev_seq[seqv=='g'] <- 'c'
  rev_seq[seqv=='c'] <- 'g'
  rev_seq[seqv=='a'] <- 't'
  rev_seq[seqv=='t'] <- 'a'
  # Second, reverse order:
  rev_seq <- rev_seq[n:1]
  return(rev_seq)
}