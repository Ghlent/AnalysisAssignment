# Study design

Data comes from the study "Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013." and was collected by downloading it from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

# Code book

[Original data (information extracted from the README.txt, features_info and activity_labels.txt)]

Subject: identifies the subject who performed the activity. Its range is from 1 to 30. 

Activities: links the class labels with their activity name. Its range is from 1 to 6 and corresponds to:
  1 WALKING.
  2 WALKING_UPSTAIRS.
  3 WALKING_DOWNSTAIRS.
  4 SITTING.
  5 STANDING.
  6 LAYING. 

Features: the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Features are normalized and bounded within {-1,1}.

The different components that describe a feature, grouped by alternatives, are:

  t: signals captured over time at 50 Hz.
  f: signals converted by a Fast Fourier Transformation.

  Body: part of the aceleration signal correspondent to the movement of the body.
  Gravity: part of the aceleration signal correspondent to the effect of gravity.

  Acc: linear acceleration measured with accelerometer.
  Gyro: angular velocity measured with gyroscope.

  Jerk: change of accelaration calculated using body linear accelaration and angular velocity in time.
  Mag: magnitude of the signals calculated using the Euclidean norm.
  JerkMag: magnitud of the jerk calculated using the Euclidean norm.

  -XYZ: 3-axial signals in the X, Y and Z directions.
  
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

[]
