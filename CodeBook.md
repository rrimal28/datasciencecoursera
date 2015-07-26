# Code Book
General description about the variables, data, and any transformations or work 
that was performed to clean up the data.

## Background Infromation
One of the most exciting areas in all of data science right now 
is wearable computing - see for example this article . 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop 
the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected 
from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was 
obtained: 
[Link to Data]
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


### Data Set Information

The experiments have been carried out with a group of 30 volunteers 
within an age bracket of 19-48 years. Each person performed 
six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration 
and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the 
volunteers was selected for generating the training data and 30% the test data.


#### Raw Data transformation

The raw data sets are processed with the script run_analysis.R script to create a 
tidy data set.

1.Merge training and test sets Test and training data, subject ids and activity ids are merged to obtain a single data set. 
Variables are labelled with the names assigned by original collectors.

2.Extract mean and standard deviation variables Keep only the values of estimated mean and standard deviation .

3.Get descriptive activity names A new column is added to intermediate data set with the activity description.

4.Get variables appropriately Labels given from the original collectors were changed to get valid/more descriptive R names

5.Create a tidy data set From the intermediate data set is created a final tidy data set where numeric variables are averaged for each activity and each subject.


#### Tidy dataset:

1. file name is Data_Avg_By_Subject.TXT
2.measurement: the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: gravityMean, 
tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean,tBodyGyroJerkMean.
3. X/Y/Z: one direction of a 3-axial signal.mean: global mean value

