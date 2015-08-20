# Getting-and-Cleaning-Data
The code book
Project Description
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The final goal is to prepare a tidy data that can be used for later analysis. The script will read in multiple text files into a dataframe.  After performing data calculations and after some renaming / re-labeling the dataframe is then cleaned up resulting in a final text file that will contain tidy data.
Github repository contains the following items:
1.	Explanation of transformations / work that was performed to clean up the data
•	CodeBook.md
2.	Script that performs analysis
•	Run_analysis.R
3.	Tidy data set
•	Tidy.txt 
4.	Read me file
•	README.md
Pre-requisite packages
•	data.table
•	reshape2
•	tidyr

Run_analysis.R
•	Download the data file and unzip it.
•	Read in 7 text files:  
1.	X_train.txt
2.	Y_train.txt
3.	Subject_train.txt
4.	X_test.txt
5.	Y_test.txt
6.	Subject_test.txt
7.	Features.txt
•	Merge training and test data sets to creat 1 data frame named: completedSet
•	Extract the measurements on the mean and standard deviation for each measurement and keep activity and subject columns.  Store it in: meanstdcols
•	Create descriptive activity names and label each activity id:
a)	1 = Walking
b)	2 = Walking Upstairs
c)	3 = Walking Downstairs
d)	4 = Sitting
e)	5 = Standing
f)	6 = Laying
•	Create a tidy data set with the average of each variable for each activiy and each subject.

References

Data collected from the accelerometers from the Samsung Galaxy S smartphone. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

