#Write a plotmax function that
#a. takes an input parameter n
plotmax <- function(n) {
#b. generates a random vector of length n (runif(n))
  v <- runif(n)
#c. plots the vector as a blue line
  plot(1:n,v,type = 'l',col='blue')
  
#d. highlights local maxima with red crosses
  #e. e.	returns two vectors in a list. 
  # The first vector contains the indices (positions) 
  # and the second vector contains the values of the local maxima.
  # start with two empty output vectors:
  v_i <- c() # for the indeces
  v_v <- c() # for the values
  for(position in 2:(n-1)) {
    if(v[position-1]<v[position] && v[position]>v[position+1]) {
      points(position,v[position],pch=4, col='red')
      # add to output vectors:
      v_i <- c(v_i, position)
      v_v <- c(v_v, v[position])
    }
  }
  return(list(indeces=v_i, values=v_v))
}
