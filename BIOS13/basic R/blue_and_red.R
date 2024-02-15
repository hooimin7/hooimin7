#### New script for D section ####
### D. Writing scripts ###
rm(list = ls())

## 12. First of all, decide where to save your scripts. A designated folder 
## is recommended. ##

## 13. Set it as working directory ##
setwd("~/Desktop/Random PhD/BIOS13_HT2021")

## 14. Create a new, empty, script file by choosing [File | New File | R script]
## from the menus. It should appear in an editor window. ##

## 15. Write a script that
## Assigns the value 3 to a variable named blue
## Assigns the value 5 to a variable named red
## Prints the text ‘Blue plus red is ‘ followed by the sum of the two 
## (the cat command is useful here).
## My solution looks like this:
blue <- 3
red <- 5
cat("Blue plus red is:", blue + red)
