rm(list = ls())

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
  return(N)
}

species(0.1,0.2)

