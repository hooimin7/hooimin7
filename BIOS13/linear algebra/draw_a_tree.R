draw_a_tree <- function() {
  # x-coordinates of nodes in the tree 
  # (NA values creates breaks in the line, 'lifting the pen'):
  x <- c(0, 0, 0.7, 1.5, NA, 0.7, 0.8, NA, 0, -0.6, -1.2, NA, -0.6, -0.5)
  # y-coordinates:
  y <- c(0, 1, 1.3, 1.4, NA, 1.3, 1.8, NA, 1.0, 1.4, 1.7, NA, 1.4, 2.0)
  # Plot a brown tree, with thick branches
  plot(x, y, type='l', col='brown', lwd=8, xlim=c(-2,2), ylim=c(-2,2)) # lwd sets the line thickness
}
