#rm(list = ls())
A = matrix(c(0.5,-0.2,0.3,1.2), nrow = 2, ncol = 2)
x0 = c(2000, 1000)
x1 = A%*%x0
x2 = x1%*%x0
x_old = x1
o_series = x_old[1,]
r_series = x_old[2,]

time = 10

for(i in 2:time) {
  x_new = A%*%x_old
  o_series = c(o_series,x_new[1,])
  r_series = c(r_series,x_new[2,])
  x_old = x_new
}
plot(1:time, o_series, type = 'l', col= 'blue', main = 'Owl and rat population over time', xlab = 'Years', ylab = 'Population')
lines(1:time, r_series, col='red')
