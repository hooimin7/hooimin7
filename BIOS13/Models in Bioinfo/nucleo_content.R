nucleo_content <- function(seqv) {
  # Print out the relative frequencies of all nucleotids
  Gsum <- sum(seqv=='g')
  Csum <- sum(seqv=='c')
  Asum <- sum(seqv=='a')
  Tsum <- sum(seqv=='t')
  cat('G : ',Gsum/length(seqv)*100,'%\n',sep='')
  cat('C : ',Csum/length(seqv)*100,'%\n',sep='')
  cat('A : ',Asum/length(seqv)*100,'%\n',sep='')
  cat('T : ',Tsum/length(seqv)*100,'%\n',sep='')
  # no return value
}