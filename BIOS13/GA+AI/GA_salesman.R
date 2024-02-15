
# Written 14 dec 2018 by Jörgen Ripa
rm(list=ls())
# Main variables:
pop_size <- 50            # popsize is number of chromosomes in the population
gene_number <- 6         # gene number is number of genes in each chromosome, should be one in these simple tasks
max_generations <- 1000    # number of iterations
num_breeed <- 20          # out of the 50 chromsomes (= possible solutions) the 20 best are allowed to reproduce

# genetic operators
mutation_rate <- 0.1    #how large percentage of the genes experience mutations
mutation_free <- 10      # number of top ranked individuals that should be saved from mutation

# Distance table:
Dist <- matrix(c(  0,  267, 602, 506, 262, 282, 
                  267,  0,  412, 467, 341, 214, 
                  602, 412,  0,  305, 467, 321,
                  506, 467, 305,  0,  247, 243, 
                  262, 341, 467, 247,  0,  149,
                  282, 214, 321, 243, 249,  0 ),gene_number,gene_number)

# Define Functions

Create_pop <- function(pop_size,gene_number) {    # This function creates a random population of pop_size chromosomes
   
   Genes <- matrix(nrow=pop_size, ncol=gene_number)
   for(ind in 1:pop_size) {              # For each individual:
      # Generate a random sequence of the entire set of numbers:
      Genes[ind,] <- sample.int(gene_number,gene_number)
   }
   
   
   fitness <- rep(NA,pop_size)
   # pop is a list, a structured variable with information about the population:
   pop <- list(size=pop_size, L=gene_number, Genes=Genes, fitness=fitness)
   return(pop) 
}

Evaluate_fitness <- function(pop,Dist) {
   # Calculate the distance travelled from the first city to the last and then straight back again
   for(ind in 1:pop$size) {
      dsum <- 0
      for (i in 1:(pop$L-1)) {
         dsum <- dsum + Dist[pop$Genes[ind,i],pop$Genes[ind,i+1]]
      }
      # add the return trip:
      dsum <- dsum + Dist[pop$Genes[ind,pop$L],pop$Genes[ind,1]]
      pop$fitness[ind] <- dsum
   }
   return(pop)
}

Sort <- function(pop) {
   # sort the population by fitness.
   # In this case we are looking for a minimum, so the lowest values should come first
   new_order <- order(pop$fitness, decreasing=FALSE)
   # Next, rearrange the population gene matrix and fitness vector:
   pop$Genes <- pop$Genes[new_order,]
   pop$fitness <- pop$fitness[new_order]
   return(pop)
}

Reproduce <- function(pop,num_breeed) {
   # The population reproduces in pairs, in fitness order
   # First indidivudals 1 and 2 mate, next individuals 3 and 4, and so on
   # Offspring replace the parent population from the bottom of the list.
   offspring_pos <- pop$size # where to put the offspring, starting from bottom
   for(parent1 in seq(1, num_breeed, by=2)) {
      parent2 <- parent1 + 1
      # make two offspring per pair
      for (offspring_index in 1:2) {
         offspring <- rep(0,pop$L)
         crossover <- sample.int(pop$L-1,1)
         offspring[1:crossover] <- pop$Genes[parent1,1:crossover]
         # Fill in the rest from parent 2, BUT avoid duplicate cities!!!
         p2 <- pop$Genes[parent2,]
         p2rest <- setdiff(p2,offspring[1:crossover])
         offspring[(crossover+1):pop$L] <- p2rest
         pop$Genes[offspring_pos,] <- offspring
         offspring_pos <- offspring_pos - 1
      }
   }
   return(pop)
}

Mutate <- function(pop, mutation_free, mutation_rate) {
   for(ind in (mutation_free+1):pop$size) {
      if(runif(1) <= mutation_rate) {
         # Mutate an individual by swapping two cities:
         swap_genes <- sample.int(pop$L,2)
         swap_temp <- pop$Genes[ind,swap_genes[1]]
         pop$Genes[ind,swap_genes[1]] <- pop$Genes[ind,swap_genes[2]]
         pop$Genes[ind,swap_genes[2]] <- swap_temp
      }
   }
   return(pop)
}

##############################
# Main program starts here

pop <- Create_pop(pop_size,gene_number)  # calls function that generates random chromosomes
pop <- Evaluate_fitness(pop, Dist)   # calculate fitness for all individuals
pop <- Sort(pop) # Sort according to fitness

# main loop over all of our functions

meantopfitness <- c(0,max_generations) # empty vectors to store results
meanfitness <- c(0,max_generations)

for(generation in 1:max_generations) {  
   pop <- Reproduce(pop,num_breeed)
   pop <- Mutate(pop, mutation_free, mutation_rate)
   pop <- Evaluate_fitness(pop, Dist)   # give back altered population with fitness
   pop <- Sort(pop)
   
   # save statistics:
   meantopfitness[generation] <- mean(pop$fitness[1:5])
   meanfitness[generation] <- mean(pop$fitness)
}

cat("generation:",max_generations,"\n")
cat("mean fitness",meanfitness[max_generations],"\n")
cat("Best fitness:",pop$fitness[1],"\n")
cat("Best solution : " , pop$Genes[1,], "\n")

# plot results
plot(1:max_generations, meanfitness, ylim=c(min(meantopfitness),max(meanfitness)),type="l")
lines( 1:max_generations, meantopfitness, col="red")

