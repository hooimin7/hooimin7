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
#   }
# plotmax(1000)
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
