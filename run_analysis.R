## Project

## Step 1: Merge the training and the test sets to create one data set
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")

test <- cbind(test_subject,test_X,test_y)
train <- cbind(train_subject,train_X,train_y)

NewDataSet <- rbind(test,train)


## Step 2: Extract only the measurements on the mean and std for each measurement
features <- read.table("UCI HAR Dataset/features.txt")
featureNames <- features[,2]

IndexFun <- function(x){
	grepl("mean()",x) | grepl("std()",x)
}

featureIndices <- apply(as.matrix(featureNames),MARGIN=2,FUN=IndexFun)
featureIndices <- which(featureIndices)+1

Data_Mean_and_Std <- NewDataSet[,featureIndices]


## Step 3: Use descriptive activity names to name the activities in the NewDataSet, i.e. test/train_y (last column)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityNames <- activity_labels[,2]
length(NewDataSet) ## 563
Y <- data.frame(apply(as.matrix(NewDataSet[,563]),MARGIN=2,FUN=function(x){activityNames[x]}))
NewDataSet[,563] <- Y[,1]


## Step 4: Labels the NewDataSet with descriptive variable names
Names <- c("Subject",as.character(featureNames),"Activities")
names(NewDataSet) <- Names


## Step 5: 2rd data set with the Ave. of each var. for each activity and each subject
attach(NewDataSet)
AggNewDataSet <- aggregate(NewDataSet[,2:562],by=list(Subject,Activities),FUN=mean,na.rm=TRUE)

write.table(AggNewDataSet,file="NewDataSet.txt",sep='\t')

