
############################## train the model###############################################

#library for support vector machine
install.packages("e1071")
library(e1071)

cleaned_data <- normalized_data_clean

set.seed(123)
#split the data into training and testing sets.The ratio is 70:30 
indices <- sample(1:nrow(cleaned_data), size = 0.7 * nrow(cleaned_data)) 
trainData <- cleaned_data[indices,]
testData <- cleaned_data[-indices,]

# separate training value and target value
trainLabels <- trainData[, 15] #this is target value
trainFeatures <- trainData[,-15] 

testLabels <- testData[, 15]
testFeatures <- testData[,-15]


# ensure the target values are factors
trainLabels <- as.factor(trainLabels)
testLabels <- as.factor(testLabels)


# train a svm model
svmModel <- svm(trainFeatures, trainLabels, kernel = "radial", cost = 1, gamma = 0.01,probability = TRUE)

# View model summary
summary(svmModel)


# Make predictions on the testing dataset and extract probabilities
test_predictions <- predict(svmModel, testFeatures, probability = TRUE)
test_probabilities <- attr(test_predictions, "probabilities")[,2]  # Extract probabilities for the positive class

# Make predictions on the training dataset for comparison
train_predictions <- predict(svmModel, trainFeatures, probability = TRUE)
train_probabilities <- attr(train_predictions, "probabilities")[,2]  # Extract probabilities for the positive class


#evaluate the model
install.packages("caret")
library(caret)

conf_matrix<-confusionMatrix(as.factor(test_predictions), testLabels)
print(conf_matrix)

# For ROC and AUC
# Assuming binary classification and the positive class is the second level
library(pROC)
# Calculate ROC and plot AUC for both test and train sets
test_roc <- roc(testLabels, test_probabilities)
train_roc <- roc(trainLabels, train_probabilities)
test_auc <- auc(test_roc)
train_auc <- auc(train_roc)

# Plotting the ROC curves
plot(test_roc, main="ROC Curve for Training and Testing Data", col="#1c61b6", print.auc=TRUE)
lines(train_roc, col="#ff5733")
legend("bottomright", legend=c(paste("Test AUC =", round(test_auc, 3)), paste("Train AUC =", round(train_auc, 3))), 
       fill=c("#1c61b6", "#ff5733"))

###############################################################################


