# cleaningDataProject
Repository with the source code, markdown file, and code book for the week 4 assignment of the 'Getting and Cleaning Data' course on Coursera

## How the code works

First, set the working directory

    setwd("H:/Learning/Coursera Data Sci/Getting and cleaning data/Week 4")

Then check if the data directory exists and add it if not

    if(!file.exists("./data")) {dir.create("./data")} 

Store the URL for the data set

    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

Download the file. Using the method = "libcurl" makes the function work with https URLs on my PC
    
    download.file(fileURL, destfile = "./data/origData.zip", method = "libcurl") 

Extract the files and folders
    
    unzip("./data/origData.zip") 

Create data frames for the activity labels and feature labels to use later on
    
    activityLabels <- read.csv("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")
    featureLabels <- read.csv("./UCI HAR Dataset/features.txt", header = FALSE, sep = "")

Read in the test data. The sep = "" argument tells R to treat any amount of blank space as a column break. The col.names argument names the columns based on the names vector in the featureLabels data frame created above.
    
    testData <- read.csv("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE, col.names = featureLabels[,2]) 

Add the subject number for each row
  
    testData$subjectNo <- scan("./UCI HAR Dataset/test/subject_test.txt", what = "character") 

Finally, add the activity number for each row

    testData$activityNo <- scan("./UCI HAR Dataset/test/y_test.txt", what = "character")

Then I perform the exact same steps for the training data set
    
    trainData <- read.csv("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE, col.names = featureLabels[,2]) 
    trainData$subjectNo <- scan("./UCI HAR Dataset/train/subject_train.txt", what = "character")
    trainData$activityNo <- scan("./UCI HAR Dataset/train/y_train.txt", what = "character")

Then I merge the training and test data sets. Since the two data sets are independent of each other and because the columns have the same names, I can just use rbind to merge them instead of using the merge() function.
    
    combinedData <- rbind(testData, trainData) 

Then I replace the activity numbers with activity labels. The match() function matches the activity number in combidedData to the numbers in column 1 of the activityLabels data frame and then replaces the number with the corresponding activity description.
    
    combinedData$activityNo <- activityLabels[,2][match(combinedData$activityNo, activityLabels[,1])]

To create the new data set, I first create a vector listing the column numbers of all columns with mean somewhere in the name. I interpreted the instruction to 'extract measurements on the mean' to include both column names with mean() in the name and column names like 'gravityMean', 'tBodyGyroMean', etc.
    
    meanColNos <- grep(".+[mM]ean", colnames(combinedData)) 

And then I create a vector of the column numbers with standard deviation in the column name

    stdColNos <- grep("std", colnames(combinedData)) 

Now I can create the new data set by column binding the columns with mean or std in the name along with the subject number and activity label columns from the combinedData data frame.

    meanDataSet <- cbind(combinedData[,meanColNos], combinedData[,stdColNos], combinedData$subjectNo, combinedData$activityLabel) 

Since the cbind() function renamed the subject number and activity label columns, I change them back to their original names

    names(meanDataSet)[87] <- "subjectNo" 
    names(meanDataSet)[88] <- "activityLabel" 

Finally, I create the new data frame with the mean value of each column for each subject number and activity label in the data set. The . notation tells R to calculate the mean for all of the relevant columns in the data set. 

    newData <- aggregate(. ~ subjectNo + activityLabel, data = meanDataSet, mean) 
