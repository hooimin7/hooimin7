rm(list = ls())
library(deSolve)
###############

LV_isoclines <- function(r,a,mu) {
  P <- list( r=2, a=1, mu=2 )
  # Extracting parameters from the list
  r <- P$r
  a <- P$a
  mu <- P$mu
  # equilibria (we use these coordinates to draw the isoclines):
  ne <- mu/a
  pe <- r/a
  
  return(LV_isoclines)
  
  # prey isocline:
  plot(c(0,2*ne), c(pe,pe), type='l', col='blue')
  # predator isocline:
  lines(c(ne,ne), c(0,2*ne), col='red')
}

##################
LV_isoclines <- function(r, a, mu){
  y = r/a #prey
  x = mu/a #predator
  return(list(y = y , x = x))
}

isovalues <- LV_isoclines(1,1,2)
# plot(isovalues$x, type='l', xlim=c(0,10), ylim=c(0,5), xlab='predator', ylab='prey')
# abline(h = isovalues$y)
# 
# lines(isovalues$y, type='l')
# abline(v = isovalues$x)
#################
par(mfrow = c(1,2))
LV_sys <- function(t, np, P) {
  n <- np[1] #prey
  p <- np[2] #predator
  dndt <- P$r*n - P$a*n*p
  dpdt <- P$a*n*p - P$mu*p
  return(list(c(dndt, dpdt)))
}
np0 <- c(2, 1)
P <- list( r=2, a=1, mu=2)
timevec <- seq( 0, 10, by=0.1 )
out <- ode( y = np0, func = LV_sys, times = timevec, parms = P)
#print(out)
plot(out[,1], out[,2], type='l', col='blue')
lines(out[,1], out[,3], col='red')
plot(out[,2], out[,3], type='l', col='green', xlab='n', ylab='p', main='Phase Plane Plot')
##############
computeJacobian <- function(r, a, mu) {
  J <- matrix(0, nrow = 2, ncol = 2)  # Initialize a 2x2 matrix for the Jacobian
  
  # Calculate the elements of the Jacobian matrix
  J[1, 1] <- 0
  J[1, 2] <- -mu 
  J[2, 1] <- r 
  J[2, 2] <- 0
  
  return(J)  # Return the Jacobian matrix
}
P <- list(r=1, a=1, mu=2)
eig <- eigen(computeJacobian(P$r,P$a,P$mu))
print(eig)

############################
LV_isoclines <- function(r,a,mu) {
  # equilibria (we use these coordinates to draw the isoclines):
  ne <- mu/a
  pe <- r/a
  # prey isocline:
  plot(c(0,2*ne), c(pe,pe), type='l', col='blue')
  # predator isocline:
  lines(c(ne,ne), c(0,2*ne), col='red')
}
LV_sys <- function(t, np, P) {
  # extract vector content:
  n <- np[1]
  p <- np[2]
  # calculate the two growth rates:
  dndt <- P$r*n - P$a*n*p
  dpdt <- P$a*n*p - P$mu*p
  list(c(dndt, dpdt )) # the result as a vector in a list
}
rm(list = ls())
# First load the deSolve package:
library(deSolve)
# set up a vector of time-points for the output:
timevec <- seq( 0, 10, by=0.1 )
# we need a list of parameters:
P <- list( r=2, a=1, mu=2 )
np0 <- c(n=2,p=1) # initial population sizes
# define the growth function:
LV_sys <- function(t, np, P) {
  # extract vector content:
  n <- np[1]
  p <- np[2]
  # calculate the two growth rates:
  dndt <- P$r*n - P$a*n*p
  dpdt <- P$a*n*p - P$mu*p
  list(c(dndt, dpdt )) # the result as a vector in a list
}

# call the ode function to solve the differnetial equation:
out <- ode( y = np0, func = LV_sys, times = timevec, parms = P)
time <- out[,'time']
n <- out[,'n']
p <- out[,'p']
# plot the output in two panels:
op <- par(mfrow=c(2,1))
# first population sizes over time:
plot( time, n, type='l', col='blue' )
lines( time, p, type='l', col='red' )
# next the phase plane, starting with the isoclines:
LV_isoclines(P$r, P$a, P$mu)
# add the trajectory:
lines( n, p)
# plot a square at the initial condition
points(n[1], p[1], pch=0)
# reset graphics parameters:
par(op)

