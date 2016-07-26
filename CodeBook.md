# Code Book : Getting and Cleaning Data Course Project

## Background Of Data

The raw data are obtained from UCI Machine Learning repository. The data was from *Human Activity Recognition Using Smartphones Dataset* experiment which have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

As per the project our purpose was to procude a clean and tidy data sets by merging the traning and test data sets so that it can be used for futher insight analysis.

## Variables of Interest
The varailbes realted to mean and standard deviation for 3-axial linear acceleration and 3-axial angular velocity were subseted from the whole dataset (i.e. traning and test).

## Process of Data Cleaning and Data transformation
As per the project our purpose was to procude a clean and tidy data sets by merging the traning and test data sets so that it can be used for futher insight analysis.

## Variables of Interest
The varailbes realted to mean and standard deviation for 3-axial linear acceleration and 3-axial angular velocity were subseted from the whole dataset (i.e. traning and test).

## Process of Data Cleaning and Data transformation
The cleaning and transformation of the data set is carried out by the script file **run_analysis.R**. The overall process carried out in the script file is summarize as below:

1. Downloads the dataset to workspace.
2. Extracts activities and feature info and load it.
3. Loads the test and traning data and extract data columns related to mean and standard deviation.
4. Tidy the column names i.e tBodyAcc-mean()-X to tBodyAcc-Mean-X using grep and gsub.
5. Loads the activity and subject data for each test and traning data sets
6. Merges the activity and subject datas with respecitve test and traning data sets..
7. Merges the test and traning data 
8. Provides the column names for the data.
8. Converts the activity and subjects of final data set as factors for further cleaning.
9. The converted dataset obtained in step 7 is melted using the id's for subjects and activites
10. Then the data are again transformed to independent tidy data set with the average of each variable for each activity and each subject. 
