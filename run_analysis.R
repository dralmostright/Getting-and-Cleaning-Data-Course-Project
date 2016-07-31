##################################################################################################
##################################################################################################
## 	The source code below performs the following                                            ##
## 									                        ##
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
library("reshape2")

## The file name for the dataset to download
filename <- "/R/workspace/dc-week4/dataset.zip"

## Download the dataset if not in workspace
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  

## Extract the downloaded compressed dataset if not already present on work space and move to working directory
if (!file.exists("/R/workspace/dc-week4/uci_har_dataset")) { 
  unzip(filename, exdir='/R/workspace/dc-week4/uci_har_dataset') 
  setwd("/R/workspace/dc-week4/uci_har_dataset/UCI HAR Dataset")
  list.of.files <- list.files("/R/workspace/dc-week4/uci_har_dataset/UCI HAR Dataset")
  file.copy(from = list.of.files, to = "/R/workspace/dc-week4/uci_har_dataset/",recursive = TRUE, copy.mode = TRUE)
}

### Start tidying data.

## Set the working directory to save the tidy data
setwd("/R/workspace/Getting-and-Cleaning-Data-Course-Project")

## Read tthe features dataset and store it
features <- read.table("/R/workspace/dc-week4/uci_har_dataset/features.txt", header=FALSE)

## Cohere the variables wanted from factors to character
features[,2] <- as.character(features[,2])

### Load the activities performed
activities <- read.table("/R/workspace/dc-week4/uci_har_dataset/activity_labels.txt", header=FALSE)

## Cohere the variables wanted from factors to character
activities[,2] <- as.character(activities[,2])

### Extract features with mean and std and Clean the features name
selectedFeature <- grep("mean\\(\\)|std\\(\\)", features[,2], value=TRUE)
selectedFeature <- gsub('-mean', "Mean", selectedFeature)
selectedFeature <- gsub('-std', 'Std', selectedFeature)
selectedFeature <- gsub('\\(\\)', '', selectedFeature)
selectedFeature <- gsub('^t', 'time', selectedFeature)
selectedFeature <- gsub('^f', 'frequency', selectedFeature)
selectedFeature <- gsub("Acc", "Accelerometer", selectedFeature)
selectedFeature <- gsub("Gyro", "Gyroscope", selectedFeature)
selectedFeature <- gsub("Mag", "Magnitude",selectedFeature)
selectedFeature <- gsub("BodyBody", "Body", selectedFeature)


### Load the traning data set and clean it.

# Get the index of the features to be selected
listFeatures <- grep("mean\\(\\)|std\\(\\)", features[,2])

### Extract only the data of intrest for test data
test <- read.table("/R/workspace/dc-week4/uci_har_dataset/test/X_test.txt")[listFeatures]
activitiesTest <- read.table("/R/workspace/dc-week4/uci_har_dataset/test/y_test.txt")
subjectsTest <- read.table("/R/workspace/dc-week4/uci_har_dataset/test/subject_test.txt")
testData <- cbind(subjectsTest, activitiesTest, test)

### Extract only the data of intrest for traning data
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

### Trun the activiteis and subjects to factor
combineData$Activity <- factor(combineData$Activity, levels = activities[,1], labels = activities[,2])
combineData$Subject <- as.factor(combineData$Subject)

### Transform the all columns to rows with basis of Subject and Activity 
combineData.melt <- melt(combineData, id = c("Subject", "Activity"))

### Cast the previous melted data on the basis of Subject and Activity and calulating the mean for each variables 
combineData.mean <- dcast(combineData.melt, Subject + Activity ~ variable, mean)

### Permanently store the cleanded data to file.
write.table(combineData.mean, "tidyData.txt", row.names = FALSE, quote = FALSE)
