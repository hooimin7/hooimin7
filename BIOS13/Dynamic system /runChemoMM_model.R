rm(list=ls())
# First load the deSolve package:
library(deSolve)

# define the growth function for the Chemostat combined with Michaelis Menten model:
mm_sys <- function(t, c, P){
  dcdt <- P$I-P$mu*c+((-P$Kmax*c/(P$kn+c))*P$n)
  return(list(dcdt))
  
}
 
# set up a vector of time-points for the output:
timevec <- seq( 0, 10, by=0.1 )

# we need a list of parameters:
P <- list( I=200, Kmax=0.5, kn=0.01, mu=0.5, n=100)

c0 <- 0.1  # initial nutrient concentration

# call the ode function to solve the differnetial equation:
out <- ode( y = c0, func = mm_sys, times = timevec, parms = P)

# plot the output
plot(out, main='Chemostat, MM-model')

#par(op)
