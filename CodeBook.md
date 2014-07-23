Course Project Script run_analysis.R
========================================================

This document describes how the scrip run_analysis.R is working and how it should be run.
The meaning of the variables names is given as well.  

Section 1 - How the script works
--------------------------------------------------------
The description will be closely aligned with the five requirements for this project.
The script should be called from a directory that contains the "UCI HAR Dataset" directory where all of the input data files are stored.

### 1. Merge the training and the test sets to create one data set

The script is using the "str-detect" function which is part of the "stringr" package so the first couple of lines of the script check if the package is installed and install it if it is not.    

Since the names for the variables and the names of the activities are stored in separate files, the script reads them in as separate data frames. 

The script then cerates two data frames, one from the Test data set and the other from the Train data set. Please note that column names are assigned while the data is read by supplying "col.names" attribute in the read.table function.  

Activities' IDs and Subjects' IDs are read as vectors using the "scan" function and then added to the data frames as additional columns.  

The actual merge of the two data frames is done using the "rbind" function.  

### 2. Extract only the measurements on the mean and standard deviation for each measurement.  

I am using the "str detect" function of the "stringr" package to search the columns names for the words "mean" and "std" which would indicate the mean and Standard Deviation measurements. There is also a measurement that has the word "meanFreq()" in its name but I have decided not to include it. The function uses a regular expression that will flag only names that have either the word "mean" or the word "std". These are the columns we are interested to extract.  

The script then truncates the merged data frame horizontally to include only the selected measurements  

### 3. Create a second, independent tidy data set with the average of each variable for each activity and each subject  

A new data frame is created by restructuring the way how the data is presented and aggregating the data first by the Activity and then by the Subject. A "mean" function is applied to calculate the mean of each measurement grouped by each activity and each subject.  

The data frame is further sorted by the Activity.  
 
### 4. Uses descriptive activity names to name the activities in the data set  

The "sapply" function was used to replace Activities identifiers with Activities names in the tidy data frame. The names were taken from the data frame called "Actv" that was created at the beginning of the script.  

### 5. Appropriately label the data set with descriptive variable names.  

This ask has generated a lot of questions in the forums. As the names of the measurements appeared pretty descriptive to me as is I have decided to limit their transformation to just removing characters that may appear confusing to R such as "." and also capitalizing the first letter of the words "mean" and "std". Also, some labels had duplicate word "Body" in them, such as "fBodyBodyGyroJerkMag-min()". This had to be fixed as well. 

A regular expression attribute to the "gsub" function was used to perform all these replacements and modifications.  

### 6. Save the resulting tidy data frame to a file  

The last line of the script saves the tidy data frame to a text file. columns of the file are space separated, similar to the input files.  


Section 2 - Variables Names and their Meaning
--------------------------------------------------------
