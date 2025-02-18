'''
# Normalize data
normalize_data <- function(df) {
  # Identifying numeric columns
  numeric_cols <- sapply(df, is.numeric)
  
  # Applying z-score normalization to numeric columns
  df[numeric_cols] <- scale(df[numeric_cols])
  
  return(df)
}

feature_data <- normalize_data(cleaned_data)

#analyse the general properties of the dataset
library(dplyr)
library(ggplot2)


# Distribution of the target variable
ggplot(feature_data, aes(x=factor(y))) + geom_bar() + 
  labs(title="Distribution of y", x="y", y="Count")



# Correlation matrix
install.packages("corrplot")
library(corrplot)

#transform feature names to numbers for easier viewing
rename_feature_data <- feature_data
new_col_names <- as.character(1:38)
colnames(rename_feature_data) <- new_col_names

#draw the correlation matrix, number15 is the target value
corr <- cor(rename_feature_data[sapply(rename_feature_data, is.numeric)])
corrplot(corr, method="color",tl.cex = 0.6)

'''

# find the most important features
library(randomForest)


rf_data <- cleaned_data
rf_features <- cleaned_data[,-15]
rf_target <- cleaned_data[,15]


set.seed(123)
rf_model <- randomForest(rf_features,rf_target,importance=TRUE, ntree=500)

importance_matrix <- importance(rf_model)

print(colnames(importance_matrix))
importance_scores <- importance_matrix[, "%IncMSE"]

# sort the feature importance
sorted_importance <- sort(importance_scores, decreasing = TRUE)
varImpPlot(rf_model)

# choose the top 10 important features
top_features <- names(sorted_importance)[1:10]

# create a new dataset that only includes the 10 most important features
new_dataset <- rf_features[, top_features, drop = FALSE] 

new_dataset$y <- rf_target

# use the new dataset to train a svm model

#library for support vector machine
library(e1071)

cleaned_data <- new_dataset

set.seed(123)
# split the data into training and testing sets. The ratio is 80:20 
indices <- sample(1:nrow(cleaned_data), size = 0.75 * nrow(cleaned_data)) 
trainData <- cleaned_data[indices,]
testData <- cleaned_data[-indices,]

# separate training value and target value
trainLabels <- trainData[, 11] # this is target value
trainFeatures <- trainData[,-11] 

testLabels <- testData[, 11]
testFeatures <- testData[,-11]

# ensure the target values are factors
trainLabels <- as.factor(trainLabels)
testLabels <- as.factor(testLabels)


# train a svm model with class weights
svmModel <- svm(trainFeatures, trainLabels, kernel = "radial", cost = 100, gamma = 0.01, 
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

