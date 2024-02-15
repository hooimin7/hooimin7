source('find_start_codon.R')
source('find_stop_codon.R')

find_all_open_frames <- function(seqv, reading_frame) {
   # A function to find all open reading frames of a sequence
   minimal_frame_length <- 30 # exclude frames less than 10 codons
   # First find all start and stop codons:
   start_pos <- find_start_codon(seqv, reading_frame)
   stop_pos <- find_stop_codon(seqv,reading_frame)
   
   # An open reading frame starts with a start codon
   # and stops with the next stop codon. 
   # There can be other start codons in between.
   
   # store the result in a matrix with two columns.
   # Start with zero rows:
   open_frames <- matrix(nrow=0,ncol=2)
   # Next loop over start codons and find reading frames
   start_i <- 1 # index of current start codon
   repeat {
      # find all stop codons after the start codon:
      stops_after <- stop_pos[stop_pos > start_pos[start_i]]
      # is there at least one?
      if ( length(stops_after) >= 1) {
         next_stop <- stops_after[1] # position of the following stop codon
         # store frame:
         open_frames <- rbind(open_frames, c(start_pos[start_i], next_stop+2)) # add 2 to get the whole codon
         # find next start codon:
         start_i_after <- which(start_pos > next_stop) 
         if ( length(start_i_after) >= 1 ) {
            start_i <- start_i_after[1]
         } else {
            # there are no more start codons, we're done
            break # break the repeat loop
         }
      } else {
         # there are no more stop codons, we're done
         break
      }
   }
   # filter out short frames:
   frame_lengths <- open_frames[,2] - open_frames[,1]
   open_frames <- open_frames[ frame_lengths >= minimal_frame_length, ]
   return(open_frames)
}