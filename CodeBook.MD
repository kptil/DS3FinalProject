# Code Book
## Data
### Human Activity Recognition Using Smartphones Dataset
Version 1.0<br/>
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.<br/>
Smartlab - Non Linear Complex Systems Laboratory<br/>
DITEN - Università degli Studi di Genova.<br/>
Via Opera Pia 11A, I-16145, Genoa, Italy.<br/>
activityrecognition@smartlab.ws<br/>
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. <br/>
- Triaxial Angular velocity from the gyroscope. <br/>
- A 561-feature vector with time and frequency domain variables. <br/>
- Its activity label. <br/>
- An identifier of the subject who carried out the experiment.


## Variables

The features described below are the variables.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ<br/>
tGravityAcc-XYZ<br/>
tBodyAccJerk-XYZ<br/>
tBodyGyro-XYZ<br/>
tBodyGyroJerk-XYZ<br/>
tBodyAccMag<br/>
tGravityAccMag<br/>
tBodyAccJerkMag<br/>
tBodyGyroMag<br/>
tBodyGyroJerkMag<br/>
fBodyAcc-XYZ<br/>
fBodyAccJerk-XYZ<br/>
fBodyGyro-XYZ<br/>
fBodyAccMag<br/>
fBodyAccJerkMag<br/>
fBodyGyroMag<br/>
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value<br/>
std(): Standard deviation<br/>
mad(): Median absolute deviation <br/>
max(): Largest value in array<br/>
min(): Smallest value in array<br/>
sma(): Signal magnitude area<br/>
energy(): Energy measure. Sum of the squares divided by the number of values. <br/>
iqr(): Interquartile range <br/>
entropy(): Signal entropy<br/>
arCoeff(): Autorregresion coefficients with Burg order equal to 4<br/>
correlation(): correlation coefficient between two signals<br/>
maxInds(): index of the frequency component with largest magnitude<br/>
meanFreq(): Weighted average of the frequency components to obtain a mean frequency<br/>
skewness(): skewness of the frequency domain signal <br/>
kurtosis(): kurtosis of the frequency domain signal <br/>
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.<br/>
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean<br/>
tBodyAccMean<br/>
tBodyAccJerkMean<br/>
tBodyGyroMean<br/>
tBodyGyroJerkMean

The complete list of variable names is availabes in the features data frame or in the features.txt file.

## Transformations

I applied the variables names stored in the features data frame to the test and train data sets. I combined the test and train data into one data frame and added the subject numbers and activity names to each record as 'subject' and 'Activity'. I then extracted only the variables that corresponded to mean and standard deviation values. I calculated the mean for each of those variables by subject and by activity, and stored the values in the averages data frame.
