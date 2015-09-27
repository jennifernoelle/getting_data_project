# Getting Data: Course Project
# Tidy data sript


# 0. Download the UCI data files to your working directory
#setwd("~/Dropbox/Coursera/getting_data/project/data")

# 1. Merge the training and test sets to create one data set

## reading in all the files, see how they fit together
### subject_test/ subject_train: ID's the subject (30 possible subjects)
subject_test <- read.table("subject_test.txt") #dim=2947 x1
subject_train <-read.table("subject_train.txt") # 7352 x1

### x_test/ x_train: data set
x_test <- read.table("x_test.txt") #2947 obs of 561 vars (features)
x_train <- read.table("x_train.txt") #7352 obs of 561 vars

### y_test/y-train: labels - one col contains int 1-6 (activity code)
y_test <- read.table("y_test.txt") #2947 obs of 1 var
colnames(y_test) <- "activityCode"

y_train <- read.table("y_train.txt") #7352 obs of 1 var
colnames(y_train) <- "activityCode"

### activity_labels: links labels with their numeric label
activity_labels <- read.table("activity_labels.txt") # 6 x 2 (6 acts)
colnames(activity_labels) <- c("activityCode", "activity") #prep for merge

### features: 561 obs of 2 vars
features <- read.table("features.txt")
features$V2 <- gsub("mean", ".mean", features$V2)
features$V2 <- gsub("Mean", ".mean", features$V2)
features$V2 <- gsub("std", ".std", features$V2)
features$V2 <- gsub("-", "", features$V2)
features$V2 <- gsub(",", "", features$V2)

## Affix variable names to the dataset tables (x_test, x_train)
### Var names for the x data sets are the observations in features
names(x_test) <- features$V2 #use feature names vector as var names
names(x_train) <-features$V2


## CBind Vars: 
### Bind together subject names, activity codes and names, data
test_data <- cbind(subject_test, y_test, x_test)
train_data <- cbind(subject_train, y_train, x_train)
colnames(test_data)[1] <-("subjectID")
colnames(train_data)[1] <-("subjectID")

## JOIN DATASETS BY ROWBINDING TEST AND TRAINING OBSERVATIONS

## Create binary var to indicate test or train
test_data$testDummy= 1
train_data$testDummy=0

## Rowbind
joined_data <- rbind(test_data, train_data)

## Reorder cols
joined_data <- joined_data[, c(1,564,2,3:563)]


# 2. Extract only the masurements on the mean and sd for 
# each feature measurement

##Fix the feature names a little better
names(joined_data) <- make.names(names(joined_data))

##Filter on column names
keep_vars <- grep("mean|std", colnames(joined_data))
subset_data <- joined_data[, c( 1:3, keep_vars)]


# 3. Match activity codes to activity labels
##Note: this reorders data and should not be done earlier
merged_data <- merge(subset_data, activity_labels, by="activityCode")

##reorder columns to bring activity name to position 3
merged_data <- merged_data[, c(2,3,90,1,4:89)]

# 4. Label with descriptive variable names

## Varnames for subject, activity, features added in step 1

## Further cleaning features names
names(merged_data) <- gsub("tBody", "timeBody", names(merged_data))
names(merged_data) <- gsub("tGravity", "timeGravity", names(merged_data))
names(merged_data) <- gsub("fBody", "freqBody", names(merged_data))
names(merged_data) <- gsub("fGravity", "freqGravity", names(merged_data))

# 5. Create data set with the avg of each variable for each activity,each subject

## group by subject and activity
library(dplyr)
mydata <- tbl_df(merged_data) # create new tbl object

bySubjAct <- group_by(mydata, subjectID, activity)
tidyData <- summarize_each(bySubjAct, funs(mean), -(testDummy:activityCode))

# SUBMISSION: write table to text file
write.table(tidyData, "tidy_data.txt", row.name=FALSE, sep="\t")
tidyData2 <- read.table("tidy_data.txt", header=TRUE) # check to see if it looks right
