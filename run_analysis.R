library(plyr)



# Download the dataset

if(!file.exists("C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment"))
    {dir.create("C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment/Dataset.zip")



# Unzip the file

unzip(zipfile="C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment/Dataset.zip
      ",exdir="C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment")



# Read trainings tables:

x_train <- read.table("C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment/UCI HAR Dataset/train/subject_train.txt")



# Read testing tables:

x_test <- read.table("C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment/UCI HAR Dataset/test/subject_test.txt")



# Read features vector:

features <- read.table('C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment/UCI HAR Dataset/features.txt')



# Read activity labels:

activitylabels = read.table('C:/Users/amang/Documents/Coursera/Getting_and_Cleaning_Data/Programming Assignment/UCI HAR Dataset/activity_labels.txt')



# Take column names from features and set into x_train:
colnames(x_train) <- features[,2] 

# Set column names for y_train and subject_train:
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"



# Take column names from features and set into x_text:
colnames(x_test) <- features[,2] 

# Set column names for y_test and subject_test:
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"



# Set column names for activitylabels:

colnames(activitylabels) <- c('activityId','activityType')



# Merging Data:

mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setTogether <- rbind(mrg_train, mrg_test)



# Read column names:

colNames <- colnames(setTogether)



# Get the ID, mean and standard deviation:

mean_std <- (grepl("activityId" , colNames) | 
                     grepl("subjectId" , colNames) | 
                     grepl("mean.." , colNames) | 
                     grepl("std.." , colNames) 
)



# Create subset from setTogether:

setForMeanStd <- setTogether[ , mean_std == TRUE]



# Set descriptive activity names:

setWithActivityNames <- merge(setForMeanStd, activitylabels, by='activityId', all.x=TRUE)




# Make second tidy data set: 

secondTidy <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secondTidy <- secondTidy[order(secondTidy$subjectId, secondTidy$activityId),]