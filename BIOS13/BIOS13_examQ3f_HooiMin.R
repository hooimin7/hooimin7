rm(list = ls())
library(deSolve)

# Define the function with cannibalism
JA_sys_with_cannibalism <- function(t, ja, P) {
  # Extract vector content
  j <- ja[1] # First element of the vector
  a <- ja[2] # Second element of the vector
  
  
  # # Calculate the age-structured rates with cannibalism
  dJdt <- P$b * a - P$g * j - P$mu_j * j - P$s * a * j
  dAdt <- P$g * j - P$mu_0 * (1 + P$c * a) * a + P$gamma * P$s * a * j
  
  return(list(c(dJdt, dAdt)))  # The result as a vector in a list
}

# Define parameters including cannibalism rate
P_with_cannibalism <- list(b = 1, g = 0.5, mu_j = 0.3, mu_0 = 0.2, c = 0.01, 
                           s = 0.001, gamma = 0.001)

# Set initial population sizes
ja0 <- c(j = 150, a = 5)

# set up a vector of time-points
timevec <- seq(0, 100, by = 1)

# Solve the differential equation with cannibalism
out_with_cannibalism <- ode(y = ja0, func = JA_sys_with_cannibalism, 
                            times = timevec, parms = P_with_cannibalism)

time <- out_with_cannibalism[,'time'] # Extract the time vector
j <- out_with_cannibalism[,'j'] # Extract the juvenile population size vector
a <- out_with_cannibalism[,'a'] # Extract the adult population size vector

# Plot the results
plot(time, j , type='l', col='blue' , ylab='population size', ylim=c(0,200))
lines(time, a, type='l', col='red')
legend('bottomright', legend=c('juvenile','adult'), col=c('blue','red'), lty=1)


