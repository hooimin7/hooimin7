rm(list = ls())
set.seed(123)
n <- 1000 # number of generations
N <- 1000 # population size
pt <- numeric(n) # frequency of gene A over time
w <- 1.1 # fitness of A
pt[1] <- 1 / (2 * N) # initial p value of gene A

# run simulation of p for n generations
for (i in 1:n) {
  # mean fitness of population A over time
  w_hat <- w * pt[i] + 1 - pt[i] 
  # standard deviation of fitness of population A over time
  sd_t <- (1 / w_hat) * sqrt(w / (2 * N) * pt[i] * (1 - pt[i])) 
  # calculate p value for next generation
  pt[i+1] <- (w / w_hat) * pt[i] + rnorm(1, 0, sd = sd_t) 

  # Break if pt is <= 0 or >= 1
  if (pt[i+1] <= 0 || pt[i+1] >= 1) { 
    pt[i+1] <- pt[i] # store p value for each generation
    pt <- pt[1:i] # remove NA values
    break
  }
}

# Plot pt over time
plot(pt, type = "l", xlab = "Generation", ylab = "Frequency (pt)", main = "Gene Spread Simulation")
