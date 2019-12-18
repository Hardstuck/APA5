data <- read.csv("trainingset.csv")
library(nnet)
library(caret)
set.seed(5)

#If you don't want to wait 4 hours do not run it!
#training <- data[sample.int(10000, 100, replace = F),]
#sizes <- seq(1,20,by=2)
#decays <- 10^seq(-3, 0 , by = 0.01)
#trc <- trainControl(method = "repeatedcv", number = 10, repeats = 10)
#model.10x10CV <- train(V36~., data = training, method = 'nnet', maxit = 500, trace = FALSE, tuneGrid = expand.grid(.size=sizes ,.decay = decays), trControl = trc)

#resulted model in model.10x10CVF.regul

size <- 14
decay <- 0.5011872

learn <- sample(1:nrow(data), round(2*nrow(data)/3))
#model <- nnet(V36~., data = data, size = size, maxit = 5000, decay = decay)
model.nnet <- nnet(V36~., data = data, subset=learn, size = 10, maxit = 5000, decay = decay)

#p2 <- as.factor(predict(model.nnet, newdata=test[c(1:nrow(test),], type = "class"))
nlearn <- nrow(data[learn,])
p1 <- as.factor(predict(model.nnet, type = "class"))
t1 <- table(p1, data$V36[learn])
error_rate.train <- 100*(1-sum(diag(t1))/nlearn)

ntest <- nrow(data[-learn,])
p2 <- as.factor(predict(model.nnet, newdata=data[-learn,], type = "class"))
t2 <- table(p2, data$V36[-learn])
error_rate.test <- 100*(1-sum(diag(t2))/ntest)

#error_rate.train 0.239988
#error_rate.test 0.840084
