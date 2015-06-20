#The following code is designed to clean and analyze data 
#from the Human Activity Recognition Using Smartphones Dataset.

#This code will 
#   1) Merge training and test data sets to create one data set.
#	  2) Extract measurements on the mean and standard deviation for each measurement.
#	  3) Replaces activity numbers with descriptive activity names
#	  4) Labels each variable in the data set with descriptive names
#	  5) Create a clean data set with the mean values of variables for each activity and subject.


#Reading train data into R & adding col names 
sub_train <- read.table("./train/subject_train.txt")
names(sub_train)<- c("subject")

y_train <- read.table("./train/y_train.txt")
names(y_train)<- c("activity")

x_train <- read.table("./train/X_train.txt")
vName <- read.table("./features.txt")
vName<- make.names(vName[,2], unique=TRUE)
names(x_train)<- vName


#Reading test data into R
sub_test <- read.table("./test/subject_test.txt")
names(sub_test)<- c("subject")

y_test <- read.table("./test/y_test.txt")
names(y_test)<- c("activity")

x_test <- read.table("./test/X_test.txt")
names(x_test)<- vName

#Binding train and test data sets

trainData <- cbind(sub_train, y_train)
trainData <- cbind(trainData, x_train)

testData <- cbind(sub_test, y_test)
testData <- cbind(testData, x_test)

#Merging trainData and testdata

ttData <- rbind(trainData,testData)

#Extracting measurements on the mean and standard deviation for each measurement.
library(dplyr)

msData<- select(ttData, contains("subject"),contains("activity"),contains("mean."),contains("std"))


#Adding descriptive activity names to name the activities in the data set

library(car)

msData$activity <- recode(msData$activity,"1='WALKING'")
msData$activity <- recode(msData$activity,"2='WALKING_UPSTAIRS'")
msData$activity <- recode(msData$activity,"3='WALKING_DOWNSTAIRS'")
msData$activity <- recode(msData$activity,"4='SITTING'")
msData$activity <- recode(msData$activity,"5='STANDING'")
msData$activity <- recode(msData$activity,"6='LAYING'")

#Creating dataset with average of each variable for each activity and each subject
library(reshape2)
melted = melt(msData, id.var = c("subject", "activity"))
means = dcast(melted , subject + activity ~ variable, mean)

#Writing data to new file

write.table(means, file="./data/tidy_data.txt",row.name=FALSE)




