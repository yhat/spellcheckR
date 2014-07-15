library(stringr)

get_words <- function(text) {
  text <- tolower(text)
  text <- stringr::str_replace(text, "'", "")
  text <- unlist(stringr::str_split(text, "\\W"))
  text[text != ""]
}

train <- function(features) {
  table(factor(features, levels=VOCAB))
}

all_words <- character()
NWORDS <- readLines("./data/small.txt")
for (line in readLines("./data/small.txt")) {
  all_words <- c(all_words, get_words(line))
}

word_counts <- table(all_words)

