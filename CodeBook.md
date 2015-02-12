---
title: "CODE BOOK"
author: "Marc Sol"
date: "February, 2015"
---

This document describes the data in file UCI_HAR_summary.txt, which has been created from the "UCI HAR Dataset" [1]. 

### Introduction
The "UCI HAR Dataset" contains detailed measurements of body movements of 30 observed volunteer subjects. The detailed measurements are described in the files "features.txt" and "features_info.txt" of the "UCI HAR Dataset" and in [1]. The measured signals are:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The XYZ signals were separated into an X, Y, and Z signal, so the above list, in fact defines 33 scalar signals. All values of these signals were sampled at a constant rate of 50 Hz, and then a set of 561 features was calculated from the signal samples. These features include, among others, the mean and standard deviation of the signals over short time intervals.

The 30 volunteer subjects were observed while performing the following activities:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

The observation data in the "UCI HAR Dataset" contains, per observation

* the number of the observed subject (1, 2, ..., 30)
* the number of the activity the subject was performing (1, 2, .., 6)
* 561 values, normalized and bounded within [-1,1], one value for each feature.

These observations are split into two subsets, called "train" and "test", each containing their own subset of the subjects. Combined, these sets contain 10299 observatons.

To simplify the analysis of the measured data, this solution creates a file UCI_HAR_summary.txt, which summarizes the "UCI HAR Dataset":

* Data from the "train" and "test" sets are combined such that information exists for all subjects.
* Each row summarizes measurements for one subject and activity. The summary contains 30 * 6 = 180 rows
* Columns Subject and Activity are the key of the table and describe the observed subject and the performed actvity
* The remaining 66 columns contain the mean across all observations of the subject and activity of the mean and standard deviation of the 33 scalar signals.

### Code Book
The following table describes the 68 columns of UCI_HAR_summary.txt.

* Col is the column number in the file
* Name is the column name in the file
* Feature is the number of the feature in the original "UCI HAR Dataset"
* Feature Name is the name of the feature in the original "UCI HAR Dataset". This contains only and all the features whose name contains the substring "-mean()" or "-std()"
* Type is the data type (possible values) that can be seen in the column in the file.


Col | Name | Feature | Feature Name | Type
--- | ---- | ------- | ------------ | ----
1 | Subject |  |  | integer 1..30
2 | Activity |  |  | "WALKING" , "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING""
3 | tBodyAccMeanX | 1 | tBodyAcc-mean()-X | number in range [-1.0,+1.0]
4 | tBodyAccMeanY | 2 | tBodyAcc-mean()-Y | number in range [-1.0,+1.0]
5 | tBodyAccMeanZ | 3 | tBodyAcc-mean()-Z | number in range [-1.0,+1.0]
6 | tBodyAccStDevX | 4 | tBodyAcc-std()-X | number in range [-1.0,+1.0]
7 | tBodyAccStDevY | 5 | tBodyAcc-std()-Y | number in range [-1.0,+1.0]
8 | tBodyAccStDevZ | 6 | tBodyAcc-std()-Z | number in range [-1.0,+1.0]
9 | tGravityAccMeanX | 41 | tGravityAcc-mean()-X | number in range [-1.0,+1.0]
10 | tGravityAccMeanY | 42 | tGravityAcc-mean()-Y | number in range [-1.0,+1.0]
11 | tGravityAccMeanZ | 43 | tGravityAcc-mean()-Z | number in range [-1.0,+1.0]
12 | tGravityAccStDevX | 44 | tGravityAcc-std()-X | number in range [-1.0,+1.0]
13 | tGravityAccStDevY | 45 | tGravityAcc-std()-Y | number in range [-1.0,+1.0]
14 | tGravityAccStDevZ | 46 | tGravityAcc-std()-Z | number in range [-1.0,+1.0]
15 | tBodyAccJerkMeanX | 81 | tBodyAccJerk-mean()-X | number in range [-1.0,+1.0]
16 | tBodyAccJerkMeanY | 82 | tBodyAccJerk-mean()-Y | number in range [-1.0,+1.0]
17 | tBodyAccJerkMeanZ | 83 | tBodyAccJerk-mean()-Z | number in range [-1.0,+1.0]
18 | tBodyAccJerkStDevX | 84 | tBodyAccJerk-std()-X | number in range [-1.0,+1.0]
19 | tBodyAccJerkStDevY | 85 | tBodyAccJerk-std()-Y | number in range [-1.0,+1.0]
20 | tBodyAccJerkStDevZ | 86 | tBodyAccJerk-std()-Z | number in range [-1.0,+1.0]
21 | tBodyGyroMeanX | 121 | tBodyGyro-mean()-X | number in range [-1.0,+1.0]
22 | tBodyGyroMeanY | 122 | tBodyGyro-mean()-Y | number in range [-1.0,+1.0]
23 | tBodyGyroMeanZ | 123 | tBodyGyro-mean()-Z | number in range [-1.0,+1.0]
24 | tBodyGyroStDevX | 124 | tBodyGyro-std()-X | number in range [-1.0,+1.0]
25 | tBodyGyroStDevY | 125 | tBodyGyro-std()-Y | number in range [-1.0,+1.0]
26 | tBodyGyroStDevZ | 126 | tBodyGyro-std()-Z | number in range [-1.0,+1.0]
27 | tBodyGyroJerkMeanX | 161 | tBodyGyroJerk-mean()-X | number in range [-1.0,+1.0]
28 | tBodyGyroJerkMeanY | 162 | tBodyGyroJerk-mean()-Y | number in range [-1.0,+1.0]
29 | tBodyGyroJerkMeanZ | 163 | tBodyGyroJerk-mean()-Z | number in range [-1.0,+1.0]
30 | tBodyGyroJerkStDevX | 164 | tBodyGyroJerk-std()-X | number in range [-1.0,+1.0]
31 | tBodyGyroJerkStDevY | 165 | tBodyGyroJerk-std()-Y | number in range [-1.0,+1.0]
32 | tBodyGyroJerkStDevZ | 166 | tBodyGyroJerk-std()-Z | number in range [-1.0,+1.0]
33 | tBodyAccMagMean | 201 | tBodyAccMag-mean() | number in range [-1.0,+1.0]
34 | tBodyAccMagStDev | 202 | tBodyAccMag-std() | number in range [-1.0,+1.0]
35 | tGravityAccMagMean | 214 | tGravityAccMag-mean() | number in range [-1.0,+1.0]
36 | tGravityAccMagStDev | 215 | tGravityAccMag-std() | number in range [-1.0,+1.0]
37 | tBodyAccJerkMagMean | 227 | tBodyAccJerkMag-mean() | number in range [-1.0,+1.0]
38 | tBodyAccJerkMagStDev | 228 | tBodyAccJerkMag-std() | number in range [-1.0,+1.0]
39 | tBodyGyroMagMean | 240 | tBodyGyroMag-mean() | number in range [-1.0,+1.0]
40 | tBodyGyroMagStDev | 241 | tBodyGyroMag-std() | number in range [-1.0,+1.0]
41 | tBodyGyroJerkMagMean | 253 | tBodyGyroJerkMag-mean() | number in range [-1.0,+1.0]
42 | tBodyGyroJerkMagStDev | 254 | tBodyGyroJerkMag-std() | number in range [-1.0,+1.0]
43 | fBodyAccMeanX | 266 | fBodyAcc-mean()-X | number in range [-1.0,+1.0]
44 | fBodyAccMeanY | 267 | fBodyAcc-mean()-Y | number in range [-1.0,+1.0]
45 | fBodyAccMeanZ | 268 | fBodyAcc-mean()-Z | number in range [-1.0,+1.0]
46 | fBodyAccStDevX | 269 | fBodyAcc-std()-X | number in range [-1.0,+1.0]
47 | fBodyAccStDevY | 270 | fBodyAcc-std()-Y | number in range [-1.0,+1.0]
48 | fBodyAccStDevZ | 271 | fBodyAcc-std()-Z | number in range [-1.0,+1.0]
49 | fBodyAccJerkMeanX | 345 | fBodyAccJerk-mean()-X | number in range [-1.0,+1.0]
50 | fBodyAccJerkMeanY | 346 | fBodyAccJerk-mean()-Y | number in range [-1.0,+1.0]
51 | fBodyAccJerkMeanZ | 347 | fBodyAccJerk-mean()-Z | number in range [-1.0,+1.0]
52 | fBodyAccJerkStDevX | 348 | fBodyAccJerk-std()-X | number in range [-1.0,+1.0]
53 | fBodyAccJerkStDevY | 349 | fBodyAccJerk-std()-Y | number in range [-1.0,+1.0]
54 | fBodyAccJerkStDevZ | 350 | fBodyAccJerk-std()-Z | number in range [-1.0,+1.0]
55 | fBodyGyroMeanX | 424 | fBodyGyro-mean()-X | number in range [-1.0,+1.0]
56 | fBodyGyroMeanY | 425 | fBodyGyro-mean()-Y | number in range [-1.0,+1.0]
57 | fBodyGyroMeanZ | 426 | fBodyGyro-mean()-Z | number in range [-1.0,+1.0]
58 | fBodyGyroStDevX | 427 | fBodyGyro-std()-X | number in range [-1.0,+1.0]
59 | fBodyGyroStDevY | 428 | fBodyGyro-std()-Y | number in range [-1.0,+1.0]
60 | fBodyGyroStDevZ | 429 | fBodyGyro-std()-Z | number in range [-1.0,+1.0]
61 | fBodyAccMagMean | 503 | fBodyAccMag-mean() | number in range [-1.0,+1.0]
62 | fBodyAccMagStDev | 504 | fBodyAccMag-std() | number in range [-1.0,+1.0]
63 | fBodyBodyAccJerkMagMean | 516 | fBodyBodyAccJerkMag-mean() | number in range [-1.0,+1.0]
64 | fBodyBodyAccJerkMagStDev | 517 | fBodyBodyAccJerkMag-std() | number in range [-1.0,+1.0]
65 | fBodyBodyGyroMagMean | 529 | fBodyBodyGyroMag-mean() | number in range [-1.0,+1.0]
66 | fBodyBodyGyroMagStDev | 530 | fBodyBodyGyroMag-std() | number in range [-1.0,+1.0]
67 | fBodyBodyGyroJerkMagMean | 542 | fBodyBodyGyroJerkMag-mean() | number in range [-1.0,+1.0]
68 | fBodyBodyGyroJerkMagStDev | 543 | fBodyBodyGyroJerkMag-std() | number in rang [-1.0,+1.0]

File "UCI_HAR_summary.txt" has a header with the names as found in the Name column in the above table.

### References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
