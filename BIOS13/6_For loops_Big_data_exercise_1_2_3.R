##### 5. For loops - Big data  exercise 1-3 #####
rm(list=ls())

### 1. Simple for loops

## 1a
for (i in 1:4) {
  print(i)
}

## 1b
numbers <- c(5,6,7,2)
for (i in 1:4) {
  print(numbers[i])
}

## 1c
for (i in 4:1) {
  print(numbers[i])
}

## 1d
numbers <- c(numbers, 20, 38)
for (i in 1:length(numbers)) {
  print(numbers[i])
}

## 1e
for (i in 1:length(numbers)) {
  x <- numbers[i] * 2
  print(x)
}

## 1f
strings <- c("hej","hopp","tjabba","tjena","hallao")
for (i in 1:length(strings)) {
  print(strings[i])
}

## 1g
for (i in strings) {
  print(i)
}


### 2. Nested for loops

## 2a
for (i in numbers) {
  for (haha in strings) {
    print(paste(i, haha))
  }
}

## 2b
for (haha in strings) {
  for (i in numbers) {
    print(paste(i, haha))
  }
}

### 3. while and repeat loops

## 3a-e
### Logistic population growth rate ###
rm(list=ls())

### Input parameters
K <- 500		  # Carrying capacity
r <- 0.1    # intrinsic growth rate
N1 <- 1		    # Initial population size
tmax <- 1000	# Maximum number of generations


### Code for simulation
N <- rep(NA, tmax)
N[1] <- N1

for(t in 2:tmax) {
  N[t] <- N[t-1] + r*N[t-1]*(1-(N[t-1]/K))
}

plot(N, ylim=c(0,K*1.1))


## 3f-j
### Logistic population growth rate ###
rm(list=ls())

### Input parameters
K <- 500		  # Carrying capacity
r <- 0.1    # intrinsic growth rate
N1 <- 1		    # Initial population size
tmax <- 1000	# Maximum number of generations
c <- 0.00001 		# Loop will break if 1-((Nt-1)/Nt) is smaller than c

### Code for simulation
N <- N1

for(t in 2:tmax) {
  N <- c(N, NA)
  N[t] <- N[t-1] + r*N[t-1]*(1-(N[t-1]/K))
  if(1-(N[t-1]/N[t]) < c) {
    break
  }
}

plot(N, ylim=c(0,K*1.1), xlim=c(0,length(N)))


## 3k-o
### Logistic population growth rate ###
rm(list=ls())

### Input parameters
K <- 500		  # Carrying capacity
r <- 0.1    # intrinsic growth rate
N1 <- 1		    # Initial population size
tmax <- 1000	# Maximum number of generations
c <- 0.00001 		# Loop will break if 1-((Nt-1)/Nt) is smaller than c

### Code for simulation
N <- N1
t <- 1

while(t != tmax && (t==1 || 1-(N[t-1]/N[t]) >= c)) {
  t <-t+1
  N <- c(N, NA)
  N[t] <- N[t-1] + r*N[t-1]*(1-(N[t-1]/K))
}

plot(N, ylim=c(0,K*1.1), xlim=c(0,length(N)))


## 3p-q
### Logistic population growth rate ###
rm(list=ls())

### Input parameters
K <- 500		  # Carrying capacity
r <- 0.1    # intrinsic growth rate
N1 <- 1		    # Initial population size
tmax <- 1000	# Maximum number of generations
c <- 0.00001 		# Loop will break if 1-((Nt-1)/Nt) is smaller than c

### Code for simulation
N <- N1
t <- 1

repeat {
  t <-t+1
  N <- c(N, NA)
  N[t] <- N[t-1] + r*N[t-1]*(1-(N[t-1]/K))
  if(t == tmax || 1-(N[t-1]/N[t]) < c) {
    break
  }
}


plot(N, ylim=c(0,K*1.1), xlim=c(0,length(N)))

