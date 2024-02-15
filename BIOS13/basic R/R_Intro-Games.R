rm(list = ls())
library("plotrix")

#Tictactoe####
tictactoe <- function() {
  cat("Welcome to our Tic-tac-toe game")
  name1 <- readline(prompt = "First player (you will start and get the white cells), enter your name here: ")
  name2 <- readline(prompt = "Second player (you go second and will get the black cells), enter your name here: ")
  tictacmatrix <- matrix(0, ncol = 3, nrow = 3)
  winner <- F
  
  repeat {
    cat(name1, "it's your turn! What cell do you chose?")
    numchosen1 <- as.numeric(readline(prompt = "Number chosen: "))
    while (tictacmatrix[numchosen1] != 0) {
      if (tictacmatrix[numchosen1] != 0) {
        cat("That cell was already selected, pick another one.")
        numchosen1 <- as.numeric(readline(prompt = "Number chosen: "))
      }
    }
    tictacmatrix[numchosen1] <- -1
    cellcolors <- unlist(tictacmatrix)
    cellcolors <- ifelse(cellcolors == 0, "grey", ifelse(cellcolors == 1, "black", "white"))
    color2D.matplot(tictacmatrix, xlab = "", axes = F, ylab = "", cellcolors = cellcolors)
    columns <- abs(colSums(tictacmatrix))
    rows <- abs(rowSums(tictacmatrix))
    diag <- abs(sum(diag(tictacmatrix)))
    diag2 <- abs(tictacmatrix[1,3] + tictacmatrix[2,2] + tictacmatrix[3,1])
      if (any(columns == 3) | any(rows == 3) | diag == 3 | diag2 == 3) {
        winner <- T
      }
    if (winner) {
      cat("Congratulations", name1, "you won!")
      break
    }
    if (sum(abs(tictacmatrix)) == 9) {
      cat("I'm sorry, nobody won this game")
      break
    }
    cat(name2, "it's your turn now! What cell do you chose?")
    numchosen2 <- as.numeric(readline(prompt = "Number chosen: "))
    while (tictacmatrix[numchosen2] != 0) {
      if (tictacmatrix[numchosen2] != 0) {
        cat("That cell was already selected, pick another one.")
        numchosen2 <- as.numeric(readline(prompt = "Number chosen: "))
      }
    }
    tictacmatrix[numchosen2] <- 1
    cellcolors <- unlist(tictacmatrix)
    cellcolors <- ifelse(cellcolors == 0, "grey", ifelse(cellcolors == 1, "black", "white"))
    color2D.matplot(tictacmatrix, xlab = "", axes = F, ylab = "", cellcolors = cellcolors)
    columns <- abs(colSums(tictacmatrix))
    rows <- abs(rowSums(tictacmatrix))
    diag <- abs(sum(diag(tictacmatrix)))
    diag2 <- abs(tictacmatrix[1,3] + tictacmatrix[2,2] + tictacmatrix[3,1])
    if (any(columns == 3) | any(rows == 3) | diag == 3 | diag2 == 3) {
      winner <- T
    }
    if (winner) {
      cat("Congratulations", name2, "you won!")
      break
    }
    if (sum(abs(tictacmatrix)) == 9) {
      cat("I'm sorry, nobody won this game")
      break
    }
  }
}

#Rock paper scissors####
rockpaper <- function() {
  cat("Welcome to our Rock Paper Scissors game \n")
  cat("For this game you will be playing against the computer")
  name <- readline(prompt = "Enter your name here: ")
  hands <- c("Rock", "Paper", "Scissors", "rock", "paper", "scissors")
  winner = F
  repeat {
    cat("Rock, paper, scissors go!")
    selhand <- readline(prompt = "Select your hand: ")
    computerhand <- sample(hands, 1)
    cat("Computer chose", computerhand, "\n")
    if (nchar(computerhand) == nchar(selhand)) {
      cat("Nobody won, again!")
    } else if ((nchar(computerhand) == 4 & nchar(selhand) == 8) |
               (nchar(computerhand) == 5 & nchar(selhand) == 4) |
               (nchar(computerhand) == 8 & nchar(selhand) == 5)) {
      cat("Computer won!")
      break
    } else if ((nchar(selhand) == 4 & nchar(computerhand) == 8) |
               (nchar(selhand) == 5 & nchar(computerhand) == 4) |
               (nchar(selhand) == 8 & nchar(computerhand) == 5)) {
      cat("Congratulations,", name, "you won!")
      break
    }
  }
}

#Guess a number with a friend!####
guessnumber <- function() {
  cat("Welcome to our Guess the Number game")
  name1 <- readline(prompt = "Write your name here: ")
  name2 <- readline(prompt = "Write your friend's name here: ")
  maxnum <- 10
  numchosen <- sample.int(maxnum, 1)
  winner <- F
  repeat {
    numguess <- as.numeric(readline(prompt = "Guess a number between 1 and 10: "))
    numguess2 <- as.numeric(readline(prompt = "Make your friend guess a number between 1 and 10: "))
    if (numguess == numchosen) {
      cat("The correct number was", numchosen, "\n")
      cat("Congratulations,", name1, "you win!\n")
      break
    } else {
      cat("I'm sorry,", name1, "your answer is incorrect.\n")
    }
    if (numguess2 == numchosen) {
      cat("The correct number was", numchosen, "\n")
      cat("Congratulations,", name2, "you win!\n")
      break
    } else {
      cat("I'm sorry,", name2, "your answer is incorrect.\n")
    }
  }
  
}
