# Sourcing librarries required to tiding data
library(plyr); library(dplyr); library(reshape2)

# Initializing directory variables containing the files
# Note: "getdata-projectfiles-UCI HAR Dataset.zip" should be 
# extracted beforehand in your working directory
workingDirectory <- getwd()
commonDataDirectory <- paste(workingDirectory, "/UCI HAR Dataset", sep ="")
testDataDirectory <- paste(commonDataDirectory,"/test", sep="")
trainDataDirectory <- paste(commonDataDirectory,"/train", sep="")

# Reading data from the right directories
## Test data
setwd(testDataDirectory)
X_test <- read.table("X_test.txt", sep = "") # observations data
Y_test <- read.table("y_test.txt", sep = "")  # features index
subject_test <- read.table("subject_test.txt", sep = "") # subject ids

## Train data
setwd(trainDataDirectory)
X_train <- read.table("X_train.txt", sep = "") # observations data
Y_train <- read.table("y_train.txt", sep = "") # features index
subject_train <- read.table("subject_train.txt", sep = "") # subject ids

## Common data to both Test and Train data
setwd(commonDataDirectory); 
features <- read.table("features.txt", sep = "") # variables for X_
activity_labels <- read.table("activity_labels.txt", sep = "") # actvity labels

# Creating a dataframe with all information in "df"
## Combining observations from train and test data
observations <- rbind(X_test, X_train)
activityIndex <- rbind(Y_test, Y_train)
activityLabels <- activity_labels$V2[activityIndex$V1]

## Combining the subjects who performed the test
subjects <- rbind(subject_test, subject_train)

## Creating "df" with all observations and variable names
df <- observations
names(df) <- features$V2

## Subsetting "df" to include only 
## measurements on the mean and standard deviation 
variablesSubset <- grepl('mean\\(\\)|std\\(\\)',names(df))
df <- df[, variablesSubset]

## Including in "df" columns with actvity labels and Subjects
df <- cbind(subjects, activityLabels, df)


## Naming "df" Subject and Actvity meaningfully
names(df)[1:2] <- c("Subject", "Activity")


# Steps creating the final tidy dataframe "tdf"
## Melting df into a melted tidy tall skiny data "mdf"
mdf <- melt(df, id = c("Subject", "Activity"), 
            measure.vars = names(df)[3:ncol(df)])

## Reformating the melted "mtd" into tidy "tdf" frame by mean
tdf <- dcast(mdf, Subject + Activity ~ variable, mean)

## Sorting  "df" by subject and then by activity
tdf <- arrange(tdf, Subject, Activity)

# Restablishing the working directory
setwd(workingDirectory)

# Writing the tidy "tdf" to "tidy_dataset.txt"
write.table(tdf, file="tidy_dataset.txt", row.name=FALSE)
