## About source data
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The R script
The R code "run_analysis.R" performs the following functions:
Downloads the dataset
Unzips the files
Imports training and testing text files into tables
Imports features and activity labels files into tables
Sets column names from features into training and testing tables
Merges train and test data together
Extracts only the measurements on the mean and standard deviation for each measurement.
Sets descriptive activity names
Makes a second tidy data set

## The variables:
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_data, y_data and subject_data merge the previous datasets to be able to pull the measurements on the mean and standard deviation.
features contains the correct names for the train and test datasets, which is used to apply the column names in both tables