if (!require(ROSE)) install.packages("ROSE")
library(ROSE)

balanced_data <- ovun.sample(y ~ ., data = normalized_data_clean, method = "over", N = 70000)$data

table(balanced_data$y)


set.seed(123)
splitIndex <- sample(1:nrow(balanced_data), size = floor(0.75 * nrow(balanced_data)))

trainSet <- balanced_data[splitIndex, ]
testSet <- balanced_data[-splitIndex, ]

model <- glm(y ~ ., data = trainSet, family = binomial)
#predict on the test set
train_pred <- predict(model, newdata = trainSet, type = "response")
test_pred <- predict(model, newdata = testSet, type = "response")
test_pred_class <- ifelse(test_pred > 0.4, 1, 0)

if (!require(caret)) install.packages("caret")
library(caret)

if (!require(pROC)) install.packages("pROC")
library(pROC)

conf_matrix <- confusionMatrix(as.factor(test_pred_class), as.factor(testSet$y))
print(conf_matrix)


