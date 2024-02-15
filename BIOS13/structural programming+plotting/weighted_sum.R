#Write a function that calculates the weighted sum of an input vector. 
#The second argument to the function should be the weights, 
# one per element of the first vector.

weighted_sum <- function(values,weights) {
  n <- length(values)
  # start with a value of zero:
  ws <- 0
  for(some_loop_variable in 1:n) {
    ws <- ws + values[some_loop_variable]*weights[some_loop_variable]
  }
  return(ws)
  
  # alternative solution:
  # return(sum(values*weights))
}
