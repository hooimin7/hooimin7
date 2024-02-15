#rm(list = ls())
# #cmd + shit + s  source button
# tigers = 10
# lion = tigers + 12
# objects()
# tigers = 15
# names(tigers) = " The numbers"
# names(tigers)
# tigers2 = 2*tigers
# tigers2
# unname(tigers2) # remove "The numbers"
# a = 4
# b = 7 
# sin(a) + exp(b)
# b*sqrt(a)
# pi*log(a+b)
# rep(2,3)# 2 2 2
# seq(2, 10, by = 2) #2  4  6  8 10
# seq(0, 300, by = 3) #[0 3 6 9 ... 300]
# rep(c(2,3),3) #2 3 2 3 2 3
# seq(0.5,2.0, by = 0.1)
# seq(11, 27, length = 23) #23 evenly spaced numbers between 11 and 27
# c(8:-1)
# u = seq(5, 100, by = 5)
# u[c(3, 7)] = 0 #set element 3 and 7 to 0
# u[c(u > 50)] = -3 #set element larger than 50 to 0
# u+7 #Add 7 to all elements
# blue = 3
# red = 5
# cat('Blue plus red is', blue+red)
######################
# question 26
# x = c(5,6,10)
# y = c(1,2,3)
# z = numeric()
# for (i in seq(2,6,by=2)) {
#   z[i-1] <- x[i/2]
#   z[i] <- y[i/2]
# }
# cat('The resulting vector is:', z, '\n')
######################
# 27 Modify the script above to first asks for the length of the vectors 
# cat("The length of your vectors, please provide any integer>0 but ≤10")
# v1 = scan(nmax=1)
# cat('Please type length/2 values for the first vector.\n')
# v2 <- scan(nmax=v1/2)
# cat('Please type length/2 values for the second vector.\n')
# v3 <- scan(nmax=v1/2)
# 
# # First create a vector of zeros of the right length:
# v4 <- rep(0,v1)
# # Use a for-loop to fill in values
# # Notice that the loop-variable i only takes values 2, 4, 6
# for (i in seq(2,v1,by=2)) {
#   v4[i-1] <- v2[i/2]
#   v4[i] <- v3[i/2]
# }
# cat('The resulting vector is:', v4, '\n')
######################
# Q 28 inputs a line of text (in English) and prints all vowels
# Engtext = readline(prompt = "please write a line of text (in English): ")
# v1 = c("a", "e", "i", "o", "u")
# for (i in 1:nchar(Engtext)) {
#     letter = substr(Engtext,i,i) 
#     if (tolower(letter) %in% v1) {
#       cat(letter)
#     }
# }
# cat('\n') 
######################
