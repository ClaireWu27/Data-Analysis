if (!require(ROSE)) install.packages("ROSE")
library(ROSE)
balanced_data <- ovun.sample(y ~ ., data = normalized_data_clean, method = "under", N = 10000)$data

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

#evaluate the model
if (!require(caret)) install.packages("caret")
library(caret)

conf_matrix<-confusionMatrix(as.factor(test_pred_class), as.factor(testSet$y))
print(conf_matrix)

# Install and load the pROC package
if (!require(pROC)) install.packages("pROC")
library(pROC)

# Generate ROC objects for the training set and compute the AUC
roc_train <- roc(response = trainSet$y, predictor = train_pred)
auc_train <- auc(roc_train)
print(paste("Training Set AUC:", auc_train))

# Generate the ROC object for the test set and calculate the AUC
roc_test <- roc(response = testSet$y, predictor = test_pred)
auc_test <- auc(roc_test)
print(paste("Testing Set AUC:", auc_test))

# Plotting ROC curves
plot(roc_train, main = "ROC Curve Comparison", col = "blue", lty = 1)  # Training set ROC curve
plot(roc_test, add = TRUE, col = "red", lty = 2)  # Testing set ROC curve
legend("bottomright", legend = c("Training Set", "Testing Set"), col = c("blue", "red"), lty = c(1, 2))