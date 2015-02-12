---
title: "README"
author: "Marc Sol"
date: "February, 2015"
output: html_document
---

This solution describes how the "UCI HAR Dataset" [1] has been transformed into a single file "UCI_HAR_summary.txt", which should support easier (but less detailed) analysis of the original data set. This solution contains the following components

* This README.md file
* CodeBook.md describes "UCI_HAR_summary.txt" and how it has been created from the original "UCI HAR Dataset"
* run_analysis.R is the R script that creates "UCI_HAR_summary.txt"

### Running the R script
To generate the "UCI_HAR_summary.txt", perform the following steps:

1. Download and unzip the "UCI HAR Dataset" from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Store the unzipped folder called "UCI HAR Dataset" in the current working directory of R.
3. Store the script run_analysis.R in the current working directory of R.
4. Run the script.
5. The result file "UCI_HAR_summary.txt" is written into the current working directory of R.

### Background
This solution has been created for the Course Project Assignment for the Coursera course "Getting and Cleaning Data" [2]

### References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2] https://class.coursera.org/getdata-011