# Script plotting the logistic growth function
# Key model parameters:
r0 <- 1 # intrinsic growth rate
K <- 100 # carrying capacity
n0 <- 1 # starting population size for numeric solution

# A vector of n-values, extending beyond K:
n_plot <- seq(0, 1.2*K, length.out = 100)

# The growth function:
dndt <- r0*n_plot*(1 - n_plot/K)

# We will plot in two panels side-by-side:
op <- par(mfrow=c(1,2))

# Plotting:
plot( n_plot, dndt, type='l', col='red', xlab='n', ylab='dn/dt', main='The logistic growth function')
# Add an x-axis for comparison:
lines( n, 0*n, col='black')


# Add a plot of the analytical solution

# A vector of t-values:
t_plot <- seq(0, 20, length.out=100)

# Calculate the corresponding n-values:
n_solution <- K/(1+(K/n0-1)*exp(-r0*t_plot))

# Plot the solution:
plot( t_plot, n_solution, type='l', col='blue', xlab='t', ylab='n(t)', main='Analytical solution')
# Add the line n=K for reference:
lines( t_plot, rep(K,length(t_plot)), col='black', lty='dashed')

# Reset graphics parameters to stored values:
par(op)
