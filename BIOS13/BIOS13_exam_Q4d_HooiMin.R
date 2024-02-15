rm(list = ls())
set.seed(123) # Set seed for reproducibility

# Usage example:
N <- 200 # population size
w <- 1.1 # fitness of allele A
n <- 1000 # number of generations
num_simulations <- 1000 # number of simulations

# Function to calculate fixation probability
calculate_fixation_probability <- function(N, w, n, num_simulations) {
  fixation_count <- 0 # count number of fixation events
 
  # Run simulation num_simulations times 
  for (i in 1:num_simulations) {
    pt <- numeric(n) # frequency of gene A over time
    pt[1] <- 1 / (2 * N) # initial p value of gene A
    
    # Run simulation of p for n generations
    for (g in 1:n) { 
      # mean fitness of population A over time
      w_hat <- w * pt[g] + 1 - pt[g] 
      # standard deviation of fitness of population A over time
      sd_t <- (1 / w_hat) * sqrt(w / (2 * N) * pt[g] * (1 - pt[g])) 
      # calculate p value for next generation
      pt[g+1] <- (w / w_hat) * pt[g] + rnorm(1, 0, sd = sd_t) 
      
      if (pt[g+1] <= 0) { # if p value is less than 0
        pt[g+1] <- 0 # set p value to 0
      } else if (pt[g+1] >= 1) { # if p value is greater than 1
        pt[g+1] <- 1 # set p value to 1
      }
    }
    
    if (pt[n + 1] == 1) { # if fixation occurs
      fixation_count <- fixation_count + 1 # add 1 to fixation count
    }
  }
  
  # calculate fixation probability
  fixation_probability <- fixation_count / num_simulations 
  return(fixation_probability) # return fixation probability
}

# run simulation
fixation_prob <- calculate_fixation_probability(N, w, n, num_simulations) 
# print fixation probability
print(paste("Probability of fixation:", fixation_prob)) 

