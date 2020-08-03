library(readr)
library(reshape2)

if(!dir.exists("./data/UCI HAR Dataset")){
  if(!file.exists("./data/dataset.zip")){
    if(!dir.exists("./data")) {
      dir.create("./data")
    }
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, "./data/dataset.zip")
  }
  unzip("./data/dataset.zip", exdir = "./data")  
}

setwd("./data/UCI HAR Dataset")

# 1. Merging the training and test sets to create one data set called `dataset`

## Variables names on the `x` dataset
features <- read_delim("features.txt", delim = " ", col_names = FALSE)$X2

## Activity labels
activity <- read_table("activity_labels.txt", col_names = c("activityCode", "activity"))

## Test data
x_test <- read_table("./test/X_test.txt", col_names = FALSE)
y_test <- read_table("./test/Y_test.txt", col_names = "activity")
s_test <- read_table("./test/subject_test.txt", col_names = "subject")

## Train data
x_train <- read_table("./train/X_train.txt", col_names = FALSE)
y_train <- read_table("./train/Y_train.txt", col_names = "activity")
s_train <- read_table("./train/subject_train.txt", col_names = "subject")

## Actual merge
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
s <- rbind(s_test, s_train)
rm("x_test", "y_test", "s_test", "x_train", "y_train", "s_train")

## Renaming variables in `x` dataset
names(x) <- features

# 2. Extract measurements on the mean and standard deviation for each measurement
extract <- grepl("mean|std", features)
x <- x[ , extract]

## Complete merge
dataset <- cbind(s, y, x)

# 3. Using descriptive activity names to name the activities in the `dataset`
dataset$activity <- factor(dataset$activity, levels = activity$activityCode, labels = activity$activity)
dataset$subject <- as.factor(dataset$subject)

# 4. Appropriately labels the data set with descriptive variable names
varNames <- names(dataset)
varNames <- gsub("-mean", "Mean", varNames)
varNames <- gsub("-std", "Std", varNames)
varNames <- gsub("[()-]", "", varNames)
names(dataset) <- varNames

# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
meltedData <- melt(dataset, id = c("subject", "activity"))
tidyData <- dcast(meltedData, subject + activity ~ variable, mean)

if(!dir.exists("../../output")) {
  dir.create("../../output")
}
write_csv(tidyData, "../../output/tidy_data.csv")
