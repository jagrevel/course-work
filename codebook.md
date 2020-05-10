Variable description


__Datasets summary:__

| Name:          | Type:      | Obs.   | Variables  | Purpose                                        |
|----------------|------------|--------|------------|------------------------------------------------|
| activiyCodes   | tibble     | 6      | 2          | Activity lookup table                          |
| averages       | tibble     | 10,299 | 68         | Intermediary dataset                           |
| combined       | tibble     | 10,299 | 560        | Intermediary dataset                           |
| groupedSummary | tibble     | 180    | 68         | Intermediary dataset                           |
| testers        | tibble     | 2,947  | 1          | Imported test subject list                     |
| testX          | tibble     | 2,947  | 560        | Imported test dataset                          |
| testY          | tibble     | 2,947  | 1          | Imported test activity list                    |
| trainers       | tibble     | 7,352  | 1          | Imported train subject list                    |
| trainX         | tibble     | 7,352  | 560        | Imported train dataset                         |
| trainY         | tibble     | 7,352  | 1          | Imported train activity list                   |
| features       | data.frame | 560    | 1          | Imported variable names                        |

__Features (column names)__
  - 'subject': ID number of subject performing the measured activity
  - 'activity': Description of activity measured
  - 'activityCode': Numerical key for activity (preserverd for alternate sorting paradigm)
  - '(t|f)[variable]-\[function](-(X|Y|Z))?': Measured values from original dataset
    - 't': Time domain signal
    - 'f': Fast Fourier transform
    - 'variable': Measured feature
    - 'function': Statistic of feature represented, output file includes only mean and standard deviation
    - 'X|Y|Z': (optional) axial direction of measured signal
	- Example: 'tBodyAcc-mean-Y' is the mean time-based body acceleration measured on the Y-axis 
	- For more details see original documentation

__Other Data & Values__
  - 'folder':  chr, intended file path of extracted folder "./UCI HAR Dataset"
  - 'libList':  chr[], list of packages required for analysis
  - 'packs': data.frame, df indicating package installation status
  - 'target': chr, currnt package evaluation
