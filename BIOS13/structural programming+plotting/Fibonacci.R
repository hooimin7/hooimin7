#Leonardo of Pisa...the Fibonacci sequence, which is an
# infinite sequence of numbers. 
# The first two numbers are both equal to one. 
# All the following numbers are calculated as the sum of the two previous. Thus the
# sequence starts:  1 1 2 3 5 8 11 …
#  Write a function which takes an input variable n, 
Fibonacci <- function(n) {
  # start with a sequence of zeros:
  fib <- rep(0,n)
  # the first two should be 1:
  fib[1:2] <- 1
  # calculates the n first Fibonacci numbers
  for (index in 3:n) {
    fib[index] <- fib[index-2] + fib[index-1]
  }
  #, and plots them. (no return values)
  plot(1:n,fib,type='b')
  
  #Extra: Extend the function above to also plot C^i/sqrt(5), 
  # where C is the Golden Ratio = (1+sqrt(5))/2 
  # and i is the index of the sequence (the x-coordinate). 
  # This function is very close to the Fibonacci sequence at higher values of i.  
  C <- (1+sqrt(5))/2
  # C^(1:n) will produce a vector with values C^1, C^2, etc.:
  fib2 <- C^(1:n)/sqrt(5)
  lines(1:n,fib2,col='red')
}

