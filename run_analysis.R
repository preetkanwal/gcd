#loading the training dataset into R
training <- read.table("./train/X_train.txt", sep = "")

#loading training activity label as factors
trainLabel <- read.table("./train/y_train.txt", sep = "", colClasses = "factor")

#binding the training activity label to the training dataset
training[,562] <- trainLabel

trainSubject <- read.table("./train/subject_train.txt", sep = "", colClasses = "factor")
#binding the training subject label to the dataset
training[,563] <- trainSubject

#loading the test dataset into R
test <- read.table("./test/X_test.txt", sep = "")

#loading test activity labels as factors
testLabel <- read.table("./test/y_test.txt", sep = "", colClasses = "factor")

#binding the test activity label to the test dataset
test[,562] <- testLabel

testSubject <- read.table("./test/subject_test.txt", sep = "", colClasses = "factor")

#binding the test subject label to the dataset
test[,563] <- testSubject

#Loading Activity-Name to Labels into R
activityLabels <- read.table("./activity_labels.txt",sep = "")

#Replacing activity labels in the training data set to their specific names 
levels(training$V1.1) <- activityLabels$V2

#Replacing activity labels in the test data set to their specific names 
levels(test$V1.1) <- activityLabels$V2

# Read features and make the feature names better suited for R with some substitutions
features = read.table("./features.txt", sep="", col.names = c("measureID", "measureName"))
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Merge training and test sets together
mergeData = rbind(training, test)

#filtering feature names that have either Mean or Std
reqdCols <- grep(".*Mean.*|.*Std.*", features[,2])
features <- features[reqdCols,]

#adding colums 562 and 563 corrosponding to activity &  subject to reqd columns
reqdCols <- c(reqdCols, 562, 563)

#filtering colums in mergeData corrosponding to reqdCols
mergeData <- mergeData[,reqdCols]

#changing column names of merge data to more descriptive column names
colnames(mergeData) <- c(features$measureName, "Activity", "Subject")



tidyData <- aggregate(mergeData, by = list(Activity = mergeData$Activity, Subject = mergeData$Subject), mean)
tidyData[,90] = NULL
tidyData[,89] = NULL

write.table(tidyData, "tidy-data.txt", sep="\t", row.name=FALSE)
