rm(list = ls())
# par(mfrow=c(2,2))
dat = read.csv("~/git_hm/hooimin7/BIOS13/Ringlets.csv")
head(dat)
plot(dat, type='b') #plot will show both points and lines connecting these points
log_N = log(dat$N)
plot(dat$year, log_N, type='b', 
     xlab='Year', ylab='Log(N)', main='Ringlets Count over Time (Log Scale)') 
Nt <- dat$N[1:23]
Ntplus1 <- dat$N[2:24]
plot(Nt, Ntplus1, xlab='N(t)', ylab='N(t+1)') #population vs population in the future
Rickerfit <- nls( Ntplus1 ~ Nt*exp(r0*(1-Nt/K)), data=list(Nt=Nt),
                  start=list(r0=1,K=100) )
summary(Rickerfit)
points(Nt, fitted(Rickerfit), col='red') #plot the calculated nls value
plot(Nt, residuals(Rickerfit)) #residuals plot
rt <- log(Ntplus1/Nt) 
plot(Nt,rt) #plot log growth rates
head(rt)
#remove the first outliner 
Nt_new <- dat$N[2:23]
Ntplus1_new <- dat$N[3:24]
plot(Nt_new, Ntplus1_new, xlab='N(t)', ylab='N(t+1)') #population vs population in the future
Rickerfit_new <- nls( Ntplus1_new ~ Nt_new*exp(r0*(1-Nt_new/K)), data=list(Nt=Nt_new),
                  start=list(r0=1,K=100) )
summary(Rickerfit_new)
points(Nt_new, fitted(Rickerfit_new), col='red') #plot the calculated nls value
plot(Nt_new, residuals(Rickerfit_new)) #residuals plot
rt_new <- log(Ntplus1_new/Nt_new) 
plot(Nt_new,rt_new)
head(rt_new)
rt_fit <- nls( rt_new ~ r0*(1-Nt_new/K), data=list(Nt_new=Nt_new), start=list(r0=1,K=100) )
summary(rt_fit)
sqrt(sum(residuals(rt_fit)^2)/(length(rt)-2))
#####################
start=list(lambda=1.1,a=0.001,b=1)
#rt_lambda <- log(lambda/(1+a*Nt_new)^b)
new_model <- nls(rt_new ~ log(lambda/(1+a*Nt_new)^b), data=list(Nt_new=Nt_new),
                 start=list(lambda=1.1,a=0.001,b=1))
summary(new_model)
points(Nt_new, fitted(new_model), col='red')
AIC(rt_fit) #this model is better
AIC(new_model)
#####################
#butterflies
iterations <- 1000  # Number of simulations
t_max <- 100         # Length of simulation
r <- 1.004           # Growth rate parameter
K <- 311             # Carrying capacity parameter
sigma <- 0.3445      # Environmental stochasticity parameter

# Empty plot
plot(NA, type='n', xlim=c(0, t_max), ylim=c(0, 1000))

extinct_count = 0  # Counter to track extinctions

# Loop through simulations
for (i in 1:iterations) {
  n <- rep(0, t_max)
  n[1] <- 10  # Initial population size
  
  # Simulate population dynamics over time
  for (t in 1:(t_max - 1)) {
    eps <- rnorm(1, 0, sigma)
    n[t + 1] <- n[t] * exp(r * (1 - n[t] / K) + eps)
    
    # Check for extinction (population drops below 2)
    if (n[t + 1] < 2) {
      extinct_count <- extinct_count + 1
      break
    }
  }
  
  # Plot first 20 simulations
  if (i <= 2) {
    lines(n)
  }
}

# Calculate and output extinction probability
cat('Extinction probability: ', extinct_count / iterations)

