===============================================================================
Getting and Cleaning Data Course Project
Version 1.0
===============================================================================
Alex Szabo
alex_szabo@amat.com
===============================================================================

The R script and the accompanying documents were created to meet the
requirements of the final project of this course.

===============================================================================
Files
===============================================================================
-run_analysis.R - script that performs the tasks to meet the project's
 requirements.  These requirements are:
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for 
	   each measurement.
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names. 
	5. From the data set in step 4, creates a second, independent tidy data set
	   with the average of each variable for each activity and each subject.
 The script requires the dplyr and httr packages to be installed prior to
 running. The data set will be automatically downloaded to the current working
 directory which can be found by typing getwd() at the R console. This folder
 can be changed using the setwd() command at the R console
 
-CodeBook.md - a code book that walks you through the process and variables
 used to create the final output
 
-TidyDataSet.txt - a file containing the final output