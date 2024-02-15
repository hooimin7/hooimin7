# 20.	Write a script that asks the user for their name and greets them with their name.
# 21.	Modify the script above such that only users with names beginning with J are greeted.
name <- readline("Write your name:")
if ( substr(name,1,1)=='P') {
  cat('Hello ', name, '!\n', sep='') # the sep='' option prevents spaces between parts
}

