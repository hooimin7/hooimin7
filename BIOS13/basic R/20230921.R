setwd("/Users/med-snt/Documents/Rworkshop")
getwd()
rm(list = ls())
list.files()
ls()
data <- read.delim("Simple_data.txt", head = T, sep = "\t")
head(data)
str(data)
table(data$Species)
table(data$Sex)
table(data$Species, data$Sex)
table(data$Population, data$Species)
2^8
exp(x) 
log(x)
sin(x)
cos(x)
tan(x)
asin(x)
acos(x)
atan(x)
log10(x)
sqrt(x)
abs(x)
pi
round(x) #nearest
floor(x) #down
ceiling(x) #up
any(x == 8)
m <- matrix(1:6, 2, 3) # 2 rows, 3 col
m[5]
m[2, 3]
z <- x*y
w <- z^2 + (x/y)
str(w)
class(w) #check if integer
as.integer(w)
class(as.integer(w)) #check if integer in one line
class(z)
is.numeric(w) #answer is TRUE
name <- "HMin"
substr(name,1, 3)
substr("HMin", 1, 3)
substr(name, 4, 4) #extract one letter
first <- substr(name, 1, 2)
last <- substr(name, 3, 4)
newname <- paste(first, last, sep = "")
newname <- paste0(first, last)
is.character(name)
is.character(newname)
checkNameLength <- function(name) {
  if(is.character(name) && nchar(name) ==4) {
    return(TRUE)
  } else{
    return(FALSE)
  }
}
result <- checkNameLength(newname)
  if(result) {
    cat("The variable 'newname' contains exactly 4 characters.")
  } else{
  cat("The variable 'newname' does not contains exactly 4 characters.")
}
x <- 3
y <- 4
z == x #check if z is x
z == name 
numvect <- c(x, w, z, y) #create a vector
charvect <- c(newname, last, name, first) #create a vector 
names(numvect) <- charvect
seq(1, 5, by = 2) #create a seq 1:5, sliced by 2
seq(1,6, length = 9) # equal distribution numbers
v1 <- 1:10
v2 <- rep(v1, 3)
v1[c(3, 7, 10)] <- c(25, 8, 58) #change value at position 3,7,10 to 25, 8, 58
v3 <- cumsum(v1) # to add the number before each number
sum(v3) #total of v3
mean(v3)
max(v3)
min(v3)
sort(v3, decreasing = T)
summary(v3) #information including the minimum
        #value, 1st and 3rd quantiles, median, mean and maximum value
summary_v3 <- summary(v3)
# Extract the median value
firtstQu_v3 <- summary_v3["1st Qu."]
# Print the median value
cat("The 1st Qu. of v3 is:", firtstQu_v3)
v1[length(v1)] #to get the last element of vector 1
length(v1) #to get the total length of the vector
k <- v1[2] #extract second element 
v4 <- k*v2 #k multiply by v2
sum(v2)
v4[1:10] <- v1 # assign v1 to the first 10 element of v4
v5 <- v4[v4 > 7]# Extact all elements in v4 that are higher than 7 in a new vector called v5
v5[v5 == 8] <- 46
length(v5) == 19 #ask if 19 elements
v5[20] <- 77 #Add a 20th element in v5
v5 <- c(v5, 77) #Add 77 as the last element
paste("sample", 1:6) #name different columns of a matrix or data frame
v6 <- v5[-c(21)] # to remove element using index
mat <- matrix(v6, nrow = 5, ncol = 4) #Create a matrix named mat with 5 rows and 4 columns
mat <-matrix(v6, 5, 4)
mat2 <- matrix(v6, 10, 2)
colnames(mat) <- c("n1", "n2", "n3", "n4") #Change the names of the columns
(colnames(mat) <- charvect[1:4]) #change name by indexing at correct number of column 
summary(mat) # extract some statistics from matrices
mat[3, 4] # Extract the element in the 3rd row and 4th column of the matrix
col3 <- mat[, 3] #Extract all elements in the 3rd column of the matrix mat into an object
is.object(col3) #the answer is False
is.numeric(col3) #the answer is True
mat <- as.data.frame(mat) # change to data frame
mat2 <- as.data.frame(mat2)  # change to data frame, with default name v1, v2
fact <- factor(c("Yes", "No", "Yes", "Yes", "No"))
print(fact)
str(fact)
