# setwd("/Users/med-snt/Documents/Rworkshop")
# getwd()
#rm(list = ls())
# install.packages('seqinr')
#Q4
library('seqinr')
mito_fasta = read.fasta('NC_012920.fasta')
mito_seq = mito_fasta$NC_012920.1
print(mito_seq)
length(mito_seq)

nucleo_content = function(x) {


na = 0
nt = 0
ng = 0
nc = 0

for(i in 1:length(x)){
   if(x[i] == "a") na = na+1
   if(x[i] == "t") nt = nt+1
   if(x[i] == "g") ng = ng+1
   if(x[i] == "c") nc = nc+1
}
#gc_content = (ng + nc) / length(x)*100
#print(gc_content)
c_content = nc / length(x)*100
g_content = ng / length(x)*100
a_content = na / length(x)*100
t_content = nt / length(x)*100
print(c_content)
print(g_content)
print(a_content)
print(t_content)
total = sum(c(c_content, g_content, a_content, t_content))
print(total)
}
nucleo_content(mito_seq)
###############################
#Q5
create_complement = function(x) {
x = x[length(x):1]
for(i in 1:length(x)){
     if(x[i] == "a") x[i] = "t"
     else if(x[i] == "t") x[i] = "a"
     else if(x[i] == "g") x[i] = "c"
     else if(x[i] == "c") x[i] = "g"
}
return(x)
}
#create_complement(c('a','t','g'))
create_complement(c(mito_seq))
k = create_complement(c(mito_seq)) 
nucleo_content(k)
################################
find_codon = function(x) {
  
}




