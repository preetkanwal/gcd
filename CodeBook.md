gcd
===

Getting and Cleaning Data - Course Project
### Data Transformation Steps

Following data transformations are carried out by the 'run_analysis.R' script.

1. Loading the training Dataset (X_train.txt) in R 
2. Loading and binding the training activity label (y_train.txt) to the training dataset
3. Loading and binding the training subject (subject_train.txt) to the training dataset
4. Loading the test dataset (X_test.txt) in R
5. Loading and binding the test activity label (y_test.txt) to the test dataset
6. Loading and binding the test subject (subject_test.txt) to the test dataset
7. Loading activity name (activity_labels.txt) into R
8. Replacing activity labels in the training data set to their specific names
9. Replacing activity labels in the test data set to their specific names 
10. Read features (features.txt) and make the feature names better suited for R with some substitutions
11. Merge training and test sets together to form mergeData dataset
12. filtering feature names that have either Mean or Std
13. adding colums 562 and 563 corrosponding to activity &  subject to reqd columns
14. filtering colums in mergeData corrosponding to reqdCols
15. changing column names of merge data to more descriptive column names
16. Aggregating data by finding the mean of same activities performed by subject
17. Writing the output file through tidy-data.txt


### Variable Descriptions

The data for this data set was derived from sources mentioned in the "Original data" section of this document. Part of the description below has been taken from the original data description.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:
- mean: Mean value
- std: Standard deviation

#### Data Columns

 [1] Activity: Activity being performed
 [2] Subject: Indicates the subject from whom data was collected
 [3] "tBodyAccMeanX"                     
 [4] "tBodyAccMeanY"                     
 [5] "tBodyAccMeanZ"                     
 [6] "tBodyAccStdX"                      
 [7] "tBodyAccStdY"                      
 [8] "tBodyAccStdZ"                      
 [9] "tGravityAccMeanX"                  
[10] "tGravityAccMeanY"                  
[11] "tGravityAccMeanZ"                  
[12] "tGravityAccStdX"                   
[13] "tGravityAccStdY"                   
[14] "tGravityAccStdZ"                   
[15] "tBodyAccJerkMeanX"                 
[16] "tBodyAccJerkMeanY"                 
[17] "tBodyAccJerkMeanZ"                 
[18] "tBodyAccJerkStdX"                  
[19] "tBodyAccJerkStdY"                  
[20] "tBodyAccJerkStdZ"                  
[21] "tBodyGyroMeanX"                    
[22] "tBodyGyroMeanY"                    
[23] "tBodyGyroMeanZ"                    
[24] "tBodyGyroStdX"                     
[25] "tBodyGyroStdY"                     
[26] "tBodyGyroStdZ"                     
[27] "tBodyGyroJerkMeanX"                
[28] "tBodyGyroJerkMeanY"                
[29] "tBodyGyroJerkMeanZ"                
[30] "tBodyGyroJerkStdX"                 
[31] "tBodyGyroJerkStdY"                 
[32] "tBodyGyroJerkStdZ"                 
[33] "tBodyAccMagMean"                   
[34] "tBodyAccMagStd"                    
[35] "tGravityAccMagMean"                
[36] "tGravityAccMagStd"                 
[37] "tBodyAccJerkMagMean"               
[38] "tBodyAccJerkMagStd"                
[39] "tBodyGyroMagMean"                  
[40] "tBodyGyroMagStd"                   
[41] "tBodyGyroJerkMagMean"              
[42] "tBodyGyroJerkMagStd"               
[43] "fBodyAccMeanX"                     
[44] "fBodyAccMeanY"                     
[45] "fBodyAccMeanZ"                     
[46] "fBodyAccStdX"                      
[47] "fBodyAccStdY"                      
[48] "fBodyAccStdZ"                      
[49] "fBodyAccMeanFreqX"                 
[50] "fBodyAccMeanFreqY"                 
[51] "fBodyAccMeanFreqZ"                 
[52] "fBodyAccJerkMeanX"                 
[53] "fBodyAccJerkMeanY"                 
[54] "fBodyAccJerkMeanZ"                 
[55] "fBodyAccJerkStdX"                  
[56] "fBodyAccJerkStdY"                  
[57] "fBodyAccJerkStdZ"                  
[58] "fBodyAccJerkMeanFreqX"             
[59] "fBodyAccJerkMeanFreqY"             
[60] "fBodyAccJerkMeanFreqZ"             
[61] "fBodyGyroMeanX"                    
[62] "fBodyGyroMeanY"                    
[63] "fBodyGyroMeanZ"                    
[64] "fBodyGyroStdX"                     
[65] "fBodyGyroStdY"                     
[66] "fBodyGyroStdZ"                     
[67] "fBodyGyroMeanFreqX"                
[68] "fBodyGyroMeanFreqY"                
[69] "fBodyGyroMeanFreqZ"                
[70] "fBodyAccMagMean"                   
[71] "fBodyAccMagStd"                    
[72] "fBodyAccMagMeanFreq"               
[73] "fBodyBodyAccJerkMagMean"           
[74] "fBodyBodyAccJerkMagStd"            
[75] "fBodyBodyAccJerkMagMeanFreq"       
[76] "fBodyBodyGyroMagMean"              
[77] "fBodyBodyGyroMagStd"               
[78] "fBodyBodyGyroMagMeanFreq"          
[79] "fBodyBodyGyroJerkMagMean"          
[80] "fBodyBodyGyroJerkMagStd"           
[81] "fBodyBodyGyroJerkMagMeanFreq"      
[82] "angletBodyAccMean,gravity"         
[83] "angletBodyAccJerkMean,gravityMean" 
[84] "angletBodyGyroMean,gravityMean"    
[85] "angletBodyGyroJerkMean,gravityMean"
[86] "angleX,gravityMean"                
[87] "angleY,gravityMean"                
[88] "angleZ,gravityMean"
