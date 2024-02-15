#source 'spesies'
# this takes some time
source('spesies.R')
# iteration 1000 times
ite <- 1000
PE <- 0.1
PS <- 0.2
N_final <- seq(0,ite)
for (i in 1:ite) {
  N_final[i] <- species(PE,PS)
}
print(N_final)
hist(N_final, breaks = 100)
