# Codebook for Getting and Cleaning Data Course Project

## DATA OVERVIEW
### For each record, the following is provided: 

* An identifier of the subject who carried out the experiment.
* An identifier indicating whether the subject was part of the test or training
* An identifier indicating which of 6 experimental activities the record contains data about. 
* 86-feature vector with mean and standard deviation time and frequency domain variables, including information about: 
    *Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    *Triaxial Angular velocity from the gyroscope. 

## DATA DICTIONARY - Human Activity Recognition Using Smartphones Data Set

*Record identifier variables
subjectID 
    numeric identifier tying the record to one of 30 subjects 
testDummy 
    dummy variable indicating either test or train experiment type; omitted from final Tidy Data but used in intermediate steps
    0. Training experiment record
    1. Test experiment record
activityCode 
    numeric identifier tying the record to one of 6 experimental activities
    1. Walking
    2. Walking upstairs
    3. Walking downstairs
    4. Sitting
    5. Standing
    6. Laying
activity
    character string identifying the experimental activity by name

*Features variables: selection of features info take from features_info.txt

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Units Note: the above features variables are normalized and bounded within -1 to 1

The subset of estimated variables from these signals kept in this dataset variables are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The final processing takes the mean of the above subset feature measure variables by subject and by activity. Resulting in a two-way by-group mean of each normalized feature. Note on units: base data is normalized and bounded -1 to 1. 

