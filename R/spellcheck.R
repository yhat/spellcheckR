

words <- function(text) {
  text <- tolower(text) 
  regmatches(text, gregexpr("[a-z]+", text, perl=TRUE))
}

train <- function(features) {
  table(factor(features, levels=VOCAB))
}

NWORDS <- readLines("./data/small.txt")
VOCAB <- c()
for (line in readLines("./data/small.txt")) {
  w <- words(line)
  VOCAB <- union(VOCAB, w)
}

lapply(NWORDS, train)
