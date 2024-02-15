rm(list = ls())
# Define parameters
n <- 1000 # number of generations
num_simulations <- 100 # number of simulations

# define function to calculate fixation probability
calculate_fixation_probability <- function(N, w, n, num_simulations) { 
  set.seed(123) # Set seed for reproducibility
  fixation_count <- 0 # count number of fixation events
  
  # run simulation for num_simulations times
  for (i in 1:num_simulations) { 
    # frequency of gene A over time
    pt <- numeric(n) 
    # initial p value of gene A
    pt[1] <- 1 / (2 * N) 
    
    # run simulation of p for n generations
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

# Range of w-values
w_values <- seq(0.9, 1.1, by = 0.01)

# Initialize vectors to store probabilities for N = 20 and N = 200
prob_N_20 <- numeric(length(w_values))
prob_N_200 <- numeric(length(w_values))

# Loop through each w-value
for (i in 1:length(w_values)) {
  w <- w_values[i] # set w-value
  
  # Calculate fixation probability for N = 20 and N = 200
  prob_N_20[i] <- calculate_fixation_probability(20, w, n, num_simulations)
  prob_N_200[i] <- calculate_fixation_probability(200, w, n, num_simulations)
}

# Plotting the results
plot(w_values, prob_N_20, type = "l", col = "blue", xlab = "w-values", 
     ylab = "Fixation Probability", ylim = c(0, 1), 
     main = "Fix. Prob. vs. w for Different Population Sizes")
lines(w_values, prob_N_200, type = "l", col = "red")
legend("topright", legend = c("N = 20", "N = 200"), 
       col = c("blue", "red"), lty = 1)

# Optional: Add a horizontal line at y = 0.5 for reference
abline(h = 0.5, lty = 2, col = "black")
