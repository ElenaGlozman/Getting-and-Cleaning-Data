# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 

#1st download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#message("Downloading data")
download.file(fileUrl, destfile='localFile.zip')
unzip('localFile.zip', exdir="data")

#read in training and test files
# add column name for subject files
xTrain <- read.table("data/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("data/UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
names(subjectTrain) <- "subjectID"
names(yTrain) <- "activity"

xTest <- read.table("data/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("data/UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
names(subjectTest) <- "subjectID"
names(yTest) <- "activity"

# Read the feature list file
features <- read.table("data/UCI HAR Dataset/features.txt")
names(xTrain) <- features$V2
names(xTest) <- features$V2

#merge training and test sets to create 1 data set
train <- cbind(subjectTrain, yTrain, xTrain)
test <- cbind(subjectTest, yTest, xTest)
completedSet <- rbind(train, test)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
#find which columns are mean and std columns
meanstdcols <- grepl(".*Mean.*|.*Std.*", names(completedSet), ignore.case = TRUE)

#keep the subject and activity columns
meanstdcols[1:2] <- TRUE

completedSet <- completedSet[, meanstdcols]

completedSet$activity[completedSet$activity == 1] = "WALKING"
completedSet$activity[completedSet$activity == 2] = "WALKING UPSTAIRS"
completedSet$activity[completedSet$activity == 3] = "WALKING DOWNSTAIRS"
completedSet$activity[completedSet$activity == 4] = "SITTING"
completedSet$activity[completedSet$activity == 5] = "STANDING"
completedSet$activity[completedSet$activity == 6] = "LAYING"


##Creates a tidy data set with the
## average of each variable for each activity / subject.

# create the tidy data set
melted <- melt(completedSet, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)

# write the tidy data set to a file
write.table(tidy, "tidy.txt", row.names=FALSE)
