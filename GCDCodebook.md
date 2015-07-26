
Title: “Getting and Cleaning Data Assignment Codebook"
Author: “Bassey Orok"
Date: “26 July 2015”


### Project Description
This project involves getting two sets of data from the website(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), cleaning the data sets, merging them and implementing statistical operations on the merged data set to obtain the mean and standard deviation of the extracted data.

###Collection of the raw data
The raw data was obtained from (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and represents data collected from the accelerometers from the Samsung Galaxy S smartphone.


###Creating the tidyData set
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

##Description of variables in the tidyData file

 * Dimensions of the dataset
   - The tidyData has a dimension of 180 rows and 21 columns.
 
The data has the following column names or variables:
 *"activityID" 
 * "subjectID" 
 * "timeBodyAccMagnitudeMean"
 * "timeBodyAccMagnitudeStdDev"
 * "timeGravityAccMagnitudeMean"
 * "timeGravityAccMagnitudeStdDev"
 * "timeBodyAccJerkMagnitudeMean" 
 * "timeBodyAccJerkMagnitudeStdDev"
 * "timeBodyGyroMagnitudeMean"
 * "timeBodyGyroMagnitudeStdDev"
 * "timeBodyGyroJerkMagnitudeMean" 
 * "timeBodyGyroJerkMagnitudeStdDev"
 * "freqBodyAccMagnitudeMean"
 * "freqBodyAccMagnitudeStdDev"
 * "freqBodyAccJerkMagnitudeMean"
 * "freqBodyAccJerkMagnitudeStdDev"
 * "freqBodyGyroMagnitudeMean"
 * "freqBodyGyroMagnitudeStdDev"
 * "freqBodyGyroJerkMagnitudeMean"
 * "freqBodyGyroJerkMagnitudeStdDev"
 * "activityType"

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

activityID - This is the identication number for the activities. There are 6 six different activities.

activityType - The type of activity whoich in this case is either 
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
  
subjectID  - This id the identification number of the subjects under investigation.

The rest of the variables are combinations of different vectors for example, "timeBodyAccMagnitudeMean" and "freqBodyGyroJerkMagnitudeStdDev" etc.
 1. time -  Implies the time measurements
 2. Body -  The body of the subject
 3. Acc - The acceleration
 4. Magnitude - The size of the vector
 5. StdDev - The standard deviation
 6. Mean  - Implies mean
 7. Gravity  - The measuremnent of gravity on the body
 8. Jerk - 
 9. Gyro -  Implies the Gyroscope

*The units of measurements involved in the raw data are t- time, f- frequency which were use to measure body and acceleration signals.

