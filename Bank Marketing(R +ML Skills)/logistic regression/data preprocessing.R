library(tidyverse) # library for data pre-processing

##########################  

# desc: Data pre-processing

# Read in data
read_data <- function() {
  # Read in the un-processed banking data
  df <- read.csv("bank-additional-full.csv") 
  return(df)  # Return data frame with the unrefined bank data
}

# Clean and preprocess the data
clean_data <- function(df) {
  clean_df <- df  # Create a copy of the banking data to clean
  
  # Encode categorical variables: job and marital status
  encoded_data_job <- as.data.frame(model.matrix(~ job - 1, df))
  encoded_data_marital <- as.data.frame(model.matrix(~ marital - 1, df))
  encoded_data_default <- as.data.frame(model.matrix(~ default - 1, df))
  # Remove original job and marital columns
  clean_df <- subset(clean_df, select = -c(job, marital, default))
  
  # Bind the new columns to the encoded data frame
  clean_df <- cbind(clean_df, encoded_data_job, encoded_data_marital,encoded_data_default)
  
  # Encode ordinal data: education
  education_levels <- c("illiterate" = 0, "basic.4y" = 1, "basic.6y" = 2, "basic.9y" = 3,
                        "high.school" = 4, "professional.course" = 5, "university.degree" = 6, "unknown" = NA)
  
  clean_df$education <- factor(df$education, levels = names(education_levels), ordered = TRUE)
  clean_df$education <- as.integer(clean_df$education) - 1  # Convert factor to integer codes
  
  # Encode binary variables (yes/no to 1/0)
  binary_vars <- c("default", "housing", "loan", "y")
  for (var in binary_vars) {
    clean_df[[var]] <- ifelse(df[[var]] == "yes", 1, ifelse(df[[var]] == "no", 0, NA))
  }
  
  # Encode 'contact' as a binary variable (assuming 'cellular' is 1 and 'telephone' is 0)
  clean_df$contact <- ifelse(df$contact == "cellular", 1, 0)
  
  
  # Encode 'month' and 'day_of_week'
  month_levels <- c("jan" = 1, "feb" = 2, "mar" = 3, "apr" = 4, "may" = 5, "jun" = 6,
                    "jul" = 7, "aug" = 8, "sep" = 9, "oct" = 10, "nov" = 11, "dec" = 12)
  day_levels <- c("mon" = 1, "tue" = 2, "wed" = 3, "thu" = 4, "fri" = 5)
  
  clean_df$month <- as.integer(recode(df$month, !!!month_levels))
  clean_df$day_of_week <- as.integer(recode(df$day_of_week, !!!day_levels))
  
  
  # Encode 'poutcome'
  poutcome_encoded <- model.matrix(~ poutcome - 1, df)
  clean_df <- cbind(clean_df, poutcome_encoded)
  
  # Modify 'pdays' and create 'previously_contacted'
  clean_df$previously_contacted <- ifelse(df$pdays == 999, 0, 1)
  clean_df$pdays <- ifelse(df$pdays == 999, NA, df$pdays)  # Optionally convert 999 to NA
  
  # Remove call duration 
  clean_df <- subset(clean_df, select = -c(duration))
  
  return(clean_df)
}


data <- read_data()
processed_data <- clean_data(data)

#remove outliers campaign >30

cleaned_data <- processed_data[-which(processed_data$campaign > 30), ]

# Normalize data but keep original target column unchanged
normalize_data <- function(df, target_col) {
  # Copy the original target column
  original_target <- df[[target_col]]
  
  # Identifying numeric columns
  numeric_cols <- sapply(df, is.numeric)
  
  # Exclude target column from normalization
  numeric_cols[target_col] <- FALSE
  
  # Applying z-score normalization to remaining numeric columns
  df[numeric_cols] <- scale(df[numeric_cols])
  
  # Replace the normalized target column with the original one
  df[[target_col]] <- original_target
  
  return(df)
}
normalized_data <- normalize_data(cleaned_data, target_col="y")

# Viewing the first few rows of the normalized data
head(normalized_data)

#delete the pdays colum( NA is a meaningful label), delete poutcome & default as they are encoded
normalized_data_selected<-normalized_data[, -which(names(normalized_data)=="pdays"|names(normalized_data)=="default"|names(normalized_data)=="poutcome")]

#delete the NA records
normalized_data_clean<-na.omit(normalized_data_selected)

#change column names
names(normalized_data_clean) <- gsub("-", "_", names(normalized_data_clean))


# Viewing the first few rows of the normalized data
head(normalized_data_clean)

