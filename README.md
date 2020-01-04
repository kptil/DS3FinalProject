# DS3FinalProject
This repo contains the scripts and codebook for the final project for Getting and Cleaning Data, the third course in JHU's Data Science Specialization on Coursera.

## Data
Human Activity Recognition Using Smartphones Dataset:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files
1. CodeBook.md A code book that describes the variables, the data, and any transformations I performed.
2. run_analysis.R An R script that downloads the data and performs the 5 required steps in the final project instructions:
  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement.
  - Uses descriptive activity names to name the activities in the data set
  - Appropriately labels the data set with descriptive variable names.
  - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
3. Averages.txt The resulting data set after going through all the steps described above and in the code book.
