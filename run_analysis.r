setwd("H:/Learning/Coursera Data Sci/Getting and cleaning data/Week 4")
if(!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/origData.zip", method = "libcurl")
unzip("./data/origData.zip")
activityLabels <- read.csv("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")
featureLabels <- read.csv("./UCI HAR Dataset/features.txt", header = FALSE, sep = "")
testData <- read.csv("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE, col.names = featureLabels[,2])
testData$subjectNo <- scan("./UCI HAR Dataset/test/subject_test.txt", what = "character") 
testData$activityNo <- scan("./UCI HAR Dataset/test/y_test.txt", what = "character")
trainData <- read.csv("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE, col.names = featureLabels[,2]) 
trainData$subjectNo <- scan("./UCI HAR Dataset/train/subject_train.txt", what = "character")
trainData$activityNo <- scan("./UCI HAR Dataset/train/y_train.txt", what = "character")
combinedData <- rbind(testData, trainData)
combinedData$activityNo <- activityLabels[,2][match(combinedData$activityNo, activityLabels[,1])]
meanColNos <- grep(".+[mM]ean", colnames(combinedData))
stdColNos <- grep("std", colnames(combinedData))
meanDataSet <- cbind(combinedData[,meanColNos], combinedData[,stdColNos], combinedData$subjectNo, combinedData$activityLabel)
names(meanDataSet)[87] <- "subjectNo" 
names(meanDataSet)[88] <- "activityLabel"
newData <- aggregate(. ~ subjectNo + activityLabel, data = meanDataSet, mean)