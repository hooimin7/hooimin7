translate_sequence <- function(seqv) {
   # A function that translates a sequence 
   # to its corresponding sequence of amino acids. 
   # There are 20 amino acids, each labelled with a single letter. 
   
   # Look-up table (strings converted to character vectors):
   Base_1 <- strsplit(tolower("TTTTTTTTTTTTTTTTCCCCCCCCCCCCCCCCAAAAAAAAAAAAAAAAGGGGGGGGGGGGGGGG"),"")[[1]]
   Base_2 <- strsplit(tolower("TTTTCCCCAAAAGGGGTTTTCCCCAAAAGGGGTTTTCCCCAAAAGGGGTTTTCCCCAAAAGGGG"),"")[[1]]
   Base_3 <- strsplit(tolower("TCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAG"),"")[[1]]
   amino_acids <- strsplit("FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIMMTTTTNNKKSS**VVVVAAAADDEEGGGG","")[[1]]
   n_aa <- floor(length(seqv)/3) # number of amino acids in sequence
   translation <- rep('*',n_aa)
   for ( i_aa in 1:n_aa) {
      codon <- seqv[(i_aa*3-2):(i_aa*3)]
      # combine logical vectors with & (AND):
      aa <- amino_acids[codon[1]==Base_1 & codon[2]==Base_2  & codon[3]==Base_3]
      if(length(aa)==0){ # Error check
         cat('Illegal codon,', codon, ', at position:', i_aa*3-2, '\n')
      }else{
         translation[i_aa] <- aa
      }
      # Alternative solution:
      # TCAG are given values (0,1,2,3), respectively
      #values <- 0:3
      #nucleotides <- c('t','c','a','g')
      #v1 <- values[codon[1]==nucleotides]
      #v2 <- values[codon[2]==nucleotides]
      #v3 <- values[codon[3]==nucleotides]
      #amino_acid_index <- 1 + v1*16 + v2*4 + v3
      #translation[i_aa] <- amino_acids[amino_acid_index]
   }
   return(translation)
}