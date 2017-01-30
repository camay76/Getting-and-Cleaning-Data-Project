# Getting-and-Cleaning-Data-Project
Getting and Cleaning Data Project


Introduction

This repository contains project for the "Getting and Cleaning Data" work for the  Coursera course.

Project Instruction

Create one R script called run_analysis.R that does the following. 1. Merges the training and the test sets to create one data set. 2. Extracts only the measurements on the mean and standard deviation for each measurement. 3. Uses descriptive activity names to name the activities in the data set 4. Appropriately labels the data set with descriptive activity names. 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


About the script and the tidy dataset

A script was created and named run_analysis.R which merge the Test and Training datasets . Prerequisites for this script:

the UCI HAR Dataset must be extracted and..
the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"


Finally, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

Codebook Information
The CodeBook.md file explains the transformations performed and the resulting data and variables.
