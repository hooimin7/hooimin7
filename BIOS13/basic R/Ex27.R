# 26.	Write a script that inputs two vectors of length 3 
# and prints a new vector that alternatingly takes elements from the first two, 
# e.g. [5,6,10], [1,2,3] → [5,1,6,2,10,3].
# 27.	Modify the script above to 
# first asks for the length of the vectors
# (which can be any integer>0 but ≤10).

# Asking with error check:
repeat {
  # First ask for the length:
  number_count <- as.numeric( readline('Enter vector length: ') )
  # error check:
  if (number_count<1 || number_count>10) {
    cat('Enter a number between 1 and 10! Try again!\n')
  } else {
    break # stop asking and continue
  }
}
# inputs two vectors of given length 
cat('Please type', number_count, 'values for the first vector.\n')
v1 <- scan(nmax=number_count)
cat('Please type', number_count, 'values for the second vector.\n')
v2 <- scan(nmax=number_count)

# and prints a new vector that 
# alternatingly takes elements from the first two, 
# e.g. [5,6,10], [1,2,3] → [5,1,6,2,10,3].
# First create a vector of zeros of the right length:
v3 <- rep(0,2*number_count)
# Use a for-loop to fill in values
# Notice that the loop-variable i only takes values 2, 4, 6, ...
for (i in seq(2,2*number_count,by=2)) {
  v3[i-1] <- v1[i/2]
  v3[i] <- v2[i/2]
}
cat('The resulting vector is:', v3, '\n')
