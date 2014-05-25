### Data


The data for the script was downloaded from <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> The database is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

For each record the following information is provided

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The data is separated into a teaining set and a testing set with 70% of the observations in the training set.

The structure of the dataset is:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all measurements. The list of values in the feature.txt file is used to set up the variable names of both the train and the test dataset.

- 'activity_labels.txt': Links the class labels with their activity name. The activity_labels is joined with the "y_test.txt" and "y_train.txt" which are both joined with "X_train.txt" and "X_test.txt".

- 'train/X_train.txt': Training set. Test set containing the measurements of all variables. The test set is merged with the train set to get the full list of observations.

- 'train/y_train.txt': Training labels. Contains an identifier of the activity performed by the subject. "y_train.txt" is merged with "X_train.txt" and with "activity_labels.txt"

- 'test/X_test.txt': Test set containing the measurements of all variables. The test set is merged with the train set to get the full list of observations.

- 'test/y_test.txt': Test labels. Contains an identifier of the activity performed by the subject. "y_test.txt" is merged with "X_train.txt" and with "activity_labels.txt"




### Data Transformations



The following transformations were performed on the initial datasets in order to derive the resulting dataset.

- Reading the test files

"UCI HAR Dataset/test/X_test.txt"

"UCI HAR Dataset/test/Y_test.txt"

"UCI HAR Dataset/test/subject_test.txt"

- Reading the variable names from the "UCI HAR Dataset/features.txt" file

- Reading the train files

"UCI HAR Dataset/train/X_train.txt"

"UCI HAR Dataset/train/Y_train.txt"

"UCI HAR Dataset/train/subject_train.txt"

- Building the combined dataset

The combined dataset is built by merging the train and the test dataset.

- Replacing the activity numbers with activity name

Merging the activity and the combined dataset based on activity id.

- Setting the new var names

Changing the variable names by using the list of variable names provided in the file "UCI HAR Dataset/features.txt". The variable names are changed to lowercase and the following symbols are removed: "(", ")" and ".".

- Extracts the column id of all columns that are representing mean and standard deviation values

This steps removes all the columns which are not measuring mean and standard deviation. this result in a dataset with 89 variables including the "subject", "activitydesc" and "activity". 

 - Buidling the new dataset with mean values of every variable grouped by subject and activity
 
 For the final transformation of the dataset, the dataset was grouped by the subject and activitydesc and the mean value in every group is calclated for the rest of the variables. The resulting dataset is printed to a file "result.pdf".

### Variables

There are 10,299 number of instances with 561 attributes in both the train and test dataset before the script is executed.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
  These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag



The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


After the execution of the "run_analysis.R" script, the new dataset contains the following variables:

  
  Variable  | Type   | Values   | Description
  :-------: | :----: | :------: | :----------:
  subject   | Numerical| Between 1 and |Id of the person being measured     
  activitydesc| String| "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" "STANDING" "LAYING"|Type of activity performed by the subject
  tbodyaccmeanx|Numerical| Between -1 and 1| *Please see description below*               
  tbodyaccmeany|Numerical| Between -1 and 1| *Please see description below*
  tbodyaccmeanz| Numerical| Between -1 and 1|*Please see description below*
  tbodyaccstdx|  Numerical| Between -1 and 1|*Please see description below*
  tbodyaccstdy|Numerical| Between -1 and 1|*Please see description below*
  tbodyaccstdz|Numerical| Between -1 and 1|*Please see description below*
  tgravityaccmeanx|Numerical| Between -1 and 1|*Please see description below*
  tgravityaccmeany|Numerical| Between -1 and 1|*Please see description below*
  tgravityaccmeanz|Numerical  | Between -1 and 1|*Please see description below*
  tgravityaccstdx|Numerical   | Between -1 and 1|*Please see description below*
  tgravityaccstdy|Numerical  | Between -1 and 1|*Please see description below*
  tgravityaccstdz|Numerical| Between -1 and 1|*Please see description below*
  tbodyaccjerkmeanx|Numerical| Between -1 and 1|*Please see description below*
  tbodyaccjerkmeany|Numerical| Between -1 and 1|*Please see description below*
  tbodyaccjerkmeanz|Numerical | Between -1 and 1|*Please see description below*
  tbodyaccjerkstdx|Numerical  | Between -1 and 1|*Please see description below*
  tbodyaccjerkstdy|Numerical  | Between -1 and 1|*Please see description below*
  tbodyaccjerkstdz|Numerical   | Between -1 and 1|*Please see description below*
  tbodygyromeanx|Numerical   | Between -1 and 1|*Please see description below*
  tbodygyromeany|Numerical   | Between -1 and 1|*Please see description below*
  tbodygyromeanz|Numerical   | Between -1 and 1|*Please see description below*
  tbodygyrostdx|Numerical    | Between -1 and 1|*Please see description below*
  tbodygyrostdy|Numerical    | Between -1 and 1|*Please see description below*
  tbodygyrostdz|Numerical | Between -1 and 1|*Please see description below*
  tbodygyrojerkmeanx|Numerical| Between -1 and 1|*Please see description below*
  tbodygyrojerkmeany|Numerical | Between -1 and 1|*Please see description below*
  tbodygyrojerkmeanz|Numerical  | Between -1 and 1|*Please see description below*
  tbodygyrojerkstdx|Numerical| Between -1 and 1|*Please see description below*
  tbodygyrojerkstdy|Numerical | Between -1 and 1|*Please see description below*
  tbodygyrojerkstdz|Numerical| Between -1 and 1|*Please see description below*
  tbodyaccmagmean|Numerical| Between -1 and 1|*Please see description below*
  tbodyaccmagstd|Numerical   | Between -1 and 1|*Please see description below*
  tgravityaccmagmean|Numerical| Between -1 and 1|*Please see description below*
  tgravityaccmagstd|Numerical   | Between -1 and 1|*Please see description below*
  tbodyaccjerkmagmean|Numerical | Between -1 and 1|*Please see description below*
  tbodyaccjerkmagstd|Numerical| Between -1 and 1|*Please see description below*
  tbodygyromagmean|Numerical  | Between -1 and 1|*Please see description below*
  tbodygyromagstd|Numerical| Between -1 and 1|*Please see description below*
  tbodygyrojerkmagmean|Numerical | Between -1 and 1|*Please see description below*
  tbodygyrojerkmagstd|Numerical | Between -1 and 1|*Please see description below*
  fbodyaccmeanx|Numerical| Between -1 and 1|*Please see description below*
  fbodyaccmeany|Numerical  | Between -1 and 1|*Please see description below*
  fbodyaccmeanz|Numerical  | Between -1 and 1|*Please see description below*
  fbodyaccstdx|Numerical   | Between -1 and 1|*Please see description below*
  fbodyaccstdy|Numerical  | Between -1 and 1|*Please see description below*
  fbodyaccstdz|Numerical  | Between -1 and 1|*Please see description below*
  fbodyaccmeanfreqx|Numerical  | Between -1 and 1|*Please see description below*
  fbodyaccmeanfreqy|Numerical  | Between -1 and 1|*Please see description below*
  fbodyaccmeanfreqz|Numerical| Between -1 and 1|*Please see description below*
  fbodyaccjerkmeanx|Numerical | Between -1 and 1|*Please see description below*
  fbodyaccjerkmeany|Numerical     | Between -1 and 1|*Please see description below*
  fbodyaccjerkmeanz|Numerical     | Between -1 and 1|*Please see description below*
  fbodyaccjerkstdx|Numerical     | Between -1 and 1|*Please see description below*
  fbodyaccjerkstdy|Numerical   | Between -1 and 1|*Please see description below*
  fbodyaccjerkstdz|Numerical    | Between -1 and 1|*Please see description below*
  fbodyaccjerkmeanfreqx|Numerical | Between -1 and 1|*Please see description below*
  fbodyaccjerkmeanfreqy|Numerical| Between -1 and 1|*Please see description below*
  fbodyaccjerkmeanfreqz|Numerical| Between -1 and 1|*Please see description below*
  fbodygyromeanx|Numerical      | Between -1 and 1|*Please see description below*
  fbodygyromeany|Numerical         | Between -1 and 1|*Please see description below*
  fbodygyromeanz|Numerical | Between -1 and 1|*Please see description below*
  fbodygyrostdx|Numerical  | Between -1 and 1|*Please see description below*
  fbodygyrostdy|Numerical  | Between -1 and 1|*Please see description below*
  fbodygyrostdz|Numerical  | Between -1 and 1|*Please see description below*
  fbodygyromeanfreqx|Numerical| Between -1 and 1|*Please see description below*
  fbodygyromeanfreqy|Numerical | Between -1 and 1|*Please see description below*
  fbodygyromeanfreqz|Numerical  | Between -1 and 1|*Please see description below*
  fbodyaccmagmean|Numerical    | Between -1 and 1|*Please see description below*
  fbodyaccmagstd|Numerical  | Between -1 and 1|*Please see description below*
  fbodyaccmagmeanfreq|Numerical   | Between -1 and 1|*Please see description below*
  fbodybodyaccjerkmagmean|Numerical| Between -1 and 1|*Please see description below*
  fbodybodyaccjerkmagstd|Numerical | Between -1 and 1|*Please see description below*
  fbodybodyaccjerkmagmeanfreq|Numerical| Between -1 and 1|*Please see description below*
  fbodybodygyromagmean|Numerical | Between -1 and 1|*Please see description below*
  fbodybodygyromagstd|Numerical | Between -1 and 1|*Please see description below*
  fbodybodygyromagmeanfreq|Numerical | Between -1 and 1|*Please see description below*
  fbodybodygyrojerkmagmean|Numerical| Between -1 and 1|*Please see description below*
  fbodybodygyrojerkmagstd|Numerical| Between -1 and 1|*Please see description below*
  fbodybodygyrojerkmagmeanfreq|Numerical| Between -1 and 1|*Please see description below*
  angletbodyaccmeangravity|Numerical| Between -1 and 1|*Please see description below*
  angletbodyaccjerkmeangravitymean|Numerical| Between -1 and 1|*Please see description below*
  angletbodygyromeangravitymean|Numerical| Between -1 and 1|*Please see description below*
  angletbodygyrojerkmeangravitymean|Numerical| Between -1 and 1|*Please see description below*
  anglexgravitymean|Numerical | Between -1 and 1|*Please see description below*
  angleygravitymean|Numerical | Between -1 and 1|*Please see description below*
  anglezgravitymean|Numerical| Between -1 and 1|*Please see description below*
  
  **Description of variables:**
  
The variables left in the final dataset are selected from the initial set of variables available in the train and test datasets. All variables which represent mean and standard deviation values were selected from the original dataset. In addition the variables were grouped by subject and activity and the mean value of each variable from each group was calculated. This reduced the initial 10,299 instances to 180 instances.

