Getting-and-Cleaning-Data
=========================

This GitHub Repository is used to host scripts and documents related to the "Getting and Cleaning the Data" Coursera Course.

The repository hosts two files related to the project:  
* run_analysis.R script
* CodeBook.md document

The "run_analysis.R"" script is used to create a didy data set out of the two data sets
with a number of Smartphones accelerometer and gyroscope sensors 
signals by appropriately grouping the data, assigning names to the activities
and creating descriptive column names. The resulting tidy data set contains
means of means and means of standard deviations for a set of signal
measurements grouped by activity and the subject who performed each activity  

The "CodeBook.md" document describes how the script should be used, what it does, how the output should be interpreted and provideds an explanation of the meaning of the variables names.  

The data for this Exercise has come from the study that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
