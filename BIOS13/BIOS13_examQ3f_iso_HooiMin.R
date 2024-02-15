rm(list = ls())

# Define system parameters first
pars <- list(b=1, g=0.5, mu_j=0.3, mu_0=0.2, c=0.01, s = 0.001, gamma = 0.001)

# Plotting J isocline, using A as a function of J:
A <- seq(0, 500) # a range of A-values
J <- pars$b * A / (pars$g + pars$mu_j + pars$s * A)
plot(A, J, type="l", lty=5, col='blue', xlab='Adult (A)', ylab='Juvenile (J)', 
     ylim=c(0, 500), xlim=c(0, 500))

# Plotting A isocline
J <- pars$mu_0 * (1 + pars$c * A) * A / (pars$g + pars$gamma * pars$s * A)
lines(A, J, type="l", lty=5, col='red')

# Next, use ode to calculate a trajectory:
library(deSolve)
# The set of differential equations:
AJfunc <- function(t, AJ, pars) {
  A <- AJ[1] # A is the first element of AJ
  J <- AJ[2] # J is the second element of AJ
  dAdt <- pars$g * J - pars$mu_0 * A - pars$mu_0 * pars$c * A^2 + pars$gamma * 
    pars$s * A * J
  dJdt <- pars$b * A - pars$g * J - pars$mu_j * J - pars$s * A * J
  return(list(c(dAdt, dJdt)))
}


time_vec <- seq(0, 500, 0.1)   # set up a vector of time-points
AJ0 <- c(A = 5, J = 150)  # Adjusted initial values for A and J
results <- ode(func = AJfunc, times = time_vec, y = AJ0, parms = pars)

# Plot the result in phase space using the results data:
lines(results[, "A"], results[, "J"], type='l', col='black')
legend('bottomright', legend=c('J isocline', 'A isocline', 'Trajectory'), 
       col=c('blue', 'red', 'black'), lty=c(5, 5, 1))

