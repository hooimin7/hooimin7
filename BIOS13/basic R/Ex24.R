# 24.	Write a script that 
# a.	creates a vector v = [0, 0.2, 0.4, 0.6, … 5]
v <- seq(0, 5, by=0.2)
# b.	rounds off the values of v to nearest integer
v2 <- round(v)
# c.	plots both the original vector and the rounded values in the same graph
plot(v) # plot with single input uses index as x-values
lines(v2) #adds v2 as a line in the already existing plot
