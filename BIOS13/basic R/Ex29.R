# 29.	Write a guessing game where the user has to 
# guess a secret number (between 1 and 20, use sample.int(20,1)). 
# After every guess the program tells the user whether their 
# number was too large or too small. 
# At the end the number of tries needed should be printed.

# Generate a random number between 1 and 20:
number <- sample.int(20,1)
# Count the number of tries:
count <- 0
repeat {
  guess <- as.numeric( readline('Enter your guess: ')  )
  count <- count+1 # increase the counter
  if(guess<number) {
    cat('Too small, try again!\n')
  } else if (guess>number) {
    cat('Too large, try again!\n')
  } else {
    cat('Correct!\n')
    cat('You guessed',count,'times.\n')
    break # exit the repeat loop
  }
}
