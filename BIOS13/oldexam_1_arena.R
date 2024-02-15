
# Single queen in spring
# She produces workers, they help produce new workers
# At ts, the colony switches to produce new queens


rm(list=ls())
library(deSolve)
library(tidyverse)

# Parameters
params <- list(r = 0.1, mu = 0.05, ts = 60, t=183)
params$c <- params$r / 2

# Vector for time (days) till ts
time_vec <- seq(1, params$ts)

# Vector for time (days) from ts to end of season
time_vec2 <- seq(params$ts, params$t)

# Bees before switch using the general solution and death rate
Wb4 <- exp((params$r - params$mu) * time_vec)


# Initial queen and workers
init <- c(1,Wb4[length(Wb4)])

# Function for the ODE of bees after switch
post_ts <- function(t, state, P) {
  Q <- state[1]
  W <- state[2]
  
  dwdt <- -P$mu * W
  dqdt <- P$c * W - P$mu * Q
  
  return(list(c(dqdt, dwdt)))
}

# Solve the ODE
out <- ode(y = init, times = time_vec2, func = post_ts, parms = params)

colnames(out) <- c("time", "queen", "workers")
df <- data.frame(out)


# Extend Wb4 to the end of the season with NA values
Wb4 <- c(Wb4, rep(NA,  params$t - params$ts +1))


df2 <- data.frame(time = seq(0, params$t),
                  queen = c(rep(1, params$ts), df$queen),
                  workers = c(rep(NA, params$ts), df$workers),
                  workers.b4 = Wb4)
                  
# Pivot df2 to long format
out_long <- df2 %>% 
  pivot_longer(cols = c(queen, workers, workers.b4), names_to = "bee", 
               values_to = "count")

# Plot of the bees
out_long %>% 
  ggplot(aes(x = time, y = count, color = bee)) +
  geom_line() +
  xlim(0, 184) +
  theme_bw() +
  labs(x = "Time (days)", y = "Bees", title = "Bees after switch")
























