# Coursera course " Getting and Cleaning Data"
# Course Project
# Author: Marc Sol
# February, 2015
#
# This R script loads files from the "UCI HAR Dataset" [1] and creates a summary file (UCI_HAR_summary.txt) which specifies,
# per observed subject and per subject's activity, the mean of all measured variables of type mean or standard deviation. 
#
# This script is part of a solution also containing a README.md, and a CodeBook.md describing the generated UCI_HAR_summary.txt.
# Please redfer to README.md for instructions on how to run this script.
# ---------------------------------------------------------

library(data.table)
library(reshape2)

dataRootDir <- "UCI HAR Dataset"

# ---------------------------------------------------------
# feature names
# featureNamesFile contains 2 columns, 561 rows. Each row contains a feature number (1..561) and feature name.
featureNamesFile <- sprintf("%s/%s", dataRootDir, "features.txt")
featureNames <- fread(featureNamesFile, colClasses=c("integer", "character"))
setnames(featureNames, "V1", "Number")
setnames(featureNames, "V2", "Name")
# From all 561 features, we only are interested in those that describe mean or standard deviation of measurements.
# According features_info.txt, these are all the features whose name contains either "-mean()" or "-std()".
featureNames[, IsMean:= grepl("-mean\\(\\)", Name)]
featureNames[, IsStdDev:= grepl("-std\\(\\)", Name)]
featureNames[, IsOfInterest:= IsMean | IsStdDev ]
# Rename the features to replace the -mean()- and -std()- substrings, with Mean and StDev. The final - is optional,
# since some measure names end with -mean() or -std().  Without this step, the column names in the end result are ugly,
# since the - ( and ) characters will be replaced with .
featureNames$OriginalName <- featureNames$Name
featureNames$Name <- gsub("-mean\\(\\)-?", "Mean", featureNames$Name)
featureNames$Name <- gsub("-std\\(\\)-?", "StDev", featureNames$Name)
# Store the resulting number of features we will work with
nofFeaturesOfInterest <- nrow(featureNames[ featureNames$IsOfInterest, ])

# ---------------------------------------------------------
# activity names
activityNamesFile <- sprintf("%s/%s", dataRootDir, "activity_labels.txt")
activityNames <- fread(activityNamesFile, colClasses=c("integer", "character"))
setnames(activityNames, "V1", "Number")
setnames(activityNames, "V2", "Name")

# ---------------------------------------------------------
# Read observations

ReadDataSet <- function( rootDir, dataset ) {
    X_file <- sprintf("%s/%s/X_%s.txt", rootDir, dataset, dataset)
    subject_file <- sprintf("%s/%s/subject_%s.txt", rootDir, dataset, dataset)
    y_file <- sprintf("%s/%s/y_%s.txt", rootDir, dataset, dataset)
    # Each of these three files contain 2947 rows
    # X_file           561 columns, i.e. a column per feature.
    # subject_file     1 column, indicating the subject (person) 
    #                  Each row identifies the subject who performed the activity for each window sample.
    #                  Its range is from 1 to 30.
    # y_file           1 column, the number of the activity (1..6)
    #                  This is a refence to an activity in activityNames
    
    # To ensure that we only read the features of interest, create a colClasses vector with "NULL" for the non-interesting columns
    columnClasses <- ifelse( featureNames$IsOfInterest, "numeric", "NULL")
    # read the X_file
    features <- data.table(read.table(X_file, stringsAsFactors=FALSE, colClasses=columnClasses, col.names=featureNames$Name))
    # features contains only columns for the features of interest (nofFeatureOfInterest)
    # Add a column "Subject" with the number of the subject that was observed
    features$Subject <- data.table(read.table(subject_file, colClasses=c("integer"), col.names=c("Subject")))
    # Add a column "Activity", with the name of the activity the subject was performing
    activityNumbers <- data.table(read.table(y_file, colClasses=c("integer"), col.names=c("ActivityNumber")))
    features$Activity <- sapply( activityNumbers, function(activityNumber) { activityNames$Name[activityNumber]})
    
    # We can ignore the sub folder "Inertial Signals", since all required data is available in the above files (X, y, subject).
    
    # return the created features data.table
    features
}

# Load the two data sets
testData <- ReadDataSet( dataRootDir, "test" )
trainData <- ReadDataSet( dataRootDir, "train" )
# Merge testData and trainData
data <- rbindlist( list(testData, trainData), use.names=TRUE)

# ----------------------------------------------------------------------------------
# Transform the wide data set format into a "skinny" format with (name, value) records per measure.
# This allows us to easily calculate the mean per (subject, activity, measure)
skinnyData <- melt( data, id=c("Subject", "Activity"), measure.vars=names(data)[1:nofFeaturesOfInterest])
# skinnyData contains 4 columns: "Subject", "Activity", "variable", and "value"
# Column "variable" contains the name of a measure, and "value" contains its value.
# So each row of data is broken down into 79 individual rows, 1 per feature of interest.
# Now summarize this skinny table grouping by "Subject" and "Activity", and casting the measures back into columns
summary <- dcast(skinnyData, Subject + Activity ~ variable, mean)

# Write summary to file
# Requirement: provide summary data set as a txt file created with write.table() using row.name=FALSE
write.table(summary, "UCI_HAR_summary.txt", row.names=FALSE)

# ----------------------------------------------------------------------------------
# END
# ----------------------------------------------------------------------------------
