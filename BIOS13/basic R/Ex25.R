# 25.	Do the exercise on the last slide from the lecture, the random walk problem.
# Definition of a random walk: 
# x[1] = 0
# x[i+1] = x[i] + rnorm(1)
# Task: Write a script that inputs the length of the walk, 
length_of_walk <- as.numeric(readline("Type the length of a walk: "))
# generates a sample time series, 
# Start with a vector of zeros with the right length
x <- rep(0,length_of_walk)
# A for-loop to generate the walk:
for (i in 1:(length_of_walk-1) ) {
  x[i+1] <- x[i] + rnorm(1)
}
# and plots it as a solid line
plot(x,type='l')

# Extra: generate 10 sample time series and plot them all in the same graph
# Run the same for-loop 9 more times:
for (j in 1:9) { # remember to use another loop variable!
  # Generate a new walk:
  for (i in 1:(length_of_walk-1) ) {
    x[i+1] <- x[i] + rnorm(1)
  }
  # and add it to the graph:
  lines(x,type='l')
}
# One problem here is that the last 9 walks may go outside the range of the first one,
# and therefore outside the range of the graph. If you wish, work out a solution to that.
