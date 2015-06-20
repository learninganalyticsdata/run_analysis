# run_analysis
Getting &amp; Cleaning Data - Programming Assignment

[Link to data set codebook](run_analysis/Codebook_tidy_data.md)

## Summary
The following code is designed to clean and analyze data 
from the Human Activity Recognition Using Smartphones Dataset.

The data is derived from experiments with a goup of 30 volunteers with ages 19-48. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 70% of participants were chosen to train the data and 30% were chosen to test the data. The data were generated from the accelerometer and gyroscope sensors found in the phone.

This code will: 
1. Merge training and test data sets to create one data set.
2. Extract measurements on the mean and standard deviation for each measurement.
3. Replaces activity numbers with descriptive activity names
4. Labels each variable in the data set with descriptive names
5. Create a clean data set with the mean values of variables for each activity and subject.

##Reading raw data into R
In this section of code the raw subjec_train data was read into R using the read.table function. After reading the data into R the columns name "subject" was added to that data set.

The process was repeated with the y_train and X_train data adding their respective columns names. The X_train columns names were read into R using the read.table function. The columns names were then cleaned up to remove any duplicates using the make.names function. Once the unique names were created they were assigned as the column names.

The same steps were followed in order to read in and process the test data.

##Combining multiple data sets into one
All of the elements of the train data were combined using the cbind function. This process was repeated for the all of the elements of the test data.

##Merging train data with test data
The train data frame and the test data frame were combined into a single data frame using the rbind function.

##Extracting measurements on the mean and standard deviation for each measurement.
In order to extract only the variables that dealt with mean and standard deviation the dplyr package was used.

A new data frame was created with only the desired variables using the select function and contains function. Using the select function made it so that the data frame would only have the selected values and that all other values would be dropped from the new data frame. The contain function allowed for selection of the desired variables. 

##Adding descriptive activity names to name the activities in the data set
The car package was used to replace the numerical values of the activity variable with the descriptive character value. The recode function was used to perform this task. 

#Creating dataset with average of each variable for each activity and each subject
The reshape2 package was used to collapse the data frame by subject and activity. This was accomplished using the melt function. Taking the mean of each of the observations 

 



README.md in the repo describing how the script works and the code book describing the variables
