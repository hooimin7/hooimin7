nucleo_content_moving_average <- function(seqv) {
  # Plots the GCAT proportions as moving averages across the sequence
  
  window <- 200 # length of sliding window
  n <- length(seqv)
  
  Gprop <- rep(0,n-window+1)
  Cprop <- rep(0,n-window+1)
  Aprop <- rep(0,n-window+1)
  Tprop <- rep(0,n-window+1)
  
  for (i in 1:(n-window+1)) {
    mini_seq <- seqv[i:(i+window-1)]
    Gprop[i] <- sum(mini_seq=='g') / window
    Cprop[i] <- sum(mini_seq=='c') / window
    Aprop[i] <- sum(mini_seq=='a') / window
    Tprop[i] <- sum(mini_seq=='t') / window
  }
  # Arrange plots in a 2x2 array:
  op <- par(mfrow=c(2,2))
  plot(1:(n-window+1), Gprop, type='l', xlab='position', ylab='proportion',main ='G')
  plot(1:(n-window+1), Cprop, type='l', xlab='position', ylab='proportion',main='C')
  plot(1:(n-window+1), Aprop, type='l', xlab='position', ylab='proportion',main='A')
  plot(1:(n-window+1), Tprop, type='l', xlab='position', ylab='proportion',main='T')
  par(op)
  # no return value
}