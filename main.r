data <- read.csv("trainingset.csv")
library(nnet)
library(caret)
training <- data[sample.int(10000, 100, replace = F),]
#learn <- sample(1:nrow(data), round(2*nrow(data)/3))
#model <- nnet(letter~., data = data, size = 2, maxit = 5000, decay = 0)#(no fuckin idea what does letter~. means)
#model <- nnet(letter~., data = data, subset=learn size = 2, maxit = 5000, decay = 0)#(no fuckin idea what does letter~. means)

#p2 <- as.factor(predict(model.nnet, newdata=test[c(1:nrow(test),], type = "class"))
#p2 <- as.factor(predict(model.nnet, newdata=data[-learn,], type = "class"))

sizes <- seq(1,20,by=2)
trc <- trainControl(method = "repeatedcv", number = 10, repeats = 10)
model.10x10CV <- train(V36~., data = training, method = 'nnet', maxit = 500, trace = FALSE, tuneGrid = expand.grid(.size=sizes ,.decay = 0), trControl = trc)
model.10x10CV$results.
