draw_a_transformed_tree <- function(A) {
  # x-coordinates of nodes in the tree 
  # (NA values creates breaks in the line, 'lifting the pen'):
  x <- c(0, 0, 0.7, 1.5, NA, 0.7, 0.8, NA, 0, -0.6, -1.2, NA, -0.6, -0.5)
  # y-coordinates:
  y <- c(0, 1, 1.3, 1.4, NA, 1.3, 1.8, NA, 1.0, 1.4, 1.7, NA, 1.4, 2.0)
  
  # For each vector u =(x[i], y[i]), 
  # calculate the corresponding transformed vector v = A*u,
  # and put the new coordinates back into the vectors x, y.
  for (i in 1:length(x)) {
    # original vector:
    u <- c(x[i],y[i])
    # transformed vector:
    v <- A %*% u
    # put the transformed coordinates back into x and y:
    x[i] <- v[1]
    y[i] <- v[2]
  }

  # Add a green tree to the current plot
  lines(x, y, type='l', col='green', lwd=8) # lwd sets the line thickness
}
