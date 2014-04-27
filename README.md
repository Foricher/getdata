To make tidy data files, unpack data, removing directory structure, into same directory as 
run_analysis.R. Following files are used:
    activity_labels.txt
    features.txt
    subject_test.txt
    subject_train.txt
    X_test.txt
    X_train.txt
    y_train.txt
    y_test.txt
    
Start R and execute cleanData from run_analysis.R. Function is taking no parameters. As side-effect, two output
files are generated. First is tidy_data.txt with selected features of mesaurements data
merged from train and test files. Second is averages.txt with mean values of measurements
above, grouped by subject and activity. Those values are returned from function.

Labels used in otput files:

subject

    Subject code.
 
activity
 
    Activity coded as numeric:
     
        1 WALKING
        2 WALKING_UPSTAIRS
        3 WALKING_DOWNSTAIRS
        4 SITTING
        5 STANDING
        6 LAYING
    
label

    Activity

Time domain: 

    tBodyAcc-mean()-X 
    tBodyAcc-mean()-Y 
    tBodyAcc-mean()-Z 
    tBodyAcc-std()-X 
    tBodyAcc-std()-Y 
    tBodyAcc-std()-Z
            Body acceleration signals X, Y, Z components; mean and standard deviation.
    
    tGravityAcc-mean()-X 
    tGravityAcc-mean()-Y 
    tGravityAcc-mean()-Z 
    tGravityAcc-std()-X 
    tGravityAcc-std()-Y 
    tGravityAcc-std()-Z
             Gravity acceleration signals X, Y, Z components; mean and standard deviation.
    
    tBodyAccJerk-mean()-X 
    tBodyAccJerk-mean()-Y 
    tBodyAccJerk-mean()-Z 
    tBodyAccJerk-std()-X
    tBodyAccJerk-std()-Y
    tBodyAccJerk-std()-Z
            Body acceleration Jerk signals X, Y, Z components; mean and standard deviation.
    
    tBodyGyro-mean()-X
    tBodyGyro-mean()-Y
    tBodyGyro-mean()-Z
    tBodyGyro-std()-X
    tBodyGyro-std()-Y
    tBodyGyro-std()-Z
            Body gyroscope signals X, Y, Z components; mean and standard deviation.
    
    tBodyGyroJerk-mean()-X
    tBodyGyroJerk-mean()-Y
    tBodyGyroJerk-mean()-Z
    tBodyGyroJerk-std()-X
    tBodyGyroJerk-std()-Y
    tBodyGyroJerk-std()-Z
            Body gyroscope Jerk signals X, Y, Z components; mean and standard deviation.
    
    tBodyAccMag-mean()
    tBodyAccMag-std()
            Body linear acceleration magnitude; mean and standard deviation.
            
    tGravityAccMag-mean()
    tGravityAccMag-std()
            Gravity acceleration magnitude; mean and standard deviation.
    
    tBodyAccJerkMag-mean()
    tBodyAccJerkMag-std()
            Body acceleration Jerk magnitude; mean and standard deviation.
            
    tBodyGyroMag-mean()
    tBodyGyroMag-std()
            Body gyroscope magnitude; mean and standard deviation.
    
    tBodyGyroJerkMag-mean()
    tBodyGyroJerkMag-std()
            Body gyroscope Jerk magnitude; mean and standard deviation.


Frequency domain:
    
    fBodyAcc-mean()-X
    fBodyAcc-mean()-Y
    fBodyAcc-mean()-Z
    fBodyAcc-std()-X
    fBodyAcc-std()-Y
    fBodyAcc-std()-Z
            Body linear acceleration X, Y, Z components; mean and standard deviation.
    
    fBodyAccJerk-mean()-X
    fBodyAccJerk-mean()-Y
    fBodyAccJerk-mean()-Z
    fBodyAccJerk-std()-X
    fBodyAccJerk-std()-Y
    fBodyAccJerk-std()-Z
            Body linear acceleration Jerk X, Y, Z components; mean and standard deviation.
    
    fBodyGyro-mean()-X
    fBodyGyro-mean()-Y
    fBodyGyro-mean()-Z
    fBodyGyro-std()-X
    fBodyGyro-std()-Y
    fBodyGyro-std()-Z
            Body gyroscope signals X, Y, Z components; mean and standard deviation.
    
    fBodyAccMag-mean()
    fBodyAccMag-std()
            Body linear acceleration magnitude; mean and standard deviation.
    
    fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag-std()
            Body linear acceleration Jerk magnitude; mean and standard deviation.
    
    fBodyBodyGyroMag-mean()
    fBodyBodyGyroMag-std()
            Body gyroscope magnitude; mean and standard deviation.
    
    fBodyBodyGyroJerkMag-mean()
    fBodyBodyGyroJerkMag-std()
            Body gyroscope Jerk magnitude; mean and standard deviation.
    
