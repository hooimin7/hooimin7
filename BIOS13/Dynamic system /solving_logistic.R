# Solve the logistic equation numerically. 
# dn/dt = f(n) = r0*n*(1-n/K)

# Key model parameters:
K <- 100 # Carrying capacity
r0 <- 1 # intrinsic growth rate
n0 <- 1 # initial population size
delta_t <- 0.1 # fixed time-step
t_start <- 0 # when we begin
t_end <- 20 # when we finish

# vector of t-values:
t <- seq(t_start, t_end, by=delta_t)

# vector of calculated solution:
n_solution <- rep(0, length(t))

#  Start by setting n=n0
n <- n0
n_solution[1] <- n

for (ti in 2:length(t)) {
  # Calculate dn/dt = f(n)
  dndt <- r0*n*(1-n/K)
  
  # Calculate Δn=f(n)Δt
  delta_n <- dndt*delta_t
  
  # Update n
  n <- n + delta_n
  
  # Store solution:
  n_solution[ti] <- n
}

# Plot solution:
plot(t, n_solution, type='l', col='red', xlab='time, t', ylab='n(t)', main='Logistic growth')

# Does the solution match the analytical solution?
n_analytical <- K/(1+(K/n0-1)*exp(-r0*t))
lines(t, n_analytical, col='black', lty='dashed')

legend('bottomright', legend=c('numerical solution','exact solution'), col=c('red','black'), lty=c('solid','dashed'))
