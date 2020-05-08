Original data source:

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

Running run_analysis.R requires the following conditions:
  - Installation of "tidyr", "dplyr", "stringr", and "readr" packages
  - Unzipped folder with name "UCI HAR Dataset" in working directory

Output: 
  -'HAR categorized averages by individual.txt': Mean and standard deviation measurements averaged by 'subject' & 'activity'

Variables:
  - 'subject': ID number of subject performing the measured activity
  - 'activity': Description of activity measured
  - 'activityCode': Numerical key for activity (redundant)
  - '(t|f)[variable]-[function](-(X|Y|Z))?': Measured values from original dataset
    - 't': Time domain signal
    - 'f': Fast Fourier transform
    - 'variable': Measured feature
    - 'function': Statistic of feature represented
    - 'X|Y|Z': (optional) axial direction of measured signal

For debugging intermediary datasets, comment out lines containin rm(#####)
