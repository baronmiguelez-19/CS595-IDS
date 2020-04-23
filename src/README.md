# src

 - **createKDDTrainTestDatasets.m :** generates training table with 1% of the data of the KDD 99 dataset for faster training and testing. Generates test table with instances not used in the training dataset. 
 
 - **datasetStatistics.m :** prepares tables from datasets to be trained and tested Generates tables with two extra columns for binary and multiclass classification and displays the dataset shape (number of instances and percentage of normal/attacks instances). 
 
 - **evaluatePredictors.m :** uses trained models and test data to evaluate the performance of the classifiers and displays their metrics and confusion matrices. 
