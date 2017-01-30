######################################################################
##Keisha White

##Getting and Cleaning Data Course Project
##January 29, 2017

## run_analysis.R
## This script will perform the following steps on the UCI HAR Dataset downloaded from 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive activity names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# 1. Merges the training and the test sets to create one data set.
setwd("/Users/keishawhite/class/Data Cleansing/Project")
train = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
train[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

test = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
test[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# Read in Features
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Merge train and test datasets
bothData = rbind(train, test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_and_stddev  <- grep(".*Mean.*|.*Std.*", features[,2])

features <- features[mean_and_stddev ,]
# Now add the last two columns (subject and activity)
mean_and_stddev  <- c(mean_and_stddev , 562, 563)
bothData <- bothData[,mean_and_stddev ]

# 3. Uses descriptive activity names to name the activities in the data set.
colnames(bothData) <- c(features$V2, "Activity", "Subject")
colnames(bothData) <- tolower(colnames(bothData))

currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
     allData$activity <- gsub(currentActivity, currentActivityLabel, allData$activity)
     currentActivity <- currentActivity + 1
}

# 4. Appropriately labels the data set with descriptive activity names.
allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t",row.name=TRUE)
