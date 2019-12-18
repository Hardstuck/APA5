#change the bit of a number randomly with 1.01-poisson distribution
mutate_letter <- function(letter){
  n_mutate <- c(sample.int(35, rpois(1, 1.01)))
  if(length(n_mutate) > 0) letter[n_mutate] = 1 - letter[n_mutate]
  return (letter)
}

#Creates from all the letter a document of N mutations.
generate_mutation <- function(N, data){
  newData <- data[sample.int(26, N, replace = T),]
  for(i in 1:nrow(newData)) newData[i, c(1:35)] <- mutate_letter(newData[i, c(1:35)])
  return (newData)
}

n.training <- 10000#(prompt="Introduce the cardinal of the training set of each letter :")

n.training <- as.integer(n.training)

data.letter <- read.table("letters.txt", header = FALSE)
example<-data.letter[sample.int(26, 5, replace = T),]
data.training <- generate_mutation(n.training, data.letter)
write.csv(data.training, file = "trainingset.csv", row.names=FALSE)
