# CodeBook

## Raw Data

Here are the raw data [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description is available at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Transformation performed to clean up the data

+ Merge the following training and the test sets to create the NewDataSet.
	
	> /test/subject_test.txt
	> /test/X_test.txt
	> /test/y_test.txt
	> /train/subject_train.txt
	> /train/X_train.txt
	> /train/y_train.txt

+ Extract only the measurements on the mean and std for each measurement.

+ Use the following descriptive activity name to name the activities in the NewDataSet, i.e. y_test & y_train (the last col in NewDataSet).

	> /activity_labels.txt

+ Use the following file to label the NewDataSet with descriptive variable names.

	> /features.txt

+ Create the 2rd data set with the ave. of each var.for each activity and each subject, also called NewDataSet.

## NewDataSet

+ 81 variables and 180 obs.

+ The 1st col is activities as shown in the following file
	
	> /activity_labels.txt

+ The 2rd col is subjects denoted by numbers ranging from 1 to 30.

+ The first two columns are used to break down the raw data set into groups.

+ All the other columns are means of measurements taken on each group.