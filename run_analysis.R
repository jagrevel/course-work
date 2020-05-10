# Getting and Cleaning Data course project

# Check for and/or acquire data source
folder <- file.path("./UCI HAR Dataset/")

if (!dir.exists(folder)) {
  zipfile <- file.path(paste(folder, ".zip"))
  if (!file.exists(zipfile)) {
    url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url1, zipfile)
  }
  unzip(zipfile)
}

# Install missing packages
libList = c("dplyr", "readr", "stringr")

packs <- data.frame(
  packageName = as.character(libList),
  installed = is.element(libList, installed.packages()[,1]))

for (x in 1:length(libList)) {
  target <- as.character(packs$packageName[x])
  if (packs$installed[x] == FALSE) {
    install.packages(target)
  }
  library(target, character.only = TRUE)
}


# Import features (clean parenthesis later)
features <- read.table("./UCI HAR Dataset/features.txt",
                       sep = " ",
                       header = TRUE,
                       col.names = "featureName",
                       colClasses = "character"
                       )


# Import and stack measurements. Stack order: train, test
trainX <- read_table("./UCI HAR Dataset/train/X_train.txt",col_names = features$featureName)
testX <- read_table("./UCI HAR Dataset/test/X_test.txt", col_names = features$featureName)
combined <- bind_rows(trainX, testX)

# Extract means and standard deviations then clean parentheses from desired features
averages <- select(combined, (contains("-mean()") | contains("-std()")))
colnames(averages) <- str_remove_all(colnames(averages), "\\(\\)")

#memoryManagment
#rm(combined)

# Stack and include activities/sujects. Stack order: train, test
trainers <- read_table("./UCI HAR Dataset/train/subject_train.txt", col_names = "subject")
testers <- read_table("./UCI HAR Dataset/test/subject_test.txt", col_names = "subject")
averages <- bind_cols(bind_rows(trainers, testers), averages)

trainY <- read_table("./UCI HAR Dataset/train/y_train.txt", col_names = "activityCode")
testY <- read_table("./UCI HAR Dataset/test/y_test.txt", col_names = "activityCode")
averages <- bind_cols(bind_rows(trainY, testY), averages)

#memoryManagement
#rm(trainX, testX, trainY, testY, testers, trainers)


# Replace activity code with activity names
activiyCodes <- read_delim("./UCI Har Dataset/activity_labels.txt", " ", col_names = c("activityCode","activity"))
averages <- inner_join(averages, activiyCodes, by = "activityCode", keep = FALSE)

# generate grouped averages
groupedSummary <- averages %>% 
  group_by(subject, activity) %>% 
  summarise_all(mean)

# write files to home directory
# write.table(averages, "./HAR_means-std.txt", row.names = FALSE)
write.table(groupedSummary, "./HAR_summary.txt", row.names = FALSE)
