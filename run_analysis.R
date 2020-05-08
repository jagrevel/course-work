# Getting and Cleaning Data course project
# Source folder must be in home directory
# Output files will appear in home directory outside of source folder

library(tidyr)
library(dplyr)
library(readr)
library(stringr)

# Import features and clean parenthesis. 
# Not perfect for all features but sufficient for current targets
features <- read.table(".\\UCI HAR Dataset\\features.txt", sep = " ", header = TRUE, col.names = "featureName", colClasses = "character")
features$featureName <- str_remove(features$featureName, "\\(\\)")

#   Import and stack measurements. Stack order: train, test
trainX <- read_table(".\\UCI HAR Dataset\\train\\X_train.txt", col_names = features$featureName)
testX <- read_table(".\\UCI HAR Dataset\\test\\X_test.txt", col_names = features$featureName)
combined <- bind_rows(trainX, testX)

# Extract means and standard deviations
# Inclusion of '-' excludes undesired matches
averages <- select(combined, contains("-mean") | contains("-std"))
rm(combined)

# Stack and include activities/sujects. Stack order: train, test
trainers <- read_table(".\\UCI HAR Dataset\\train\\subject_train.txt", col_names = "subject")
testers <- read_table(".\\UCI HAR Dataset\\test\\subject_test.txt", col_names = "subject")
averages <- bind_cols(bind_rows(trainers, testers), averages)

trainY <- read_table(".\\UCI HAR Dataset\\train\\y_train.txt", col_names = "activityCode")
testY <- read_table(".\\UCI HAR Dataset\\test\\y_test.txt", col_names = "activityCode")
averages <- bind_cols(bind_rows(trainY, testY), averages)

rm(trainY, testY)


# Replace activity code with activity names
activiyCodes <- read_delim(".\\UCI Har Dataset\\activity_labels.txt", " ", col_names = c("activityCode","activity"))
averages <- inner_join(averages, activiyCodes, by = "activityCode", keep = FALSE)

# generate grouped averages
groupedSummary <- averages %>% 
  group_by(subject, activity) %>% 
  summarise_all(mean)

# write files to home directory
# write.table(averages, ".\\HAR extracted mean and std measurements.txt", row.names = FALSE)
write.table(groupedSummary, ".\\HAR categorized averages by individual.txt", row.names = FALSE)