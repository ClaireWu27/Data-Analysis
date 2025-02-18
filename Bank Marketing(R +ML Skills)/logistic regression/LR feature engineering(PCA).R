
# #set a random seed to ensure reporducibility
set.seed(123)

# #create a splitting index
 splitIndex<-sample(1:nrow(clusted_data), size=floor(0.8*nrow(clusted_data)))
 
# #create training and testing sets
 trainSet<-clusted_data[splitIndex, ]
testSet<-clusted_data[-splitIndex, ]
 
# #building the model on the training set
logistic_model_pca <- glm(y ~ PC1, data = clusted_data, family = binomial("logit"))

# #predict on the test set
train_pred <- predict(logistic_model_pca, newdata = trainSet, type = "response")
test_pred <- predict(logistic_model_pca, newdata = testSet, type = "response")
test_pred_class <- ifelse(test_pred > 0.5, 1, 0)

# #evaluate the model
if (!require(caret)) install.packages("caret")
library(caret)

conf_matrix<-confusionMatrix(as.factor(test_pred_class), as.factor(testSet$y))
print(conf_matrix)

# # Install and load the pROC package
if (!require(pROC)) install.packages("pROC")
# library(pROC)
 
# # Generate ROC objects for the training set and compute the AUC
roc_train <- roc(response = trainSet$y, predictor = train_pred)
auc_train <- auc(roc_train)
print(paste("Training Set AUC:", auc_train))

# # Generate the ROC object for the test set and calculate the AUC
roc_test <- roc(response = testSet$y, predictor = test_pred)
auc_test <- auc(roc_test)
print(paste("Testing Set AUC:", auc_test))

# # Plotting ROC curves
plot(roc_train, main = "ROC Curve Comparison", col = "blue", lty = 1)  # Training set ROC curve
plot(roc_test, add = TRUE, col = "red", lty = 2)  # Testing set ROC curve
legend("bottomright", legend = c("Training Set", "Testing Set"), col = c("blue", "red"), lty = c(1, 2))

summary(logistic_model_pca)