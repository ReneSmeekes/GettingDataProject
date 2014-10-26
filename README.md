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


### Generating averages of the means and standard deviation measurements, for each subject, for each activity

## Prerequisite
This script will extract data from the dataset provided at the above link, as long as that data is in the working directory under a subdirectory named "UCI HAR Dataset".

## Gathering metadata
Column names for the data are extracted from the provided file "UCI HAR Dataset/features.txt".
Activity names are extracted from "UCI HAR Dataset/activity_labels.txt".

## Getting training data
The training data is collected from the "UCI HAR Dataset/train" folder and separate files are combined into one dataframe.
Activity names and column names are used from the sources mentioned above.
Only the means and standard deviation columns are included.

## Getting test data
The test data is collected from the "UCI HAR Dataset/test" folder and separate files are combined into one dataframe.
Activity names and column names are used from the sources mentioned above.
Only the means and standard deviation columns are included.

## Combining training and test data and calculating column means for each variable per activity, per subject
Training and test data is added to a single data frame and the average is calculated for each measurement per subject, per activity

## Writing means dataframe to file
The resulting data frame is written to an output file named "result.means.txt".
