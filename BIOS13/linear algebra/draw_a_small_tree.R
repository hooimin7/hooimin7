draw_a_small_tree <- function() {
  # x-coordinates of nodes in the tree 
  # (NA values creates breaks in the line, 'lifting the pen'):
  x <- c(0, 0, 0.7, 1.5, NA, 0.7, 0.8, NA, 0, -0.6, -1.2, NA, -0.6, -0.5)
  # y-coordinates:
  y <- c(0, 1, 1.3, 1.4, NA, 1.3, 1.8, NA, 1.0, 1.4, 1.7, NA, 1.4, 2.0)
  
  # Rescale all coordinates by a factor 0.5:
  x <- 0.5*x
  y <- 0.5*y
  
  # Add a green tree to the current plot
  lines(x, y, type='l', col='green', lwd=8) # lwd sets the line thickness
}
