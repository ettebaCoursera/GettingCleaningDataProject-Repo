library(dplyr)

# Step 1. Read in data for the train and test sets

## Read in train data
activityType <- read.table("./activity_labels.txt")
xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")
subjecttrain <- read.table("./train/subject_train.txt")
features <- read.table("./features.txt")

## Read in test data

xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/y_test.txt")
subjecttest <- read.table("./test/subject_test.txt")

# Assign col names to train data
colnames(activityType)  <-  c('activityID','activityType')
colnames(subjecttrain)  <-  "subjectID"
colnames(xtrain)        <- features[,2]
colnames(ytrain)        <- "activityID"

# Assign col names to test data
colnames(subjecttest) <- "subjectID"
colnames(xtest)      <- features[,2]
colnames(ytest)      <- "activityID"

# Merge yTrain, subjectTrain and xTrain to create trainingData
trainingData <- cbind(ytrain,subjecttrain,xtrain)

# Merge yTest, subjectTest and xTest to create trainingData
testData <- cbind(ytest,subjecttest,xtest)

# Row bind trainingData and testData data sets

finalData <- rbind(trainingData,testData)

# Step 2. Extract only mean and standard deviation measurements

# Using the finalData, create a vector for the column names for selecting the columns for mean and standard deviation.
colNames  = colnames(finalData)


# Create a logicalVector that contains TRUE values for the ID, mean() & stddev() columns and FALSE for others
logicalVector <- (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames))

# Extract a subset of the desired columns
finalData <- finalData[logicalVector==TRUE]

# Step 3. Use descriptive activity names to name the activities in the data set

# Merge the finalData set with the acitivityType table to include descriptive activity names
finalData <- merge(finalData,activityType,by="activityID",all.x=TRUE)

# Update colNames vector to include the new column names.
colNames  <- colnames(finalData)


# Step 4. Appropriately label the data set with descriptive activity names.

# Properly name the variable names
for (i in 1:length(colNames))
{
    colNames[i] = gsub("\\()","",colNames[i])
    colNames[i] = gsub("-std","StdDev",colNames[i])
    colNames[i] = gsub("-mean","Mean",colNames[i])
    colNames[i] = gsub("^(t)","time",colNames[i])
    colNames[i] = gsub("^(f)","freq",colNames[i])
    colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
    colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
    colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
    colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
    colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
    colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
    colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
}

# Rename the finalData set with the new descriptive colNames.
colnames(finalData) <- colNames

# Step 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

# Create a new table, finalDataNoActivityType without the activityType column
activitytype_nil <- finalData[,names(finalData) != "activityType"]

# Summarizing the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject
tidyData_averages    <- aggregate(activitytype_nil[,names(activitytype_nil) != c("activityID","subjectID")],by=list(activityID=activitytype_nil$activityID,subjectID = activitytype_nil$subjectID),mean)

# Merge the tidyData with activityType to include descriptive acitvity names
tidyData_averages    <- merge(tidyData_averages,activityType,by="activityID",all.x=TRUE)

# Export the tidyData set
write.table(tidyData_averages, "./tidyData_averages.txt",row.names=FALSE,sep="\t")