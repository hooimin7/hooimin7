##Exercise from one of the lecture slides that we skipped##
# Write a script that:
# 1. Defines the moving_average function:

# Take a single vector as input, and return a moving average vector.
moving_average <- function(v) {
  # How long is the vector?
  n <- length(v)
  # special case! Vectors of length 0 or 1 are treated here:
  if(n<2) {
    return(v) # return same vector and exit function
  }
  # If at least two elements in vector:
  # Start with an empty vector of the same length:
  ma <- rep(0,n)
  # The moving average is calculated from the input such that 
  # each element i is the average of three neighbouring elements.
  if(n>2) {
    for (i in 2:(n-1)) {
      ma[i] <- (v[i-1]+v[i]+v[i+1])/3
    }  
  }
  # The end elements need special treatments:
  ma[1] <- (v[1]+v[2])/2
  ma[n] <- (v[n-1]+v[n])/2
  return(ma)
}
#2.Generates a random vector of length 50
v <- runif(50)
#3.Calculates the moving average, using the above function
ma <- moving_average(v)
#4.Plots the vector together with the moving average
plot(v, type='l')
lines(ma,col='blue')
#5. Smooths the vector further by 
# repeatedly calling the moving_average function, and plots the result
for (k in 1:5) {
  ma <- moving_average(ma)
}
lines(ma,col='red')
