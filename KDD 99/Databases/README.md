# Databases

- **kddcup.data_10_percent.gz:** file available online, contains 10% of the original KDD CUP database.

- **KDDCUP10percent.mat:** contains the data of the 10% KDD CUP database file in a table format for MATLAB. Obtained copying the data in a .csv file and using "readtable()".

- **KDD_TrainSet.mat:** matlab table that contains only 1% of the original KDD CUP database - created from presvious 10%. Obtained using "~/src/createKDDTrainTestDatasets.m"

- **KDD_TestSet.mat:** matlab table that contains a test database created from the data not used from the 10% database. Obtained using "~/src/createKDDTrainTestDatasets.m"

- **KDDTrain_ExtraColumns.mat:** matlab table that contains the data from the "KDD_TrainSet.mat" labeled and prepared to be trained with two extra columns for binary and multiclass classifiers. Obtained using ~/src/datasetStatistics.m.

- **KDDTest_ExtraColumns.mat:** matlab table that contains the data from the "KDD_TestSet.mat" labeled and prepared to be used for prediction with two extra columns for binary and multiclass classifiers. Obtained using "~/src/datasetStatistics.m". Used as testData in "~/src/evaluatePredictors.m".
