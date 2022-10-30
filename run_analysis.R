#Written by Alex Szabo - 10/30/2022 - for Getting and Cleaning Data Final Project

library(dplyr)
library(httr)

data_file_name <- "projectData.zip"
GET("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", write_disk(data_file_name, overwrite = TRUE))
unzip(data_file_name)

data_folder <- "UCI HAR Dataset"
features <- read.table(paste(data_folder, "features.txt",sep = "/"), col.names = c("id","features"))
activity_labels <- read.table(paste(data_folder, "activity_labels.txt", sep = "/"), col.names = c("id", "activity"))

subject_test <- read.table(paste(data_folder, "test/subject_test.txt", sep = "/"), col.names = "subject")
X_test <- read.table(paste(data_folder, "test/X_test.txt", sep="/"), col.names = features$features)
y_test <- read.table(paste(data_folder, "test/y_test.txt", sep = "/"), col.names = "testLabels")

subject_train <- read.table(paste(data_folder, "train/subject_train.txt", sep = "/"), col.names = "subject")
X_train <- read.table(paste(data_folder, "train/X_train.txt", sep = "/"), col.names = features$features)
y_train <- read.table(paste(data_folder, "train/y_train.txt", sep = "/"), col.names = "testLabels")

combined_subject <- rbind(subject_train, subject_test)
combined_y <- rbind(y_train, y_test)
combined_x <- rbind(X_train, X_test)
combined_data <- cbind(combined_subject, combined_y, combined_x)

extracted_data <- select(combined_data, subject, testLabels, matches(".*mean().*"), matches(".*std().*"))
extracted_data$testLabels <- activity_labels[extracted_data$testLabels, 2]

grouped_data <- group_by(extracted_data, subject, testLabels)
averaged_data <- summarize_if(grouped_data, is.numeric, mean)

write.table(averaged_data, "TidyDataSet.txt", row.name=FALSE)
