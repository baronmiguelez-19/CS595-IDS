# NSL-KDD

## Databases

-**KDDTest-21.txt:** file available online, contains NSL-KDD test data with all the attack types except the 21.

-**KDDTrain+_20Percent.txt:** file available online, contains 20% of NSL-KDD data used to train the classifier.

-**NSLtrain20percent.mat:** contains the data of the 20% of NSL-KDD data file in a table format for MATLAB. Obtained copying the data in a .csv file and using "readtable()".

-**NSLtestDatabase.mat:** contains the data of the test-21 file of NSL-KDD in a table format for MATLAB. Obtained copying the data in a .csv file and using "readtable()".

-**NSLTrain_ExtraColumns.mat:** matlab table that contains the data from the "NSLtrain20percent.mat" labeled and prepared to be used for prediction with two extra columns 
			        for binary and multiclass classifiers. Obtained using "~/src/datasetStatistics.m"

-**NSLTest_ExtraColumns.mat:** matlab table that contains the data from the "NSLtestDatabase.mat" labeled and prepared to be used for prediction with two extra columns for 
		               binary and multiclass classifiers. Obtained using "~/src/datasetStatistics.m". Used as testData in "~/src/evaluatePredictorsKDD.m".

-**NSLTest_ExtraColumns-UnknownFix.mat:** matlab table that contains the data from the "NSLtestDatabase.mat" labeled and prepared to be used for prediction with two extra columns 
			                  for binary and multiclass classifiers with extra unknown attacks. Obtained using "~/src/datasetStatistics.m" Used as testData in "~/src/evaluatePredictorsKDD.m".



## Train and Predict

## Data
- **dataAndModels_NSL.mat :** test data, trained data and all the classifiers obtained with MATLAB - Classification Learner prepared to be used for the NSL-KDD dataset.


- **trainClassifierXXXBin :** code exported from MATLAB - Classification Learner used to train the binary classifier specified in the file name.

- **trainClassifierXXXMulti :** code exported from MATLAB - Classification Learner used to train the multiclass classifier specified in the file name.


## Results

- **NSLTrain_percentage.fig :** MATLAB figure that presents the histogram of the normal/attacks of the KDD 99 database used for training. 

- **NSLTest_percentage.fig :** MATLAB figure that presents the histogram of the normal/attacks of the KDD 99 database used for testing. 

- **ConfXXX.fig :** MATLAB figure with the obtained confusion matrix for the multiclass classifier specified in the file name. 

- **normConfXXX.fig :** MATLAB figure with the obtained normalized confusion matrix for the multiclass classifier specified in the file name. 
 
