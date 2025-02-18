install.packages("e1071")
library(e1071)

cleaned_data <- normalized_data

set.seed(123)
# split the data into training and testing sets. The ratio is 80:20 
indices <- sample(1:nrow(cleaned_data), size = 0.8 * nrow(cleaned_data)) 
trainData <- cleaned_data[indices,]
testData <- cleaned_data[-indices,]

# separate training value and target value
trainLabels <- trainData[, 15] # this is target value
trainFeatures <- trainData[,-15] 

testLabels <- testData[, 15]
testFeatures <- testData[,-15]

# ensure the target values are factors
trainLabels <- as.factor(trainLabels)
testLabels <- as.factor(testLabels)

# Calculate class weights for imbalanced data
table_labels <- table(trainLabels)  # Count each class
n_samples <- length(trainLabels)    # Total number of samples
class_weights <- n_samples / (length(table_labels) * table_labels)  # Calculate weights
class_weights <- as.list(class_weights)  # Convert weights to list format

# train a svm model with class weights
svmModel <- svm(trainFeatures, trainLabels, kernel = "radial", cost = 1, gamma = 0.01, 
                class.weights = class_weights)

# View model summary
summary(svmModel)

# Make predictions on the testing dataset and extract decision values
test_predictions <- predict(svmModel, testFeatures, decision.values = TRUE)
test_decision_values <- attr(test_predictions, "decision.values")

# Make predictions on the training dataset for comparison
train_predictions <- predict(svmModel, trainFeatures, decision.values = TRUE)
train_decision_values <- attr(train_predictions, "decision.values")

# Evaluate the model using confusion matrix
library(caret)
conf_matrix <- confusionMatrix(as.factor(test_predictions), testLabels)
print(conf_matrix)

# Calculate ROC and plot AUC for both test and train sets using decision values
library(pROC)
test_roc <- roc(response = testLabels, predictor = test_decision_values)
train_roc <- roc(response = trainLabels, predictor = train_decision_values)
test_auc <- auc(test_roc)
train_auc <- auc(train_roc)

# Plotting the ROC curves
plot(test_roc, main="ROC Curve for Training and Testing Data", col="#1c61b6", print.auc=TRUE)
lines(train_roc, col="#ff5733")
legend("bottomright", legend=c(paste("Test AUC =", round(test_auc, 3)), paste("Train AUC =", round(train_auc, 3))), 
       fill=c("#1c61b6", "#ff5733"))



