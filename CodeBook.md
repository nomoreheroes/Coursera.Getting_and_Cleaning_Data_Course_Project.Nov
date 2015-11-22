#Getting and Cleaning Data Course Project
###Andrey Mossakovsky

##Description
This code book describes the variables, the data and the transformations that has been performed to clean up the data.

##Source data
* A full description of the data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The source data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data contained in these files:
* features.txt contains the list of variables' names 
* activity_labels.txt contains the list of pairs (an identifier of activity => a label of activity)
* subject_train.txt contains the list of identifiers of the subjects participating in the experiment (while generating the training data)
* x_train.txt contains the results of the measurement variables, obtained at the training stage
* y_train.txt contains the list of activities, performed by the subjects while generating the training data
* subject_test.txt contains the list of identifiers of the subjects participating in the experiment (while generating the test data)
* x_test.txt contains the results of the measurement variables, obtained at the testing stage
* y_test.txt contains the list of activities, performed by the subjects while generating the test data

##Objectives
* To merge the training and the test sets to create one data set
* To extract only the measurements on the mean and standard deviation for each measurement. 
* To set descriptive activity names to name the activities in the data set
* To label the data set with descriptive variable names. 
* To create an independent tidy data set with the average of each variable for each activity and each subject.

##Transformations
* The script uses the "dplyr" package to aggregate final data
* First, the script loads the "features" vector, containing the variables' names, than filters it to extract only the measurements on the mean and standard deviation and modifies the variables'names for more descriptiveness, using the "gsub" function
* Second, the script loads the following datasets, simultaneously combining the training and the test data: "labels", "activities","subjects" and the main dataset - "init.data". Than it filters the "init.data" by the required variables and sets the variables' names.
* Third, the script merges the following datasets: "subjects", "activities", "init.data" and "labels"
* Fourth, the script groups the merged dataset by subjects and activities
* Fifth, the script creates the tidy data set with the average of each variable for each activity and each subject and saves it as "tidy.data.txt"

##The result dataset

###Identifiers

* Subject - the id of the person, participating in the experiment
* Activity - The label of activity performed 
* Activity.ID - The id of activity performed

###Variables

* TimeBodyAccelerometerMeanX
* TimeBodyAccelerometerMeanY
* TimeBodyAccelerometerMeanZ 
* TimeBodyAccelerometerStdX 
* TimeBodyAccelerometerStdY 
* TimeBodyAccelerometerStdZ 
* TimeGravityAccelerometerMeanX 
* TimeGravityAccelerometerMeanY 
* TimeGravityAccelerometerMeanZ
* TimeGravityAccelerometerStdX 
* TimeGravityAccelerometerStdY 
* TimeGravityAccelerometerStdZ 
* TimeBodyAccelerometerJerkMeanX 
* TimeBodyAccelerometerJerkMeanY 
* TimeBodyAccelerometerJerkMeanZ 
* TimeBodyAccelerometerJerkStdX 
* TimeBodyAccelerometerJerkStdY 
* TimeBodyAccelerometerJerkStdZ 
* TimeBodyGyroMeanX 
* TimeBodyGyroMeanY 
* TimeBodyGyroMeanZ 
* TimeBodyGyroStdX 
* TimeBodyGyroStdY 
* TimeBodyGyroStdZ 
* TimeBodyGyroJerkMeanX 
* TimeBodyGyroJerkMeanY 
* TimeBodyGyroJerkMeanZ 
* TimeBodyGyroJerkStdX 
* TimeBodyGyroJerkStdY 
* TimeBodyGyroJerkStdZ 
* TimeBodyAccelerometerMagnitudeMean 
* TimeBodyAccelerometerMagnitudeStd 
* TimeGravityAccelerometerMagnitudeMean 
* TimeGravityAccelerometerMagnitudeStd 
* TimeBodyAccelerometerJerkMagnitudeMean 
* TimeBodyAccelerometerJerkMagnitudeStd 
* TimeBodyGyroMagnitudeMean 
* TimeBodyGyroMagnitudeStd 
* TimeBodyGyroJerkMagnitudeMean 
* TimeBodyGyroJerkMagnitudeStd 
* FrequencyBodyAccelerometerMeanX 
* FrequencyBodyAccelerometerMeanY 
* FrequencyBodyAccelerometerMeanZ 
* FrequencyBodyAccelerometerStdX 
* FrequencyBodyAccelerometerStdY 
* FrequencyBodyAccelerometerStdZ 
* FrequencyBodyAccelerometerMeanFreqX 
* FrequencyBodyAccelerometerMeanFreqY 
* FrequencyBodyAccelerometerMeanFreqZ 
* FrequencyBodyAccelerometerJerkMeanX 
* FrequencyBodyAccelerometerJerkMeanY 
* FrequencyBodyAccelerometerJerkMeanZ 
* FrequencyBodyAccelerometerJerkStdX 
* FrequencyBodyAccelerometerJerkStdY 
* FrequencyBodyAccelerometerJerkStdZ 
* FrequencyBodyAccelerometerJerkMeanFreqX 
* FrequencyBodyAccelerometerJerkMeanFreqY 
* FrequencyBodyAccelerometerJerkMeanFreqZ 
* FrequencyBodyGyroMeanX 
* FrequencyBodyGyroMeanY 
* FrequencyBodyGyroMeanZ 
* FrequencyBodyGyroStdX 
* FrequencyBodyGyroStdY 
* FrequencyBodyGyroStdZ 
* FrequencyBodyGyroMeanFreqX 
* FrequencyBodyGyroMeanFreqY 
* FrequencyBodyGyroMeanFreqZ 
* FrequencyBodyAccelerometerMagnitudeMean 
* FrequencyBodyAccelerometerMagnitudeStd 
* FrequencyBodyAccelerometerMagnitudeMeanFreq 
* FrequencyBodyAccelerometerJerkMagnitudeMean 
* FrequencyBodyAccelerometerJerkMagnitudeStd 
* FrequencyBodyAccelerometerJerkMagnitudeMeanFreq 
* FrequencyBodyGyroMagnitudeMean 
* FrequencyBodyGyroMagnitudeStd 
* FrequencyBodyGyroMagnitudeMeanFreq 
* FrequencyBodyGyroJerkMagnitudeMean 
* FrequencyBodyGyroJerkMagnitudeStd 
* FrequencyBodyGyroJerkMagnitudeMeanFreq




