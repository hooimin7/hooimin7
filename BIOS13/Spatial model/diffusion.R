# dispersal parameter:
d <- 0.2
# size of the world:
L <- 100
# a vector of population sizes:
N <- rep(0,L)
N[round(L/2)] <- 20
# Plot initial state:
plot(1:L,N,type='l',xlab='spatial position', ylab='population density',main='Diffusion process')

# length of simulation:
tmax <- 50
for (t in 1:tmax) {
	# update the population vector:
	N_temp <- rep(0,L)
	for ( x in 2:(L-1) ){
		N_temp[x] <- N[x] - 2*d*N[x] + d*N[x-1] + d*N[x+1]
	}
	# Treat endpoints separately:
	N_temp[1] <- N[1] - d*N[1] + d*N[2]
	N_temp[L] <- N[L] - d*N[L] + d*N[L-1]
	N <- N_temp
}
# Plot final state:
lines(1:L, N, col='blue')
legend('topleft',legend=c('Initial state',paste('Distribution at t=',tmax)),lty='solid',col=c('black','blue'))
