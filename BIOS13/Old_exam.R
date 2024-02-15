rm(list = ls())
# Define parameters
a <- 1
b <- 0.5
c <- 0.3
r <- 0.7

# Define the range for P and Q
P_range <- seq(0, 5, by = 0.1)
Q_range <- seq(0, 5, by = 0.1)

# Calculate isoclines
P_isocline <- (a - b * P_range) / (c * P_range)
Q_isocline <- r * P_range / b

# Plot isoclines
plot(P_range, P_isocline, type = "l", col = "blue", xlab = "P", ylab = "Q", main = "Isoclines")
lines(P_range, Q_isocline, col = "red")

# Simulate dynamics
dt <- 0.01
steps <- 1000
P <- Q <- numeric(steps)
P[1] <- 2
Q[1] <- 1

for (i in 2:steps) {
  dP <- a - b * P[i - 1] - c * P[i - 1] * Q[i - 1]
  dQ <- r * P[i - 1] - b * Q[i - 1]
  P[i] <- P[i - 1] + dP * dt
  Q[i] <- Q[i - 1] + dQ * dt
}

# Plot trajectory
plot(P, Q, type = "l", col = "green", xlab = "P", ylab = "Q", main = "Dynamics Trajectory")
###########################
# Setting system parameters first:
pars <- list(a=1,b=1,c=1,r=1)
# Plotting P isocline, using Q as a function of P:
P <- seq(0,5,by=0.1) # a range of P-values
Q <- pars$a/(pars$c*P) - pars$b/pars$c # the corresponding Q-values
plot(P, Q, type='l', col='blue', ylim=c(0,1), xlim=c(0,1.5))
# Q-isocline:
Q <- pars$r/pars$b*P
lines(P,Q,col='red')
# Next, use ode to calculate a trajectory:
library(deSolve)
# The set of differential equations:
PQfunc <- function(t,PQ,pars) {
  P <- PQ[1]
  Q <- PQ[2]
  dPdt <- pars$a - pars$b*P - pars$c*P*Q
  dQdt <- pars$r*P - pars$b*Q
  return(list(c(dPdt,dQdt)))
}
time_vec <- seq(0,10,by=0.1)
PQ0 <- c(P=0,Q=0) # Initial condition
results <- ode(func = PQfunc, times = time_vec, y = PQ0, parms = pars)
# Plot the result in phase space:
lines(results[,2],results[,3],col='black')
###########################
rm(list=ls())
# Parameter list:
P <- list(tS=60, r=0.1, c=0.1, mu= 0.05, T=100)
# Dynamics before switch (ts):
t_vec <- seq(0, P$tS, by=0.1)
Wbefore <- exp((P$r-P$mu)*t_vec)
plot(t_vec,Wbefore,type='l',col='blue',xlim=c(0,P$T), xlab='time',ylab='W(blue), Q(red)')
# WQ-dynamics after ts:
WQgrowth <- function(t,WQ,P) {
  W <- WQ[1]
  Q <- WQ[2]
  dWdt <- -P$mu*W
  dQdt <- P$c*W - P$mu*Q
  return(list(c(dWdt,dQdt)))
}
t_vec2 <- seq(P$tS,P$T,by=0.1)
# Use the worker density at t=ts as an initial condition:
WQ0 <- c(W=Wbefore[length(Wbefore)], Q=0)
WQafter <- ode(func = WQgrowth, times = t_vec2, parms = P, y=WQ0)
# Plot workers and queens over time:
Wafter <- WQafter[,'W']
Qafter <- WQafter[,'Q']
lines(t_vec2,Wafter,col='blue')
lines(t_vec2,Qafter,col='red')
###########################
species <- function(PE,PS) {
  t_max <- 1e7 # 10 milion, length of simulation
  time_step <- 1e5 # 100,000, length of one time-step
  step_count <- t_max/time_step # Total number of time_steps
  N_save <- rep(0,step_count+1) # save also for t=0
  # Start with one species:
  N <- 1
  N_save[1] <- N
  for (i in 1:step_count) {
    # We track the new generation separately,
    # without updating N until the end.
    # This is so because N marks the end of the loop
    # and should not be altered within the loop.
    N_new <- N
    # For each species:
    for (s in 1:N) {
      # it may go extinct:
      if(runif(1)<PE){
        N_new <- N_new-1
      }else{ # if not, possibly speciate:
        if(runif(1)<PS){
          N_new <- N_new+1
        }
      }
    }
    # update N:
    N <- N_new
    N_save[i+1] <- N
    if(N<=0){
      break # This is important! Otherwise the loop on line 16 (for (s in 1:N)) will run
      #backwards!
    }
  }
  # Plot the dynamics on the right time-scale:
  plot(time_step*(0:step_count),N_save,type='l',xlab='time',ylab= '#species')
  return(N) # Don’t forget to return the result!
}
# Testing:
species(0.1,0.2)
#################################
species <- function(PE,PS) {
  t_max <- 1e7 # 10 milion, length of simulation
  time_step <- 1e5 # 100,000, length of one time-step
  step_count <- t_max/time_step # Total number of time_steps
  N_save <- rep(0,step_count+1) # save also for t=0
  # Start w ith one species:
  N <- 1
  N_save[1] <- N
  for (i in 1:step_count) {
    survivors <- sum(runif(N)<(1-PE))
    new_species <- sum(runif(survivors)<PS)
    N <- survivors + new_species
    N_save[i+1] <- N
    if(N<=0){
      break # This is important! Otherw ise the loop on line 14 may run backw ards!
    }
  }
  # Plot the dynamics on the right time-scale:
  plot(time_step*(0:step_count),N_save,type='l',xlab='time',ylab='#species')
  print(time_step*(0:step_count),N_save)
  return(N)
}
species(0.1,0.2)
result <- species(0.1,0.2)

###############################
# density dependent
rm(list = ls())
species2 <- function(PE,P0,k) {
  t_max <- 1e7 # 10 milion, length of simulation
  time_step <- 1e5 # 100,000, length of one time-step
  step_count <- t_max/time_step # Total number of time_steps
  N_save <- rep(0,step_count+1) # save also for t=0
  # Start with one species:
  N <- 1
  N_save[1] <- N
  for (i in 1:step_count) {
    # We track the new generation separately,
    # without updating N until the end
    # This is so because N marks the end of the loop
    # and should not be altered within the loop.
    N_new <- N
    # Density dependent speciation rate:
    PS = P0*exp(-k*N)
    # For each species:
    for (s in 1:N) {
      # it may go extinct:
      if(runif(1)<PE){
        N_new <- N_new-1
      }else{ # if not, possibly speciate:
        if(runif(1)<PS){
          N_new <- N_new+1
        }
      }
    }
    # update N:
    N <- N_new
    N_save[i+1] <- N
    if(N<=0){
      break # This is important! Otherwise the loop on line 18 will run backwards!
    }
  }
  # Plot the dynamics on the right time-scale:
  plot(time_step*(0:step_count),N_save,type= 'l',xlab= 'time',ylab='#species')
  return(N)
}
# Testing:
species2(0.1,0.2,0.01)
