In this repo, the run_ analysis.R script is used to perform a cleaning operation on a set of data obtained from the website - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones with the actual data  sets used in the project obtained from - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The GDCcodebook.md gives a description of the variables in the tidydata set. Thus in order to understand the data in the tidyData frame the codbook haas to be used alongside.

###The code in summary runs through these steps:
1. The zip file for the data was downloaded unto my working directory on my computer.
2. The downloaded data was viewed and studied to understand the information and the variables involves in the project.
3. The data were categorisesd into two sets namely the train set and the test sets. These were read into variables.
4. these data sets were given column names for easy subsetting of the mean and standard deviation.
4. The two data feames created were now merged using the function Rowbind into a single data frame called "tidyData"
5. The mean and standard deviation were extracted  from the bound data sets.
6. Create a logicalVector that contains TRUE values for the ID, mean() & stddev() columns and FALSE for others
7. Extract a subset of the desired columns
8. Use descriptive activity names to name the activities in the data set
9. Merge the finalData set with the acitivityType table to include descriptive activity names
10. Update colNames vector to include the new column names.
11. Appropriately label the data set with descriptive activity names.
12. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
13. Create a new table excluding the column for activityType.
14. Summarizing the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject and calculate the averages.
15. Merge the tidyData with activityType to include descriptive acitvity names.
16. Export the tidyData set using write.table and setting rownames= FALSE.
