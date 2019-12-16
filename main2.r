data <- read.csv("trainingset.csv")
test <- read.csv("test.csv")
library(nnet)
#learn <- sample(1:nrow(data), round(2*nrow(data)/3))
model <- nnet(letter~., data = data, size = 2, maxit = 5000, decay = 0)#(no fuckin idea what does letter~. means)
#model <- nnet(letter~., data = data, subset=learn size = 2, maxit = 5000, decay = 0)#(no fuckin idea what does letter~. means)

p2 <- as.factor(predict(model.nnet, newdata=test[c(1:nrow(test),], type = "class"))
#p2 <- as.factor(predict(model.nnet, newdata=data[-learn,], type = "class")) 