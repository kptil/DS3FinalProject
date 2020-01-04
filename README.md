# DS3FinalProject
This repo contains the scripts and codebook for the final project for Getting and Cleaning Data, the third course in JHU's Data Science Specialization on Coursera.

# R Script run.analysis.R
#Make sure you've loaded the dplyr package, as this will be used later in the script.
library(dplyr) 

## The first step is to download the data. The code below checks to see if "DS3FinalProject.zip" exists, and if it doesn't creates a file with that name and saves the data there. The next block of code unzips the file.
filename <- "DS3FinalProject.zip"
if(!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method = "curl")
}

if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

## The next step is to read the data into R. The code below reads in the data and assigns some column names at the same time to make the rest of the code easier to understand. The features table lists the variable names of the test and train data frames, so those variable names are passed to test and train as column names using col.names = features$V2. The activityLabels data frame lists each activity the subjects performed (walking, laying, standing, etc) and assigns each a number 1:6, so those columns are named "Activity" and "ActivityCode". The testLabels and trainLabels data frames list the activity codes for each record in the test and train data frames, respectively. The subject_test and subject_train data frames list the ID number for the subject who conducted the activity for each record in the test and train data frames, respectively.
features <- read.table("./DS3FinalProject/UCI HAR Dataset/features.txt")
test <- read.table("./DS3FinalProject/UCI HAR Dataset/test/X_test.txt", col.names = features$V2)
testLabels <- read.table("./DS3FinalProject/UCI HAR Dataset/test/y_test.txt", col.names = "ActivityCode")
train <- read.table("./DS3FinalProject/UCI HAR Dataset/train/X_train.txt", col.names = features$V2)
trainLabels <- read.table("./DS3FinalProject/UCI HAR Dataset/train/y_train.txt", col.names = "ActivityCode")
activityLabels <- read.table("./DS3FinalProject/UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityCode", "Activity"))
subject_test <- read.table("./DS3FinalProject/UCI Har Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("./DS3FinalProject/UCI Har Dataset/train/subject_train.txt", col.names = "subject")

## Next I appended the appropriate activity labels and subject numbers to the test and train data frames. The cbind function combines the test, testLabels, and subject_test data frames while the merge function applies the correct activity name to each row based on the Activity Code number.
test <- cbind(test, testLabels, subject_test)
testMerged <- merge(test, activityLabels, by.x = "ActivityCode", by.y = "ActivityCode")
train <- cbind(train, trainLabels, subject_train)
trainMerged <- merge(train, activityLabels, by.x = "ActivityCode", by.y = "ActivityCode")

## Then I merged the test and train datasets together using rbind. This completes tasks 1, 3, and 4 of the project instructions - The test and train data sets are merged into one tidy data set with descriptive activity and variable names.
testtrain <- rbind(testMerged, trainMerged)

## Next I extracted the columns with mean and standard deviation measurements using the grep function. I then combined the resulting lists of column numbers into one list, cols, and added back in columns 563 and 564, which are the Activity and subject columns. I then subset my merged testtrain data frame by the list of column numbers. This completes task 2 of the instructions.
meancols <- grep("[Mm]ean", names(testtrain))
stdcols <- grep("std", names(testtrain))
cols <- c(meancols, stdcols, c(563, 564))
subset <- testtrain[,cols]

## To create a separate data set with the average for each variable by activity and by subject, I first grouped the subset data frame by Activity and subject. Since I wanted to summarize all of the 80+ variables by the mean, I used the summarize_at function in the dplyr package, which takes a character vector of variables and applies the summarizing function you pass to it to each variable. To create the list of variables I wanted to summarize, I took the names of the subset data frame and removed Activity and subject. The resulting data frame, averages, completes task 5 of the instructions.
subset <- group_by(subset, Activity, subject)
names <- names(subset)
names < names[-c(87:88)]
averages <- summarize_at(subset, names, mean)
