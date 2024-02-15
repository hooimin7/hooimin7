#rm(list = ls())
########################
#Q 1 
# mymax = function(a) {
#   maxi = max(c(a))
#   return(maxi)
# }
# v = c(3,5)
# print(mymax(v))
########################
# Q 2
# multiply = function(a,b) {
#   n = length(a)
#   z = c()
#   for(i in 1:n) {
#     z[i]<-a[i]*b[i]
#   }
#     return(sum(z))
#   }
# 
# v = c(3, 5, -1)
# w = c(1, 2, 1)
# print(multiply(v,w))
########################
#Q 3
# Fibbo = function(x) {
#   fib = c()
#   fib[1] = 1
#   fib[2] = 1
#   for (n in 3:x) {
#     fib[n]=fib[n-1] + fib[n-2]
#   }
# return(fib)
# }
# Golden = function(x) {  
#   y = (1 + sqrt(5))/2
#   gol = c()
#   for(n in 1:x) {
#     gol[n] = y^n/sqrt(5)
#   }
# return(gol)
# }
# 
# print(Fibbo(10))
# print(Golden(10))
# plot(Fibbo(10))
# lines(Golden(10))
########################
#Q 4
# plotmax = function(n) {
# 
# a = runif(n)
# plot(a,type='l', col = 'blue')
#   for(i in 2:(n-1)) {
#     if(a[i-1] < a[i]  && a[i+1] < a[i]) {
#       points(i,a[i],pch=3, col = 'red')
#     }
#     }
# }
# 
# plotmax(100)
########################
# Q 5
# is_palindrome = function(x) {
#   n = nchar(x) #nchar(x) to find the index of the last character in the string x
#   for(i in 1:(n/2)) {
#   # first = substr(x, i, i)
#   # second = substr(x, i+1, i+1)
#   # secondlast = substr(x, n-i+2, n-i+2)
#   # last = substr(x, n-i+1, n-i+1)} #n - i + 1 corresponds to the character at position i from the end.
#     if(substr(x, i, i) != substr(x, n-i+1, n-i+1)) {
#       return(FALSE)
#     }
#   } 
#   return(TRUE)
# }
# 
# result = is_palindrome("levyhthel")
# if (result) {
#   print("TRUE")
# } else {
#   print("FALSE")
# }
#abba, civic, radar, level, rotor, kayak, madam, and refer
########################
#n = length(a)
#   z = c()
#   for(i in 1:n) {
#     z[i]<-a[i]*b[i]
#   }
#     return(sum(z))
#   }
# sortvalue = function(a, b) {
#   v1 = sort(a)
#   v2 = sort(b)
#   zm = c()
#   for(i in 1:length(v1)){
#     zm = append(zm, v1[i])
#   }
#   for(i in 1:length((v2))) {
#     zm = append(zm, v2[i])
#   }
# zm = sort(zm)
# return(zm)
# }
# 
# c1 = c(4, 6, 7, 9)
# c2 = c(9, 10, 20, 1, 5)
# sortvalue(c1, c2)
########################
# # Take a single vector as input, and return a moving average vector.
# moving_average <- function(v) {
#   # How long is the vector?
#   n <- length(v)
#   # special case! Vectors of length 0 or 1 are treated here:
#   if(n<2) {
#     return(v) # return same vector and exit function
#   }
#   # If at least two elements in vector:
#   # Start with an empty vector of the same length:
#   ma <- rep(0,n)
#   # The moving average is calculated from the input such that 
#   # each element i is the average of three neighbouring elements.
#   if(n>2) {
#     for (i in 2:(n-1)) {
#       ma[i] <- (v[i-1]+v[i]+v[i+1])/3
#     }  
#   }
#   # The end elements need special treatments:
#   ma[1] <- (v[1]+v[2])/2
#   ma[n] <- (v[n-1]+v[n])/2
#   return(ma)
# }
# #2.Generates a random vector of length 50
# v <- runif(50)
# #3.Calculates the moving average, using the above function
# ma <- moving_average(v)
# #4.Plots the vector together with the moving average
# plot(v, type='l')
# lines(ma,col='blue')
# #5. Smooths the vector further by 
# # repeatedly calling the moving_average function, and plots the result
# for (k in 1:5) {
#   ma <- moving_average(ma)
# }
# lines(ma,col='red')
########################
# # basic calculus 
# # Q 5a
# x = seq(0, 10, by = 2)
# y = 3*x^2- 5 
# y_derivative = 12*x-17
# plot(y, type='l')
# lines(y_derivative, type='l', col='red')
########################
# Q 5b
# x = seq(0, 10, by = 2)
# y = exp(2*x)
# print(y)
# y_derivative = 1 + 2*x 
# plot(y, type='l')
# lines(y_derivative, type='l', col='red')
########################
# #Q 5c
# x = seq(0, 10, by = 2)
# y = log(x+5)
# print(y)
# y_derivative = 1.38629436112 + 0.25*(x+1) 
# plot(y, type='l')
# lines(y_derivative, type='l', col='red')
########################
#Q 5d
# x = seq(0, 1000, by = 2)
# y = sin(-x) - 2*x
# print(y)
# y_derivative = -3*x
# plot(y, type='l')
# lines(y_derivative, type='l', col='red')


