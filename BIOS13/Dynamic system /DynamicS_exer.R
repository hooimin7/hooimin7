# setwd("/Users/med-snt/Documents/Rworkshop")
# getwd()
# rm(list = ls())
library(deSolve)
logisticGrowth <- function(t, n, P) {
  dndt <- P$r0 * n * ( 1 - n / P$K) - P$h * n
  return(list( dndt ))
}
# set up a vector of time-points for the output:
timevec <- seq( 0, 20, by=0.1 )
# we need a list of parameters:
P <- list( r0=1, K=100 , h=0.1 )
# set the necessary parameters:
r <- 0.1 # per capita growth rate
n0 <- 1 # initial population size

# call the ode function to solve
# the differential equation:
out <- ode( y = n0, func = logisticGrowth,
              times = timevec, parms = P)
# plot the output:
plot( out , main='Logistic growth' )

