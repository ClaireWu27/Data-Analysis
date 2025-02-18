#try stepwise regression
install.packages("MASS")  
library(MASS)

'''
full_model <- glm(y ~ ., data = normalized_data_clean, family = binomial)
step_model <- step(full_model, direction = "both")
summary(step_model)

'''

balanced_data <- normalized_data_clean

set.seed(123)
splitIndex <- sample(1:nrow(balanced_data), size = floor(0.8 * nrow(balanced_data)))

trainSet <- balanced_data[splitIndex, ]
testSet <- balanced_data[-splitIndex, ]

model <- glm(formula = y ~ age + education + contact + month + day_of_week + 
               campaign + emp.var.rate + cons.price.idx + cons.conf.idx + 
               euribor3m + nr.employed + jobadmin. + jobretired + jobstudent + 
               maritalmarried + defaultno + poutcomefailure + previously_contacted, 
             family = binomial, data = balanced_data)

train_pred <- predict(model, newdata = trainSet, type = "response")
test_pred <- predict(model, newdata = testSet, type = "response")
test_pred_class <- ifelse(test_pred > 0.5, 1, 0)

if (!require(caret)) install.packages("caret")
library(caret)

if (!require(pROC)) install.packages("pROC")
library(pROC)

conf_matrix <- confusionMatrix(as.factor(test_pred_class), as.factor(testSet$y))
print(conf_matrix)

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




# Print the summary of the model to get the coefficients
summary_model <- summary(model)
print(summary_model)

# Calculate Odds Ratios
odds_ratios <- exp(coef(model))

# Create a data frame to neatly display coefficients and odds ratios
results_df <- data.frame(
  Coefficients = coef(model),
  OddsRatios = odds_ratios
)

# Print the results
print(results_df)


