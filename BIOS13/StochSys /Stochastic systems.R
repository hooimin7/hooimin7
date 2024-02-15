rm(list = ls())
n <- 1000 # the length of the walk
x <- rep(0, n) # start with all zeros
# get an empty plot to start with:
plot(NA, type = 'n', xlim=c(0,n), ylim=c(-2*sqrt(n),2*sqrt(n)))
for (iter in 1:100) { # repeat 100 times
  # walk randomly:
  for (i in 1:(n-1)) {
    x[i+1] <- x[i] + rnorm(1)
  }
  # plot:
  lines(1:n, x, col = "green")
}
###########################
n <- 1000 # the length of the walk
x <- rep(0, n) # start with all zeros
final_positions <- c() # Initialize an empty vector to store final positions

for (iter in 1:100) { # repeat 100 times
  # walk randomly:
  for (i in 1:(n-1)) {
    x[i+1] <- x[i] + rnorm(1)
  }
  # Store the final position after each walk:
  final_positions <- c(final_positions, x[n])
}

# Plotting the histogram of final positions:
hist(final_positions, col = "skyblue", xlab = "Final Positions", ylab = "Frequency", main = "Histogram of Final Positions")
###########################

runQ <- function(Pin, Pout, T_queue) {
  queue_length <- rep(0, T_queue) # Vector to store queue length at each minute
  Q<-0
  # Simulating the queue
  for (i in 1:T_queue) {
    
    # Check if a new customer arrives
    if (runif(1) < Pin) {
      Q<-Q+1
        # New customer added
    } 
    
    # Check if a customer finishes and leaves the queue
    if (runif(1) < Pout && Q > 0) {
      Q<-Q-1 # Customer finished and leaves
    }
    queue_length[i]<-Q
  }
  
  # Plotting the queue length over time
  plot(1:T_queue, queue_length, type = 'l', xlab = 'Time', ylab = 'Queue Length',
       main = 'Queue Length Over Time')
}

# Example usage:
runQ(0.6, 0.4, 100)

