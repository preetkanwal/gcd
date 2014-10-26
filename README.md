gcd
===

Getting and Cleaning Data - Course Project
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
