##Download the dataset, the working directory must be changed to the one desired
setwd("/Volumes/lel2/R/")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              "dataset.zip", curl=TRUE)
unzip("dataset.zip")

##Extract the features and the activity labels
features <- readLines("UCI HAR Dataset/features.txt")
activities <- readLines("UCI HAR Dataset/activity_labels.txt")

##Extract and compile the train set
subject_train <- readLines("UCI HAR Dataset/train/subject_train.txt")
x_train <- readLines("UCI HAR Dataset/train/X_train.txt")
y_train <- readLines("UCI HAR Dataset/train/y_train.txt")

train_set <- data.frame("subject"=subject_train)
x_train_features <- list()
n <- 1
for (subject in subject_train){
    x_train_per_subject <- unlist(strsplit(x_train[n], " "))
    x_train_per_subject <- x_train_per_subject[x_train_per_subject != ""]
    x_train_features[[paste(subject,n,sep="/")]] <- x_train_per_subject
    n <- n+1
}
x_train_features <- data.frame(matrix(unlist(x_train_features), 
                                      nrow=length(x_train_features),
                                      byrow=T))
names(x_train_features) <- features
train_set <- cbind(train_set, "activity"=y_train, x_train_features)

##Extract and compile the test set
subject_test <- readLines("UCI HAR Dataset/test/subject_test.txt")
x_test <- readLines("UCI HAR Dataset/test/X_test.txt")
y_test <- readLines("UCI HAR Dataset/test/y_test.txt")

test_set <- data.frame("subject"=subject_test)
x_test_features <- list()
n <- 1
for (subject in subject_test){
    x_test_per_subject <- unlist(strsplit(x_test[n], " "))
    x_test_per_subject <- x_test_per_subject[x_test_per_subject != ""]
    x_test_features[[paste(subject,n,sep="/")]] <- x_test_per_subject
    n <- n+1
}
x_test_features <- data.frame(matrix(unlist(x_test_features), 
                                      nrow=length(x_test_features),
                                      byrow=T))
names(x_test_features) <- features
test_set <- cbind(test_set, "activity"=y_test, x_test_features)

##Merges the training and the test sets to create one data set, and sort
##the subjects.
dataset <- rbind(train_set, test_set)
dataset <- lapply(dataset, as.numeric)
dataset <- as.data.frame(dataset)
dataset <- dataset[order(dataset$subject),]

##Extracts only the measurements on the mean and standard deviation
##for each measurement.
means <- dataset[grep("mean\\.", colnames(dataset))]
stds <- dataset[grep("std\\.", colnames(dataset))]
dataset_mean_stds <- cbind(subject=dataset$subject,activity=dataset$activity,
                           means,stds)

##Trim the labels
colnames(dataset_mean_stds) <- gsub("^X[0-9]?[0-9]?[0-9]?\\.", replacement="",
                                    colnames(dataset_mean_stds))
colnames(dataset_mean_stds) <- gsub("\\.\\.\\.", replacement=".",
                                    colnames(dataset_mean_stds))
colnames(dataset_mean_stds) <- gsub("\\.\\.", replacement="",
                                    colnames(dataset_mean_stds))

#Sort the data set by subjects and activities
dataset_mean_stds <- dataset_mean_stds[order(dataset_mean_stds$subject,
                                             dataset_mean_stds$activity),]

##From the data set, creates a second, independent tidy data set with 
##the average of each variable for each subject and each activity.
dataset_averages <- data.frame()
for (n in 1:length(dataset$subject)) {
    for (m in 1:length(activities)) {
        subject_data <- dataset_mean_stds[dataset_mean_stds[,"subject"] == n &
                                          dataset_mean_stds[,"activity"] == m,]
        if (length(subject_data$subject) == 0) {break}
        subject_data <- lapply(subject_data, as.numeric)
        subject_data <- lapply(subject_data, mean)
        dataset_averages <- rbind(dataset_averages,as.data.frame(subject_data))   
    }
}

##Give each activity a descriptive name in both data sets
replace_number_activity <- function(row){
    row <- activities[row]
}
dataset_averages$activity <- sapply(dataset_averages$activity,
                                     replace_number_activity)

##Save the final data set as csv 
write.table(dataset_averages, "tidy_dataset.txt")
