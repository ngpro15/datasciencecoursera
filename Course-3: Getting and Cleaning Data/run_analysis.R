library(dplyr)

#  Reading training set
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Reading test set
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")


#Merging train and test
X_merged <- rbind(X_train,X_test)
Y_merged <- rbind(Y_train,Y_test)
sub_merged <- rbind(sub_train,sub_test)


#Extracts only the measurements on the mean and standard deviation for each measurement.
feats_names <- read.table("./UCI HAR Dataset/features.txt")
var_selection <- feats_names[grep("mean\\(|std",feats_names[,2]),]
X_merged <- X_merged[,var_selection[,1]]


#Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(Y_merged) <- "Activity"
Y_merged <- as.factor(Y_merged$Activity)
levels(Y_merged) <- activity_labels[,2]


#Appropriately labels the data set with descriptive variable names
#Uses var_selection variable which contains only the required column names
colnames(X_merged) <- var_selection[,2]


#From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

colnames(sub_merged) <- "Subject"
View(sub_merged)
