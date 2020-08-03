This is the course project for the Coursera course `Getting and Cleaning Data`. Here are included:
* R script, run_analysis.R, saved in the `codes` folder.
* The resulting tidy dataset is saved as `tidy_data.csv`.
* The COdeBook is updated and saved as `CodeBook.md`

The script does the following:

1. Downloads the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Reads and merges into one whole dataset both the train and test datasets, along with the activity and subject datasets.
3. Renames column names to descriptive names, only selecting the measurements on the mean and standard deviation.
4. Labels the `activity` variable using its descriptive names.
5. Generates a file `tidy data.csv` with the average of each variable for each subject and each activity.
