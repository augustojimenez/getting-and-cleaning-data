---
title: "R Notebook"
output: html_notebook
editor_options: 
  chunk_output_type: inline
---

# Codebook Updated:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. tBodyAcc-XYZ
1. tGravityAcc-XYZ
1. tBodyAccJerk-XYZ
1. tBodyGyro-XYZ
1. tBodyGyroJerk-XYZ
1. tBodyAccMag
1. tGravityAccMag
1. tBodyAccJerkMag
1. tBodyGyroMag
1. tBodyGyroJerkMag
1. fBodyAcc-XYZ
1. fBodyAccJerk-XYZ
1. fBodyGyro-XYZ
1. fBodyAccMag
1. fBodyAccJerkMag
1. fBodyGyroMag
1. fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

1. gravityMean
2. tBodyAccMean
3. tBodyAccJerkMean
4. tBodyGyroMean
5. tBodyGyroJerkMean

Each of these variables pertain to a subject in a given activity, these activities can be one of the following six activities:

1. Walking
2. Walking upstairs
3. Walking downstairs
4. Sitting
5. Standing
6. Laying

Finally, for each variable, it was estimated the mean and standard deviation and it's shown by activity and subject.