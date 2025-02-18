# Install and load the e1071 package
install.packages("e1071")
library(e1071)


# If the target variable is not a factor type, convert it to a factor type
cleaned_data$y <- as.factor(cleaned_data$y)

# Split the dataset into training set and test set
set.seed(123)  
index <- sample(1:nrow(cleaned_data), round(0.7 * nrow(cleaned_data)))
train_data <- cleaned_data[index, ]
test_data <- cleaned_data[-index, ]

#Training the Model
model <- naiveBayes(y ~ ., data = train_data)

# Predictions on the test set
predictions <- predict(model, test_data)

#evaluate the model
if (!require(caret)) install.packages("caret")
library(caret)

conf_matrix<-confusionMatrix(as.factor(predictions), as.factor(test_data$y))
print(conf_matrix)



# Install and load the pROC package if it's not already installed
if (!require(pROC)) install.packages("pROC")
library(pROC)

train_pred <- predict(model, train_data, type = "raw")[, "0"]
test_pred <- predict(model, test_data, type = "raw")[, "0"]

# Generate ROC objects for the training set and compute the AUC
roc_train <- roc(response = train_data$y, predictor = train_pred)
auc_train <- auc(roc_train)
print(paste("Training Set AUC:", auc_train))

# Generate the ROC object for the test set and calculate the AUC
roc_test <- roc(response = test_data$y, predictor = test_pred)
auc_test <- auc(roc_test)
print(paste("Testing Set AUC:", auc_test))

# Plotting ROC curves
plot(roc_train, main = "ROC Curve Comparison", col = "blue", lty = 1)  # Training set ROC curve
plot(roc_test, add = TRUE, col = "red", lty = 2)  # Testing set ROC curve
legend("bottomright", legend = c("Training Set", "Testing Set"), col = c("blue", "red"), lty = c(1, 2))




######### after feature engineering####

model <- naiveBayes(y ~ age + education + contact + month + day_of_week + 
                      campaign + emp.var.rate + cons.price.idx + cons.conf.idx + 
                      euribor3m + nr.employed + jobadmin. + jobretired + jobstudent + 
                      maritalmarried + defaultno + poutcomefailure + previously_contacted, 
                    data = train_data)



####k-cross validation#####

# 安装并加载必要的包
if (!require(caret)) install.packages("caret")
library(caret)
if (!require(e1071)) install.packages("e1071")
library(e1071)

# 确保目标变量是因子类型
cleaned_data$y <- as.factor(cleaned_data$y)

# 设置交叉验证的控制参数，这里使用10折交叉验证
set.seed(123)  # 为了可重复性设置随机种子
train_control <- trainControl(method = "cv", number = 10, savePredictions = "final")

# 训练模型使用交叉验证
model <- train(y ~ ., data = cleaned_data, method = "nb", trControl = train_control)

# 打印模型的详细结果
print(model)

# 评估模型：计算平均精度、召回率和F-测度
conf_matrix <- confusionMatrix(model$pred$pred, model$pred$obs)
print(conf_matrix)

# 使用pROC包来评估AUC
if (!require(pROC)) install.packages("pROC")
library(pROC)

# 对每一折的预测计算ROC和AUC
roc_results <- lapply(unique(model$pred$Resample), function(r) {
  pred_subset <- model$pred[model$pred$Resample == r,]
  roc_obj <- roc(pred_subset$obs, as.numeric(pred_subset$pred))
  auc_obj <- auc(roc_obj)
  list(roc = roc_obj, auc = auc_obj)
})

# 计算平均AUC
mean_auc <- mean(sapply(roc_results, function(x) x$auc))
print(paste("Average AUC:", mean_auc))

# 绘制ROC曲线
plot(roc_results[[1]]$roc, main = "ROC Curve Example from First Fold", col = "blue")
for(i in 2:length(roc_results)) {
  plot(roc_results[[i]]$roc, add = TRUE, col = i)
}
legend("bottomright", legend = paste("Fold", 1:length(roc_results)), col = 1:length(roc_results), lty = 1)

