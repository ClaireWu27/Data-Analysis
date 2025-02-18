library(caret)
library(randomForest)
library(pROC)

data <- read.csv("bank-additional-full.csv") 

#remove outliers campaign >30
cleaned_data <- data[-which(data$campaign > 30), ]
#get the dataset
cleaned_data$y <- factor(cleaned_data$y)
cleaned_data$duration <- NULL
summary(cleaned_data$y)
#Ensure data reproducibility
set.seed(123)  
#Divide the training set and test set in the original data
train_indices <- createDataPartition(cleaned_data$y, p = 0.70, list = FALSE)  # p is training ration
train_data <- cleaned_data[train_indices, ]
test_data <- cleaned_data[-train_indices, ]
#class weigh change
class_weights <- ifelse(levels(train_data$y) == "no", 0.88, 0.12)

#random forest model for training set
model <- randomForest(y ~ ., data=train_data, 
                      ntree=200, 
                      mtry= 4,
                      sampsize= c(1000,1000),
                      nodesize = 15,
                      maxnodes=850,
                      classwt = class_weights)
test_predictions <- predict(model, test_data)
print(model)
varImpPlot(model)
# Calculating Confusion Matrices and Performance Metrics
conf_matrix <- table(Prediction = test_predictions, Reference = test_data$y)
print(conf_matrix)
conf_stats <- confusionMatrix(conf_matrix)
print(conf_stats)
# Assuming 'probabilities' are your model's probability outputs for the positive class "yes"
test_probabilities <- predict(model, test_data, type = "prob")
roc_result <- roc(test_data$y, test_probabilities[, "yes"])
# Plot ROC curve
plot(roc_result, main = "ROC Curve")
abline(a = 0, b = 1, lty = 2, col = "red")  # Add diagonal line

# Print AUC value
auc_value <- auc(roc_result)
print(paste("AUC:", auc_value))
#for train set
train_probabilities <- predict(model, train_data, type = "prob")
train_auc <- auc(roc(train_data$y, train_probabilities[, "yes"]))
print(train_auc)

