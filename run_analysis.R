##################################################################################################
##################################################################################################
## 	The source code below performs the following                                            ##
## 											        ##
## 1. Merges the training and the test sets to create one data set.                             ##
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.   ##
## 3. Uses descriptive activity names to name the activities in the data set                    ##
## 4. Appropriately labels the data set with descriptive variable names.                        ##
## 5. From the data set in step 4, creates a second, independent tidy data set with the average ##
##	  of each variable for each activity and each subject.                                  ##
##												##
##################################################################################################
##################################################################################################

#### load the packages
library("dplyr")
library("data.table")


### download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "dataset.zip", method="curl")


### Start tidying data.
features <- read.table("/R/workspace/dc-week4/uci_har_dataset/features.txt", header=FALSE)

### Know the how the data look like
str(features)

#cohere the variables wanted from factors to character
features[,2] <- as.character(features[,2])

### Know the how the data look like ( Verify )
str(features)

### Load the activities performed
activities <- read.table("/R/workspace/dc-week4/uci_har_dataset/activity_labels.txt", header=FALSE)

### Know the how the data look like
str(activities)

### Know the how the data look like ( Verify )
activities[,2] <- as.character(activities[,2])

### Know the how the data look like ( Verify )
str(activities)


### Extract features with mean and std
selectedFeature <- grep("*mean*|*std*", features[,2], value=TRUE)

### Know the how the data look like ( Verify )
str(selectedFeature)

### Clean the features name
selectedFeature <- grep("*mean*|*std*", features[,2], value=TRUE)
selectedFeature <- gsub('-mean', "Mean", selectedFeature)
selectedFeature <- gsub('-std', 'Std', selectedFeature)
selectedFeature <- gsub('[()]', '', selectedFeature)

### Know the how the data look like ( Verify )
str(selectedFeature)

### Load the traning data set and clean it.

# Get the index of the features to be selected
listFeatures <- grep("*mean*|*std*", features[,2])

### Extract only the data of intrest
test <- read.table("/R/workspace/dc-week4/uci_har_dataset/test/X_test.txt")[listFeatures]
activitiesTest <- read.table("/R/workspace/dc-week4/uci_har_dataset/test/y_test.txt")
subjectsTest <- read.table("/R/workspace/dc-week4/uci_har_dataset/test/subject_test.txt")
testData <- cbind(subjectsTest, activitiesTest, test)


### Extract only the data of intrest
train <- read.table("/R/workspace/dc-week4/uci_har_dataset/train/X_train.txt")[listFeatures]
activitiesTrain <- read.table("/R/workspace/dc-week4/uci_har_dataset/train/y_train.txt")
subjectsTrain <- read.table("/R/workspace/dc-week4/uci_har_dataset/train/subject_train.txt")
trainData <- cbind(subjectsTrain, activitiesTrain, train)

### Alternative to extract data of interest
# test <- read.table("/R/workspace/dc-week4/uci_har_dataset/train/X_train.txt")
# ttrain <- train[,listFeatures]

### Combine the test and traning data sets
combineData <- rbind(trainData, testData)

### Set the column names for the combined datasets
colnames(combineData) <- c("Subject", "Activity", selectedFeature)

### Trun the activiteis and 
combineData$Activity <- factor(combineData$Activity, levels = activities[,1], labels = activities[,2])
combineData$Subject <- as.factor(combineData$Subject)

