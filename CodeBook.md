---
title: "Getting and Cleaning Data Course Project"
author: "Nuno Melo"
date: "Friday, March 20, 2015"
output: html_document
---

#The scrpit
**run_analysis.R** is an R script which collects, works with, cleans and summarizes 
datasets with information of Human Activity Recognition Using Smartphones.

#The data
The dataset can be downloaded from:
**https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip**

#The script and files work toghther
**tidy_dataset.txt** is a txt file and outcome produced by run_analysis.R.
The file is created in the working directory with the R function
```{r}
write.table(tdf, file="tidy_dataset.txt", row.name=FALSE)*
```

#How to make the script work
The following steps should be done in order to execute **run_analysis.R** and 
produce **tidy_dataset.txt**

1. Download the dataset from this [link][1] (copy the link above to your web browser, if it does not work)
2. A directory **UCI HAR Dataset** will be created. This directory has all raw data needed
3. Copy **run_analysis.R** to the **UCI HAR Dataset** directory
4. Set **UCI HAR Dataset** your working directory with [*setwd()*][2] function R
5. Open **run_analysis.R** with your R editor and run the script 
6. Load the file into a dataframe in R for analysis and further manipulation with 

```{r}
tdf <- read.table("tidy_dataset.txt", sep = "")
```



[1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[2]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/getwd.html