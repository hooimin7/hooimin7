# 28.	Write a script that inputs a line of text (in English) 
text <- readline("Enter a line of text: ")
# and prints all vowels in the text in the order they appear.
# Hint: The %in% operator is useful here. The command a %in% v 
# tests whether the value a occurs in the vector v (and then returns TRUE or FALSE)

# Vector of all vowels:
vowels <- c('a','o','u','e','i','y')

# Loop over each character of the input string:
for (i in 1:nchar(text)) {
  # Extract character number i:
  letter <- substr(text,i,i)
  # The tolower() function converts to lower case
  if (tolower(letter) %in% vowels ) {
    cat(letter)
  }
}
cat('\n')
