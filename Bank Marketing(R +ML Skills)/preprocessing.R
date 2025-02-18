library(tidyverse)
library(dplyr)
install.packages('visdat')
library(visdat)
library(ggplot2)
# 1. data loading and initial explorary
data<-read.csv('bank-additional-full.csv')
head(data)
# 1.1 data structure
str(data)

#1.2 variable filtering,reomove duration column
data<-data[,-which(names(data)=='duration')]


#1.3 handle missing value
apply(data,2,function(x) sum(x=='unknown'))
# job, martial,education,default unknown values keep as a labe, housing, loan unknown values delete
handled_miss_df<-data%>%
  filter(housing!='unknown'| loan!='unknown')
#1.4 handle outliers
# change month，day of week to integer
month_map <- c("jan" = 1, "feb" = 2, "mar" = 3, "apr" = 4, "may" = 5, "jun" = 6,
               "jul" = 7, "aug" = 8, "sep" = 9, "oct" = 10, "nov" = 11, "dec" = 12)
handled_miss_df$month<-month_map[handled_miss_df$month]

day_map <- c("mon" = 1, "tue" = 2, "wed" = 3, "thu" = 4, "fri" = 5)
handled_miss_df$day_of_week<-day_map[handled_miss_df$day_of_week]

# data statistics
summary(handled_miss_df)

# boxplot for campaign
ggplot(handled_miss_df,aes(y=campaign))+geom_boxplot()

#filter out campaign>30
cleaned_df<-handled_miss_df %>%
filter(campaign<=30)

# histogram of pdays
ggplot(cleaned_df,aes(x=pdays))+geom_histogram() 

#filter out pdays>30 (not include 999)
cleaned_df<-cleaned_df%>%
  filter(pdays<30|pdays==999)

#histogram of previous
  ggplot(cleaned_df,aes(x=previous))+geom_histogram()

# 1.5 one-hot encoding
  encoded_job<-model.matrix(~job-1,data=cleaned_df)
  encoded_marital<-model.matrix(~marital-1,data=cleaned_df)
  encoded_default<-model.matrix(~default-1,data=cleaned_df)
  encoded_poutcome<-model.matrix(~poutcome-1,data=cleaned_df)
  cleaned_df<-cbind(cleaned_df,encoded_job,encoded_marital,encoded_default,encoded_poutcome)
  
  head(cleaned_df)
#remove origional column
cleand_df<-cleaned_df%>%
  select(-c(job,marital,default,poutcome))

#one-hot education(with ordinary)
education_map <- c("illiterate" = 0, "basic.4y" = 1, "basic.6y" = 2, "basic.9y" = 3,
                      "high.school" = 4, "professional.course" = 5, "university.degree" = 6, "unknown" = NA)
cleand_df$education<-education_map[cleand_df$education]

#one hot default
default_map<-c('yes'=1,'no'=0,'unknown'=NA)
cleand_df$default<-default_map[cleand_df$default]
#one hot binary variables  housing,loan,contact
cleand_df$housing<-ifelse(cleand_df$housing=='yes',1,0)
cleand_df$loan<-ifelse(cleand_df$loan=='yes',1,0)
#One hot contact
cleand_df$contact<-ifelse(cleand_df$contact=='cellular',1,0)

