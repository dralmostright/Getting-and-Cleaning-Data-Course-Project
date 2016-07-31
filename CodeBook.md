# Code Book : Getting and Cleaning Data Course Project

## Background Of Data

The raw data are obtained from UCI Machine Learning repository. The data was from *Human Activity Recognition Using Smartphones Dataset* experiment which have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

As per the project our purpose was to procude a clean and tidy data sets by merging the traning and test data sets so that it can be used for futher insight analysis.

## Variables of Interest
The varailbes realted to mean and standard deviation for 3-axial linear acceleration and 3-axial angular velocity were subseted from the whole dataset (i.e. traning and test).

## Labeling data set with descriptive variable names.
The variables obtained from features.txt can be explained as:
- Leading t refers to time and f for frequency measurements.
- mean() referes to mean value
- std() refres to standard deviation
- Body = related to body movement.
- Gravity = acceleration of gravity
- Acc = accelerometer measurement
- Gyro = gyroscopic measurements
- Jerk = sudden movement acceleration
- Mag = magnitude of movement

The variables are mapped to the descriptive names as below by selecting values for mean and standard deviation:
- t to time
- f to frequency
- mean to Mean
- std to StandardDeviation
- Acc to Accelerometer 
- Gyro to Gyroscope
- Mag to Magnitude
- BodyBody to Body

e.g. tBodyAcc-mean()-X is mapped to timeBodyAccelerometerMean-X
Similar process iterates for other variables.

## Process of Data Cleaning and Data transformation
The cleaning and transformation of the data set is carried out by the script file **run_analysis.R**. The overall process carried out in the script file is summarize as below:

1. Downloads the dataset to workspace and extract if not already present and extracted respetively.
2. Extracts feature and activities info and load it from files features.txt and activity_labels.txt respetively.
3. Tidy the feature e.g. tBodyAcc-mean()-X to timeBodyAccelerometerMean-X and using grep and gsub for features mean and standard deviation.
4. Loads the test and traning data and extract data columns related to mean and standard deviation from files y_*.txt (where * implies test and train). 
5. Loads the activity and subject data for each test and traning data sets from files subject_*.txt (where * implies test and train).
6. Merges the activity and subject datas with respecitve test and traning data sets..
7. Merges the test and traning data.
8. Provides the column names for the data i.e "Subjects" for subjects and "Activity" fro activiteis and rest the names obtained in step 3.
9. Converts the activity and subjects of final data set as factors for further cleaning.
10. The resulted dataset obtained is then melted using the id's for subjects and activites.
11. Then the data are again transformed to independent tidy data set with the average of each variable for each activity and each subject.
12. Finally the cleaned and transformed data set are saved to file tidyData.txt
