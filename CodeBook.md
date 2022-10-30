The run_analysis.R script implements the directions given for the final project of the "Getting and Cleaning Data" course.  This is accomplished with these steps.

1. Include required libraries
	-The libraries dplyr and httr are required by this script

2. Download and unzip the required data
	-The data required for this analysis is automatically downloaded from the following URL:
		https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	-The file is named projectData.zip and saved in the current working directory
	-The file is is then unzipped to the current working directory
		
3. Importing the data
	-Each data file is loaded into a data frame with the same name
		-features - Rows: 561 x Columns: 2
			Information about the variables used on the feature vector
		-activity_labels - Rows: 6 x Columns: 2
			Links the class labels with their activity name
		-subject_test - Rows: 2947 x Columns: 1
			Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
		-X_test - Rows: 2947 x Columns: 561
			Test set
		-y_test - Rows: 2947 x Columns: 1
			Test labels
		-subject_train - Rows: 7352 x Columns: 1
			Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
		-X_train - Rows: 7352 x Columns: 561
			Training set
		-y_train - Rows: 7352 x Columns: 1
			Training labels
			
4. Merge the training and test sets to create one data set
	-subject_test and subject_train are combined into combined_subject (Rows: 10299 x Columns: 1)
	-Y_test and Y_train are combined into combined_y (Rows: 10299 x Columns: 1)
	-X_test and X_train are combined into combined_x (Rows: 10299 x Columns: 561)
	-combined_subject, combined_y, and combined_x are then merged to create combined_data (Rows: 10299 x Columns: 563)
	
5. Extract the mean and standard deviation for each measurement
	Each value of testLabels in combined_data is searched for the strings "mean()" or "std()" and, if found, the data associated is stored in extracted_data (Rows: 10299 x Columns: 88)
	
6. Use descriptive activity names and appropriately label the data with descriptive variable names
	-The labels used in activity_labels are used to replace the non-descriptive values in testLabels
	
7. Create an independant tidy data set with the average of each variable for each activity and each subject
	-extracted_data is sorted by subject and activity and stored in grouped_data (Rows: 10299 x Columns: 88
	-Each column of grouped_data is processes and if the column contains numerical data, the mean of the values is calculated. The results are stored in averaged_data (Rows: 180 x Columns: 88)
	-averaged_data is the final data frame and is written out to the file TidyDataSet.txt in the current working directory