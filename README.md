These files are to satisfy assignment requirements from 'Getting and Cleaning Data' course Week 4. Instructions are to take the data set described below and complete the following tasks:
  
  1. Merge the training and the test sets to create one data set.
  2. Extract only the measurements on the mean and standard deviation for each measurement.
  3. Use descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

__Original data source:__

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


Data URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Information page URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

__Running information:__

Script will automatically acquire the necessary packages and data. If the download fails, the script will also work if the downloaded .zip folder from the link above is pre-exctracted into the working directory.

Packages may not install under certain network conditions. If packages do not install, manually install 'dplyr', 'readr', and 'stringr' packages.

If available memory is a concern, search #memoryManagement and uncomment rm() functions to increase memory availability during processing

__Input files:__
  -'features.txt': List of all features (column names).
  -'activity_labels.txt': Links the class labels with their activity name (activity lookup table).
  -'train/X_train.txt': Training set (dataset).
  -'train/y_train.txt': Training labels (activiy values).
  -'test/X_test.txt': Test set (dataset).
  -'test/y_test.txt': Test labels (activity values).
  -'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (subjectIDs). 
  -'test/subject_test.txt': as in subject_train but pairs with test data.

__Output:__
  -'HAR_summary.txt': Mean and standard deviation measurements averaged by 'subject' & 'activity'
  -'HAR_means-std.txt': Original mean and standard deviation measurements 

__Running Notes:__
Script will generate warnings that do not impact current script function. Specifically, some column names will be automatically re-named to avoid duplicates. None of the columns affected are targeted by this analysis.
