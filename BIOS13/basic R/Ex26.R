# 26.	Write a script that 
# inputs two vectors of length 3 
cat('Please type 3 values for the first vector.\n')
v1 <- scan(nmax=3)
cat('Please type 3 values for the second vector.\n')
v2 <- scan(nmax=3)

# and prints a new vector that 
# alternatingly takes elements from the first two, 
# e.g. [5,6,10], [1,2,3] → [5,1,6,2,10,3].
# First create a vector of zeros of the right length:
v3 <- rep(0,6)
# Use a for-loop to fill in values
# Notice that the loop-variable i only takes values 2, 4, 6
for (i in seq(2,6,by=2)) {
  v3[i-1] <- v1[i/2]
  v3[i] <- v2[i/2]
}
cat('The resulting vector is:', v3, '\n')
