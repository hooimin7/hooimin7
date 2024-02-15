rm(list = ls())
library(deSolve)
#bee vector b4
#time b4
# time after
# ode
# plot

# setting up parameters
param <- list(r = 0.1, mu = 0.05, ts = 60, T = 180, c = 0.1)

# time period
time_vec <- seq(0, param$ts)

# number of bees before ts
Wts <- exp((param$r - param$mu) * time_vec) 

# After ts
WQ <- c(Wts[length(Wts)], 1)


# number of bees and queen after ts
bee <- function(time, state, P) {
  
  W <- state[1]
  Q <- state[2]
  
  dwdt <- -P$mu * W
  dQdt <- P$c * W - P$mu * Q
  
  return(list(c(dwdt, dQdt)))
}
# time vector after ts
time_vec_after <- seq(param$ts, param$T)

WQ_last <- ode(y = WQ, times = time_vec_after, func = bee, parms = param)
W
WQ_last_df <- data.frame(WQ_last)

plot(time_vec,Wts, type = 'l', col = 'blue', xlim = c(0, param$T), ylim = c(0, 30))
lines(seq(60,180), WQ_last_df$X1, col = "steelblue")
lines(seq(60,180), WQ_last_df$X2, col = "orange")

