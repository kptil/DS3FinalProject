#Getting and Cleaning Data Final Project

library(dplyr) #Load the dplyr package

#Download The Data
filename <- "DS3FinalProject.zip"
if(!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method = "curl")
}

if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

features <- read.table("./DS3FinalProject/UCI HAR Dataset/features.txt")
test <- read.table("./DS3FinalProject/UCI HAR Dataset/test/X_test.txt", col.names = features$V2)
testLabels <- read.table("./DS3FinalProject/UCI HAR Dataset/test/y_test.txt", col.names = "ActivityCode")
train <- read.table("./DS3FinalProject/UCI HAR Dataset/train/X_train.txt", col.names = features$V2)
trainLabels <- read.table("./DS3FinalProject/UCI HAR Dataset/train/y_train.txt", col.names = "ActivityCode")
activityLabels <- read.table("./DS3FinalProject/UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityCode", "Activity"))
subject_test <- read.table("./DS3FinalProject/UCI Har Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("./DS3FinalProject/UCI Har Dataset/train/subject_train.txt", col.names = "subject")

#Apply Activity Labels and Subject Numbers
test <- cbind(test, testLabels, subject_test)
testMerged <- merge(test, activityLabels, by.x = "ActivityCode", by.y = "ActivityCode")
train <- cbind(train, trainLabels, subject_train)
trainMerged <- merge(train, activityLabels, by.x = "ActivityCode", by.y = "ActivityCode")

#Merge Test and Train Datasets
testtrain <- rbind(testMerged, trainMerged)

#Extract Mean and SD Measurements
meancols <- grep("[Mm]ean", names(testtrain))
stdcols <- grep("std", names(testtrain))
cols <- c(meancols, stdcols, c(563, 564))
subset <- testtrain[,cols]

#Create a Separate Data Set with Variable Averages
subset <- group_by(subset, Activity, subject)
names <- names(subset)
names < names[-c(87:88)]
averages <- summarize_at(subset, names, mean)

write.table(averages, "Averages.txt", row.names = FALSE)
