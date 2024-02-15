rm(list=ls())

### What are for loops?

# Import data
members <- "C:/Users/Simon/OneDrive - Lund University/Dokument/Simon/Undervisning/Open R sessions/HT2023/forloops/Members.txt"
members <- read.csv(members, sep=";", head=T)
members <- members[,2]

# Check data
str(members)
unique(members)
length(members)

# Welcome people in a cumbersome way
print(paste("Hej hej", members[1] , "and welcome to the for loop session!"))
print(paste("Hej hej", members[2] , "and welcome to the for loop session!"))
print(paste("Hej hej", members[3] , "and welcome to the for loop session!"))
print(paste("Hej hej", members[4] , "and welcome to the for loop session!"))
print(paste("Hej hej", members[5] , "and welcome to the for loop session!"))
print(paste("Hej hej", members[6] , "and welcome to the for loop session!"))
print(paste("Hej hej", members[7] , "and welcome to the for loop session!"))



# Welcome all people with a loop 1
for(i in 1:length(members)) {
  print(paste("Hej hej", members[i] , "and welcome to this session!"))
}


i

# Welcome all people with a loop 2
for(i in members) {
  print(paste("Hej hej", i , "and welcome to this session!"))
}


# Value could be anything
for(tjohej in 1:length(members)) {
  print(paste("Hej hej", members[tjohej] , "and welcome to this session!"))
}


# Things dont have to change between iterations
for(i in 1:length(members)) {
  print(paste("Hej hej"))
}


i


### Why are for loops useful? Data handling
rm(list=ls())

# Import data
database <- "C:/Users/Simon/OneDrive - Lund University/Dokument/Simon/Undervisning/Open R sessions/HT2023/forloops/ringingDataSurvival.txt"
database <- read.delim(database, sep=";", head=T)

str(database)

# Make a new column with year as a numeric value
database <- cbind(database, as.numeric(rep(NA, nrow(database))))
colnames(database)[5] <- "DateYear"

# Enter year as a numeric value
for(row in 1:nrow(database)) {
  database$DateYear[row] <-  strsplit(database$Date[row], "-")[[1]][1]
}

# Make a new column for survival status
database <- cbind(database, rep(NA, nrow(database)))
colnames(database)[6] <- "SurvivalStatus"

# Import recapture data
recap <- "C:/Users/Simon/OneDrive - Lund University/Dokument/Simon/Undervisning/Open R sessions/HT2023/forloops/recaptureData2016.txt"
recap <-  read.delim(recap, sep=";", head=T)
str(recap)

# Update database with recapture data
for(row in 1:nrow(database)) {
  if(length(which(database$ID[row] == recap$ID)) > 0) {
    if(recap[which(database$ID[row] == recap$ID),2] == "Recaptured") {
      database$SurvivalStatus[row] <- "Alive"
    } else if(recap[which(database$ID[row] == recap$ID),2] == "Dead") {
      database$SurvivalStatus[row] <- "Dead"
    }
  } else {
    database$SurvivalStatus[row] <- "Unknown"
  }
}






### Nested for loops
rm(list=ls())

# Make empty vector 
mat <- matrix(NA, 5,5)
mat

# First loop for rows
for(i in 1:nrow(mat)) {
  mat[i, 1] <- i
}
mat

# Second loop for columns
for(j in 1:ncol(mat)) {
  mat[1, j] <- j
}
mat


# Nested loops, row first, column second

for(i in 1:nrow(mat)) {
  for(j in 1:ncol(mat)) {
    mat[i, j] <- paste(i, ",", j, sep="")
  }
}
mat

# Point out that indentation are there to make an overview easier:
for(i in 1:nrow(mat)) {for(j in 1:ncol(mat)) {mat[i, j] <- paste(i, ",", j, sep="")}}
mat

