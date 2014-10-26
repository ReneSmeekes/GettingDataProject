####################################################################################################################
####################################################################################################################
####                                                                                                            ####
####    This script extracts only the mean and standard deviation columns from a data set provided by UCI.      ####
####    The data was generated for a project to determine detection of activities of daily living.              ####
####    The data used can be found at:                                                                          ####
####    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones                     ####
####                                                                                                            ####
####################################################################################################################
####################################################################################################################


### Getting metadata
feature <- read.table("./UCI HAR Dataset/features.txt", col.names=c("feature.id","feature.name"))
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("activity.id","activity.name"))

## Creating vector of desired columns for resulting set
feature.meancols <- grep("mean\\(\\)", feature$feature.name)
feature.stdcols <- grep("std\\(\\)", feature$feature.name)
feature.descols <- c(feature.meancols,feature.stdcols)
feature.descols <- feature.descols[order(feature.descols)]


### Getting training data
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("subject.id"))
train.act <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("activity.id"))
train.data <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=feature$feature.name) #using column names from features.txt file

## Merging desired columns for training data
# Adding column to define originating dataset
train.subject$data.set <- factor("Training")
# Getting activity names
train.activity <- merge(train.act,activity)
# Filter out desired columns
train.data.des <- train.data[,feature.descols]
# Combining into a single training dataframe
train <- cbind(train.subject, train.activity, train.data.des)


### Getting test data
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("subject.id"))
test.act <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("activity.id"))
test.data <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=feature$feature.name) #using column names from features.txt file

## Merging desired columns for test data
# Adding column to define originating dataset
test.subject$data.set <- factor("Test")
# Getting activity names
test.activity <- merge(test.act,activity)
# Filter out desired columns
test.data.des <- test.data[,feature.descols]
# Combining into a single training dataframe
test <- cbind(test.subject, test.activity, test.data.des)


### Combining training and test data
result <- rbind(train, test)


### Calculating column means for each variable per activity, per subject
result.means <- aggregate(result[,5:length(result)], result[,1:4], mean) #using length of the dataframe to accomodate changes in which columns are selected


### Writing means dataframe to file
write.table(result.means, "result.means.txt", row.names=FALSE)
