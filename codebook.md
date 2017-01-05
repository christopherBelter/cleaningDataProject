# Data code book

## About the original data set

The submitted data set is an extension of the data set originally described and presented in 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

and availabe online at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data were collected from 30 volunteers performing six activities - walking, walking upstairs, walking downstairs, sitting, standing, and laying - wearing a Samsung Galaxy S II on their waist. Activity measurements in three dimensions (denoted x, y, and z in the variable names) were taken using the phone's embedded accelerometer and gyroscope and then sampled at specific time intervals for a total of 128 measurements per time window per subject. Time measurements are denoted with a 't' at the beginning of the variable name. 

These measurements were then processed to create frequency measurements, denoted with an 'f' at the beginning of the variable name. 

The authors then calculated a range of descriptive statistics on each measurement in each direction, including the min, max, mean, standard deviation, interquartile range, entropy, and so on. The final data set consists of 10,299 observations of 561 variables.

## About the submitted data set

The submitted data set presents the average mean and average standard deviation of each variable for each subject performing each activity. The data set consists of 180 observations (6 activities times 30 subjects) of 88 variables. 

The data set was created by merging the test and training data sets from the original data set described above, extracting only the 86 mean and standard deviation measurements from the 561 variables in the original data set, and then calculating the mean value of each variable for each subject performing each activity. The code used to create this data set is available in this repository as "run_analysis.r." An annotated version of this code describing the steps and transformations made to the origianl data set is also available in this repository as "README.md." 

The 88 variables included in this data set are:

- subjectNo
- activityLabel
- tBodyAcc.mean...X
- tBodyAcc.mean...Y
- tBodyAcc.mean...Z
- tGravityAcc.mean...X
- tGravityAcc.mean...Y
- tGravityAcc.mean...Z
- tBodyAccJerk.mean...X
- tBodyAccJerk.mean...Y
- tBodyAccJerk.mean...Z
- tBodyGyro.mean...X
- tBodyGyro.mean...Y
- tBodyGyro.mean...Z
- tBodyGyroJerk.mean...X
- tBodyGyroJerk.mean...Y
- tBodyGyroJerk.mean...Z
- tBodyAccMag.mean..
- tGravityAccMag.mean..
- tBodyAccJerkMag.mean..
- tBodyGyroMag.mean..
- tBodyGyroJerkMag.mean..
- fBodyAcc.mean...X
- fBodyAcc.mean...Y
- fBodyAcc.mean...Z
- fBodyAcc.meanFreq...X
- fBodyAcc.meanFreq...Y
- fBodyAcc.meanFreq...Z
- fBodyAccJerk.mean...X
- fBodyAccJerk.mean...Y
- fBodyAccJerk.mean...Z
- fBodyAccJerk.meanFreq...X
- fBodyAccJerk.meanFreq...Y
- fBodyAccJerk.meanFreq...Z
- fBodyGyro.mean...X
- fBodyGyro.mean...Y
- fBodyGyro.mean...Z
- fBodyGyro.meanFreq...X
- fBodyGyro.meanFreq...Y
- fBodyGyro.meanFreq...Z
- fBodyAccMag.mean..
- fBodyAccMag.meanFreq..
- fBodyBodyAccJerkMag.mean..
- fBodyBodyAccJerkMag.meanFreq..
- fBodyBodyGyroMag.mean..
- fBodyBodyGyroMag.meanFreq..
- fBodyBodyGyroJerkMag.mean..
- fBodyBodyGyroJerkMag.meanFreq..
- angle.tBodyAccMean.gravity.
- angle.tBodyAccJerkMean..gravityMean.
- angle.tBodyGyroMean.gravityMean.
- angle.tBodyGyroJerkMean.gravityMean.
- angle.X.gravityMean.
- angle.Y.gravityMean.
- angle.Z.gravityMean.
- tBodyAcc.std...X
- tBodyAcc.std...Y
- tBodyAcc.std...Z
- tGravityAcc.std...X
- tGravityAcc.std...Y
- tGravityAcc.std...Z
- tBodyAccJerk.std...X
- tBodyAccJerk.std...Y
- tBodyAccJerk.std...Z
- tBodyGyro.std...X
- tBodyGyro.std...Y
- tBodyGyro.std...Z
- tBodyGyroJerk.std...X
- tBodyGyroJerk.std...Y
- tBodyGyroJerk.std...Z
- tBodyAccMag.std..
- tGravityAccMag.std..
- tBodyAccJerkMag.std..
- tBodyGyroMag.std..
- tBodyGyroJerkMag.std..
- fBodyAcc.std...X
- fBodyAcc.std...Y
- fBodyAcc.std...Z
- fBodyAccJerk.std...X
- fBodyAccJerk.std...Y
- fBodyAccJerk.std...Z
- fBodyGyro.std...X
- fBodyGyro.std...Y
- fBodyGyro.std...Z
- fBodyAccMag.std..
- fBodyBodyAccJerkMag.std..
- fBodyBodyGyroMag.std..
- fBodyBodyGyroJerkMag.std..

The subjectNo variable identifies the subject number performing the activities. The activityLabel identifies the activity performed by the subject. 

The additional variables present the mean and standard deviation of the measurements taken. The naming convention of these variables is as follows:

- tBodyAcc.mean...X : is the average time observation (t) of the subject's mean (.mean) body acceleration (BodyAcc) along the X axis (X).
- fBodyGyro.std...Z : is the average frequency observation (f) of the standard deviation (.std) of the subject's angular velocity as measured by the phone's gyroscope (BodyGyro) along the Z axis (Z).

Acceleration and body acceleration variables are measured in standard gravity units ('g'). Angular velocity variables are measured in radians/second. See the README.txt and features_info.txt for more information about these variables and how they were measured and/or calculated.
