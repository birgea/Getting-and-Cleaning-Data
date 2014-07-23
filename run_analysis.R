#
#  This script is used to create a didy data set out of the two data sets
#  with a number of Smartphones accelerometer and gyroscope sensors 
#  signals by approprietely grouping the data, assigning names to the activities
#  and creating descriptive column names. The resulting tidy data set contains
#  means of means and means of standard deviations for a set of signal
#  measurments grouped by activity and the subject who performed each activity 
#
# Check if the "stringr" package is installed and install it if not
if("stringr" %in% rownames(installed.packages())==FALSE) {
  install.packages("stringr")
}
# Load the "stringr" package
require(stringr)
# Get the names of the colums to use in the dataset
colNames=read.table("./UCI HAR Dataset/features.txt", header=F, stringsAsFactors=F)
colNames=colNames[,2]
# Get the names of the activities
actv=read.table("./UCI HAR Dataset/activity_labels.txt", header=F)

# Read in the train data, assigning the column headers on the fly
train_data=read.table("./UCI HAR Dataset/train/X_train.txt", header=F, sep="", comment.char="", col.names=colNames, colClasses=("numeric"))

# Read in the activities IDs to be merged with the train data
train_actv=scan("./UCI HAR Dataset/train/y_train.txt")

# Read in the subjects IDs to be merged with the train data
train_subject=scan("./UCI HAR Dataset/train/subject_train.txt")

# Merge subjects IDs with the train data
train_data$Subject=train_subject

# Merge the activities IDs with the train data
train_data$Actv=train_actv

# Repeat the abovementioned steps for the "test" data set
test_data=read.table("./UCI HAR Dataset/test/X_test.txt", header=F, sep="", comment.char="", col.names=colNames, colClasses=("numeric"))
test_actv=scan("./UCI HAR Dataset/test/y_test.txt")
test_subject=scan("./UCI HAR Dataset/test/subject_test.txt")
test_data$Subject=test_subject
test_data$Actv=test_actv

# Merge "train" and "test" data sets into one data frame 
data_all=rbind(train_data,test_data)

# Look for columns names that are related to either Mean or Standard Deviation calculations
columns_to_extract=str_detect(colNames,"(mean[^A-Z])|(std[^A-Z])")

# Estract only the colums that are related to either Mean or Statndard Deviation calculations
data_all=data_all[,columns_to_extract]

# Reshape the data frame to make it tidy
data_tidy=aggregate(.~Actv+Subject,data_all,mean)

# Replace Activities IDs with Activities Names in the tidy data frame
data_tidy$Actv=sapply(data_tidy$Actv, function (x) (actv[x,2]))

# Reorder the data frame to group by Activity first and by a subject's ID second 
data_tidy=data_tidy[order(data_tidy$Actv),]

# Change variable names to be more descriptive using regual expression
names(data_tidy)=gsub("(^[t|f])(Body|Gravity)(Body)?(\\w+)\\.(m|s)(ean|td)...?([XYZ]?)","\\1\\2\\4\\U\\5\\E\\6\\7",names(data_tidy),perl=T)

# Save the resulting tidy data frame to a file on disk in the space delimited, plain text format
write.table(data_tidy,"./tidy_data.txt", sep=" ")
