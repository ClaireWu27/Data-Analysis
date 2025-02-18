library(caret) 
library(randomForest)
library(pROC)

#get the dataset
data <- read.csv("bank-additional-full.csv") 
#remove outliers campaign >30
cleaned_data <- data[-which(data$campaign > 30), ]
#get the dataset
cleaned_data$y <- factor(cleaned_data$y)
cleaned_data$duration <- NULL
summary(cleaned_data$y)
#Ensure data reproducibility-
set.seed(123)  
# The ROSE package provides an implementation of the SMOTE algorithm
install.packages("ROSE")
library(ROSE)  
# Oversampling using the SMOTE algorithm, with N set to the desired number of samples for the minority class
# Counting the number of "yes" samples in the minority category
minority_size <- sum(cleaned_data$y == "yes")  
# Counting the number of "no" samples in the majority category
majority_size <- sum(cleaned_data$y == "no")
# Set the number of minority class samples you wish to achieve
desired_minority_size <- minority_size  # Make the sample size of the minority class equal to the majority class
# The total sample size N is the sum of the majority and adjusted minority categories
N = desired_minority_size + minority_size
cleaned_data <- ovun.sample(y ~ ., data = cleaned_data, method = "under", N )$data
summary(cleaned_data$y)

#Divide the training set and test set in the original data
train_indices <- createDataPartition(cleaned_data$y, p = 0.70, list = FALSE)  # p是训练集比例
train_data <- cleaned_data[train_indices, ]
test_data <- cleaned_data[-train_indices, ]

#Random forest model
model <- randomForest(y ~ ., data=train_data, )
test_predictions <- predict(model, test_data)
print(model)
varImpPlot(model)
# Calculating Confusion Matrices and Performance Metrics
predictions <- factor(test_predictions, levels = c("no", "yes"))
conf_matrix <- confusionMatrix(predictions, factor(test_data$y, levels = c("no", "yes")))
# Print accuracy, recall, precision
print(conf_matrix$overall['Accuracy'])    # Accuracy
print(conf_matrix$byClass['Sensitivity']) # Recall, also known as true positive rate
print(conf_matrix$byClass['Precision'])   # Precision
print(conf_matrix$byClass['F1'])          # F1 Score
conf_matrix <- confusionMatrix(test_predictions, test_data$y)
print(conf_matrix)

# Assuming 'probabilities' are your model's probability outputs for the positive class "yes"
test_probabilities <- predict(model, test_data, type = "prob")
roc_result <- roc(test_data$y, test_probabilities[, "yes"])
# Plot ROC curve
plot(roc_result, main = "ROC Curve")
abline(a = 0, b = 1, lty = 2, col = "red")  # Add diagonal line

# Print AUC value
auc_value <- auc(roc_result)
print(paste("AUC:", auc_value))



