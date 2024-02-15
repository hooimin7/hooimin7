rm(list = ls())
library(deSolve)

# set up a vector of time-points for the output:
timevec <- seq( 0, 100, by = 1)

# Define parameters
P <- list(b = 1, g = 0.5, mu_j = 0.3, mu_0 = 0.2, c = 0.01)

ja0 <- c(j = 150, a = 5) # initial population sizes

# define the function:
JA_sys <- function(t, ja, P) {
  # extract vector content:
  j <- ja[1] # firt element of the vector
  a <- ja[2] # second element of the vector
  
  # calculate the age-structured rates:
  dJdt <- P$b * a - P$g * j - P$mu_j * j
  dAdt <- P$g * j - P$mu_0 * (1 + P$c * a) * a
  return(list(c(dJdt, dAdt))) # the result as a vector in a list
}

# call the ode function to solve the differential equation:
out <- ode(y = ja0, func = JA_sys, times = timevec, parms = P)


time <- out[,'time'] # extract the time vector
j <- out[,'j'] # extract the juvenile population size vector
a <- out[,'a'] # extract the adult population size vector

# first population sizes over time:
plot( time, j , type='l', col='blue' , ylab='Population size', ylim=c(0,300))
lines( time, a, type='l', col='red')
legend('bottomright', legend=c('juvenile','adult'), col=c('blue','red'), lty=1)