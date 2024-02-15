# 6.	Write a function that merges two sorted vectors (input variables) 
# into a new sorted vector (return value). 
# Example: [1,4,6],[2,3,5] → [1,2,3,4,5,6].

sort_vectors <- function(v1, v2) {
  # In this solution I remove the values from v1 and v2 as I use them.
  # When both vectors are empty, I'm done
  # Start with an empty results-vector:
  v_comb <- c()
  while (length(v1)>0 | length(v2)>0) {
    if (v1[1]<v2[1]) {
      # Add next element to the end of the output:
      v_comb <- c(v_comb, v1[1])
      # Remove that element from v1
      v1 <- v1[-1]
      # Extra check. If v1 is empty, the rest of the output comes from v2:
      if( length(v1)==0 ) {
        v_comb <- c(v_comb, v2)
        v2 <- c()
      }
    } else {
      # Add next element to the end of the output:
      v_comb <- c(v_comb, v2[1])
      # Remove that element from v2
      v2 <- v2[-1]
      # extra check, as above:
      if( length(v2)==0 ) {
        v_comb <- c(v_comb, v1)
        v1 <- c()
      }
    }
  }
  return(v_comb)
}