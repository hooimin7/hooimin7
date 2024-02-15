# 5.	Write a function is_palindrome() 
# that tests whether a string (input parameter) 
# is a palindrome (the same thing backwards) 
# and returns TRUE or FALSE.
is_palindrome <- function(string) {
  # For each character, test if it equals
  # the corresponding character from the end of the string
  # If not, set a flag to signal failure
  success <- TRUE # A flag to check for success
  for (char_index in 1:nchar(string)) {
    c1 <- substr(string,char_index,char_index)
    index_from_end <- nchar(string) - char_index + 1
    c2 <- substr(string, index_from_end, index_from_end)
    if (c1 != c2) {
      success = FALSE
    }
  }
  return(success)
}
