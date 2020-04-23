# CS595 - Artifical Intelligence - Intrusion Detection System

This repository includes the different databases and scripts used to develop and analyse a set of classifiers for an intrusion detection system. To obtain the trained models/classifiers, MATLAB - Classification Learner App is used.

### Docs

 - **AttackTypes.csv :** types of attacks considered in the databases for classification.
 - **Field Names.csv :** field names of the different columns of the databases considered for classification.*
 
### KDD 99

 - **Databases :** files for the databases used/prepared for the KDD 99 dastabase analysis.
 - **Train and Predict :** data used for training, models obtained from MATLAB - Classification Learner, and some results for KDD 99.  
 
### NSL-KDD

 - **Databases :** files for the databases used/prepared for the NSL-KDD dastabase analysis.
 - **Train and Predict :** data used for training, models obtained from MATLAB - Classification Learner, and some results for NSL-KDD.  
 
## src
 - **BarPlotErrorbars.m :** generates barplots with errorbars, fully customizable.

## demo
 - **dataAndModels_KDD.mat :** test data, trained data and all the classifiers obtained with MATLAB - Classification Learner prepared to be used for the KDD 99 dataset.
 - **dataAndModels_NSL.mat :** test data, trained data and all the classifiers obtained with MATLAB - Classification Learner prepared to be used for the NSL-KDD dataset.
 - **evaluatePredictors.m :** code prepared to evaluate the predictor and extract its metrics, using the input data loaded from the previous "dataAndModels_*.mat" files.
