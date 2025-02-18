'''
#library for support vector machine
install.packages("e1071")
library(e1071)

cleaned_data <- normalized_data

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
'''

# parameter tuning
tuneResult <- tune.svm(trainFeatures, 
                       trainLabels, 
                       kernel = "radial",
                       cost = 10^(-1:3), 
                       gamma = 10^(-3:1) )

# View optimal parameters
print(tuneResult$best.parameters)

