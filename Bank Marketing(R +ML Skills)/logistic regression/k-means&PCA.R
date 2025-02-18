# Load required libraries
if (!require("ggplot2")) install.packages("ggplot2", dependencies = TRUE)
if (!require("cluster")) install.packages("cluster", dependencies = TRUE)
library(ggplot2)
library(cluster)

clusted_data<-normalized_data_clean
# Setting a random seed for reproducibility
set.seed(123)

# Assuming normalized_data_clean is preprocessed and ready for clustering
# Performing k-means clustering
k <- 2
kmeans_result <- kmeans(clusted_data, centers = k, nstart = 25)  # nstart to avoid local minima

# Output the results of the clustering
print(kmeans_result)

# Calculate the count for each cluster
cluster_counts <- table(kmeans_result$cluster)


# Determine which cluster is the minority
minority_cluster <- which.min(cluster_counts)

# Adjust cluster labels according to the need, ensuring the minority class label is 1
clusted_data$cluster <- ifelse(kmeans_result$cluster == minority_cluster, 0, 1)

# Convert to factor to ensure levels are 0 and 1
clusted_data$cluster <- factor(clusted_data$cluster, levels = c(0, 1))

# Check to ensure there are no NAs generated
sum(is.na(clusted_data$cluster))

# Now proceed with PCA
pca_result <- prcomp(clusted_data[, sapply(clusted_data, is.numeric)], scale. = TRUE)

# Create a new data frame for PCA plotting
# Use the updated $cluster as a factor for the color aesthetic
pca_data <- data.frame(pca_result$x[, 1:2], cluster = clusted_data$cluster)

# Plotting PCA results
ggplot(pca_data, aes(x = PC1, y = PC2, color = cluster)) +
  geom_point(alpha = 0.5) +
  labs(title = "PCA Plot of Clusters")

# Print PCA loadings
loadings <- pca_result$rotation
print(loadings)

# Assuming normalized_data_clean$y contains the original 'yes' or 'no' categories
# Create a contingency table to compare cluster assignments with original category labels
contingency_table <- table(clusted_data$cluster, clusted_data$y)

# To get a percentage version of the contingency table, use prop.table()
prop_table <- prop.table(contingency_table, margin = 1)

# Print the percentage contingency table
print(prop_table)

# Visualize the contingency table data using ggplot2
ggplot(as.data.frame(prop_table), aes(Var1, Var2, fill = Freq)) +
  geom_tile() + 
  geom_text(aes(label = scales::percent(Freq)), vjust = 1) +
  labs(x = "Original Category ", y = "Cluster", fill = "Percentage")
clusted_data$PC1 <- pca_result$x[,1]

