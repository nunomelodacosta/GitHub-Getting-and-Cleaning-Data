---
title: "Getting and Cleaning Data Course Project: README"
author: "Nuno Melo"
date: "Friday, March 20, 2015"
output: html_document
---

##How the script works
**run_analysis.R** is an R script which collects, works with, cleans and summarizes 
datasets with information of Human Activity Recognition Using Smartphones. A full description of the data and the experiment are available at the site where the data was obtained: 
**http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones**

**run_analysis.R** script performs the following steps. These are commented within the script as well.

1. Reads the relevant data files from their respective directories
2. Merges the training and the test sets to create one data set
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names *Subject* and *Activity* to identify the individuals who performed the activities during experiment 
5. Labels the data set variables with descriptive variable names. 
6. Finally an independent, tidy and summarized dataset is created and saved, with the average of each measurement extracted on 3., for each activity and each subject.

##The data
The dataset can be downloaded from:
**https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip**
8 data file included in the downloaded dataset are read and manipulated by **run_analysis.R**:

* X_test.txt
* Y_test.txt
* X_train.txt
* Y_train.txt
* subject_test.txt
* subject_train.txt
* features.txt
* activity_labels.txt

##The script output
**tidy_dataset.txt** is a txt file, and the outcome produced by run_analysis.R.
The file is created in the working directory with the R function
```{r}
write.table(tdf, file="tidy_dataset.txt", row.name=FALSE)*
```

##How to run the script and create the desired output file
The following steps should be done in order, to execute **run_analysis.R** and 
produce **tidy_dataset.txt**

1. Know your working directory in R with [*getwd()*][2] function
2. Download the dataset from this [link][1]
3. Save the downloaded zip file **getdata-projectfiles-UCI HAR Dataset.zip** into your R working directory
4. Unzip the **getdata-projectfiles-UCI HAR Dataset.zip** file into your working directory. A new directory **UCI HAR Dataset** will be created. This directory has all raw data needed
5. Copy **run_analysis.R** into your working directory
6. Open **run_analysis.R** with your R editor and run the full script 
7. Load **tidy_dataset.txt** file into a dataframe in R for analysis and further manipulation with 

```{r}
myDataFrame <- read.table("tidy_dataset.txt", sep = "")
```


[1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[2]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/getwd.html