# getting_data_project: PRACTICE VERSION
Course Project for Getting and Cleaning Data: Human Activity Recognition Using Smartphones Data Set - Tidy Version
# Getting and Cleaning Data Course Project README

## PURPOSE: The general purpose of this repository is to provide users with all of the necessary information to transform the raw UCI data from the "Human Activity Recognition Using Smartphones Data Set" including 10299 records across 561 attributes into a tidy data set of 180 records across 88 attributes. This tidy data results from the following general manipulations, detailed in the Codebook. 
  1. Reassembles the UCI data, downloadable in pieces, into a single joined data set. 
  2. Selects a subset of variables corresponding to subject, experiment type - test or training - and 86 mean and standard deviation feature measures. 
  3. Collapses the above subset by subject and by activity to yield two-way grouped means of the specified feature measures. 

## FILES: This repository contains the following files: 
  1. CodeBook.md - codebook describing the data structure and variables
  2. run_analysis.R -  An R script called which transforms the UCI data into tidy_data.txt - the file submitted for grading on the Coursera website

## FINAL PRODUCT: The final product of the transformations detailed in this repo, tidy_data.txt, is submitted via the Coursera project page. 

## DATA TRANSFORMATION DETAILS

### The final tidy dataset was created via a series of transformations, scripted in run_analysis.R, on the UCI dataset, available here:
  * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Protocol for replicating the tidy data transformation
0. Download the UCI data to your working directory. 
1. Joining the datasets: join observations from training and test datasets - "step 1" in assignment
    1.Affix variable names from the file features.txt to the dataset tables x_test.txt and x_train.txt
    2.Alter feature names to comply with R variable name protocol
    3.Use the names command to affix variable names to columns of the   respective datasets
    4. Bind together the columns from the above two tasks, as well as the subject tables, subject_test.txt and subject_train.txt to yield completely reassembled test and train datasets. 
    5. Bind together the rows from the two datasets assembled above to create one dataset including by test and train data from the experiments. 
    6. Create a dummy variable to indicate which dataset each record originates from, test or train. 
    7. Reorder the columns so subject id, testDummy, activity come first
    
2. Extract only the measurements on the mean and standard deviation for each feature measurement. - "step 2" in assignment
    1. Generate a vector of column indices to keep based on a match of the phrase "mean" or "std"
    2. Use this vector to subset only the basic identifier, mean, and std variables

3. Match activity codes in the joined dataset to explanatory activity labels in activity_labels.txt by merging on a the activity 
code variable. Note, this reorders the data and should not be done prior to the column-binding - "tep 3" in assignment

4. Descriptive variable names - "step 4" in assignment
    1. In Step 1: Prior to joining the data sets, the variables for "subject", "activity_code", "activity" were renamed from V1, etc.
    2. In Step 1: Prior to joining the data sets, the variables for the experimental data were renamed using the data in "features.txt"
    3. The prefixes "t" and "f" were changed to "time" and "freq" respectively
    
5. Create tidy data set with the average of each variable for each activity and each subject using the dplyr package - "step 5"
    4. Group the data above by subject and activity using group_by
    5. Summarize each non-grouping variable in the data by the groups above
      using summarize_each
    
    
## ADDITIONAL INFORMATION
  * Information on the base UCI data available here: 
  * http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
