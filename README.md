# Peer Graded Assignment: Getting and Cleaning Data Course Project

This repository contains the source code files for project Getting and Cleaning Data Course Project part of Coursera Data Science Specialzation course which consists of *run_analysis.R* script file, metadata file *CodeBook.md* for that describes the variables, the data, and transformations or work that is performed to clean up the data and the tidy data itself *tidyData.txt*.

The overall tasks performed by the script file *run_analysis.R* are enlisted as below :-

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
12. Finally the cleaned and transformed data set is saved to file tidyData.txt

The final output of the Script is a clean data set which can be used for further analysis.
