%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: CS595 - Final Project
% Purpose: Predictors Evaluation
% Authors: Anna Baron Garcia, Noemi Miguelez Gomez
%
% Input:   -dataModels: test and train databases and 6 trained models
% Outputs: -Classifier metrics: metrics of the performance of the
%          classifier displayed on workspace.
%          -Confusion colormaps: plots of confusion matrices and normalized
%          confusion matrices of the multiclass classifiers analysed. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Load main variables to the workspace: 
%Trained/Test Data, Predictor Models for Binary and Multiclass
%dataModels = 'dataAndModels_KDD.mat';
dataModels = 'dataAndModels_NSL.mat';
load(dataModels);

%Check type of database (KDD or NSL)
%Get size of the dataset
[dRows,dCols] = size(testData);
instances = dRows;

%Prepare target data and test data
inputTest = testData(:,1:41);

if (dCols == 44)
    %For KDD:
    binTarget = table2array(testData(:,43));
    multiTarget = table2array(testData(:,44));
else
    %For NSL:
    binTarget = double(table2array(testData(:,44)));
    multiTarget = double(table2array(testData(:,45)));
end

%%
%------------------TREE FINE PREDICTOR------------------
%---BINARY---
disp('DECISION TREE FINE - RESULTS')
disp('BINARY')
%Use the trained model to predict the class of the test input data
resTreeBin = double(trainedModelTreeFineBin.predictFcn(inputTest));

%Compute the confusion matrix of the results
CMTreeBin = confusionmat(binTarget, resTreeBin);

%Compute accuracy, precision, recall and f1-score
AccuracyTreeBin = 100*sum(diag(CMTreeBin))/sum(sum(CMTreeBin));
PrecisionTreeBin = 100*CMTreeBin(2,2)/(CMTreeBin(2,2)+CMTreeBin(1,2));
RecallTreeBin = 100*CMTreeBin(2,2)/(CMTreeBin(2,2)+CMTreeBin(2,1));
F1TreeBin = 2*1/((1/PrecisionTreeBin)+(1/RecallTreeBin));

%Display Results
str = ['Predictor Accuracy: ', num2str(AccuracyTreeBin), newline, 'Precision: ', num2str(PrecisionTreeBin), newline, ...
    'Recall: ', num2str(RecallTreeBin), newline, 'F1-Score: ', num2str(F1TreeBin), newline, 'Confusion Matrix: '];
disp(str)
disp(num2str(CMTreeBin))
fprintf('\n')


%---MULTICLASS---
disp('MULTICLASS')
%Use the trained model to predict the class of the test input data
resTreeMulti = double(trainedModelTreeFineMulti.predictFcn(inputTest));

%Compute the confusion matrix and normalized confusion matrix of the results
CMTreeMulti = confusionmat(multiTarget, resTreeMulti);
figure;
imagesc(CMTreeMulti);
title('Confusion Matrix Tree Fine Multiclass');
drawnow;

normCMTreeMulti = CMTreeMulti./sum(CMTreeMulti,2);
figure;
imagesc(normCMTreeMulti);
title('Normalized Confusion Tree Fine Multiclass');
drawnow;

%Compute accuracy of the predictor
AccuracyTreeMulti = 100*sum(diag(CMTreeMulti))/sum(sum(CMTreeMulti));

%Display Results
str = ['Predictor Accuracy: ', num2str(AccuracyTreeMulti), newline, 'Confusion Matrix: '];
disp(str)
disp(num2str(CMTreeMulti))
disp('Normalized Confusion Matrix: ')
disp(num2str(normCMTreeMulti));
fprintf('\n')
%%
%------------------KNN FINE PREDICTOR------------------
disp('KNN FINE - RESULTS')
%---BINARY---
disp('BINARY')
%Use the trained model to predict the class of the test input data
resKNNBin = double(trainedModelKNNFineBin.predictFcn(inputTest));

%Compute the confusion matrix of the results
CMKNNBin = confusionmat(binTarget, resKNNBin);

%Compute accuracy, precision, recall and f1-score
AccuracyKNNBin = 100*sum(diag(CMKNNBin))/sum(sum(CMKNNBin));
PrecisionKNNBin = 100*CMKNNBin(2,2)/(CMKNNBin(2,2)+CMKNNBin(1,2));
RecallKNNBin = 100*CMKNNBin(2,2)/(CMKNNBin(2,2)+CMKNNBin(2,1));
F1KNNBin = 2*1/((1/PrecisionKNNBin)+(1/RecallKNNBin));

%Display Results
str = ['Predictor Accuracy: ', num2str(AccuracyKNNBin), newline, 'Precision: ', num2str(PrecisionKNNBin), newline, ...
    'Recall: ', num2str(RecallKNNBin), newline, 'F1-Score: ', num2str(F1KNNBin), newline, 'Confusion Matrix: '];
disp(str)
disp(num2str(CMKNNBin))
fprintf('\n')


%---MULTICLASS---
disp('MULTICLASS')
%Use the trained model to predict the class of the test input data
resKNNMulti = double(trainedModelKNNFineMulti.predictFcn(inputTest));

%Compute the confusion matrix and normalized confusion matrix of the results
CMKNNMulti = confusionmat(multiTarget, resKNNMulti);
figure;
imagesc(CMKNNMulti);
title('Confusion Matrix KNN Fine Multiclass');
drawnow;

normCMKNNMulti = CMKNNMulti./sum(CMKNNMulti,2);
figure;
imagesc(normCMKNNMulti);
title('Normalized Confusion Matrix KNN Fine Multiclass');
drawnow;

%Compute accuracy of the predictor
AccuracyKNNMulti = 100*sum(diag(CMKNNMulti))/sum(sum(CMKNNMulti));

%Display Results
str = ['Predictor Accuracy: ', num2str(AccuracyKNNMulti), newline, 'Confusion Matrix: '];
disp(str)
disp(num2str(CMKNNMulti))
disp('Normalized Confusion Matrix: ')
disp(num2str(normCMKNNMulti));
fprintf('\n')

%%
%------------------SVM LINEAR PREDICTOR------------------
disp('SVM LINEAR - RESULTS')
%---BINARY---
disp('BINARY')
%Use the trained model to predict the class of the test input data
resSVMBin = double(trainedModelSVMBin.predictFcn(inputTest));

%Compute the confusion matrix of the results
CMSVMBin = confusionmat(binTarget, resSVMBin);

%Compute accuracy, precision, recall and f1-score
AccuracySVMBin = 100*sum(diag(CMSVMBin))/sum(sum(CMSVMBin));
PrecisionSVMBin = 100*CMSVMBin(2,2)/(CMSVMBin(2,2)+CMSVMBin(1,2));
RecallSVMBin = 100*CMSVMBin(2,2)/(CMSVMBin(2,2)+CMSVMBin(2,1));
F1SVMBin = 2*1/((1/PrecisionSVMBin)+(1/RecallSVMBin));

%Display Results
str = ['Predictor Accuracy: ', num2str(AccuracySVMBin), newline, 'Precision: ', num2str(PrecisionSVMBin), newline, ...
    'Recall: ', num2str(RecallSVMBin), newline, 'F1-Score: ', num2str(F1SVMBin), newline, 'Confusion Matrix: '];
disp(str)
disp(num2str(CMSVMBin))
fprintf('\n')


%---MULTICLASS---
disp('MULTICLASS')
%Use the trained model to predict the class of the test input data
resSVMMulti = double(trainedModelSVMMulti.predictFcn(inputTest));

%Compute the confusion matrix and normalized confusion matrix of the results
CMSVMMulti = confusionmat(multiTarget, resSVMMulti);
figure;
imagesc(CMSVMMulti);
drawnow;
title('Confusion Matrix SVM Linear Multiclass');

normCMSVMMulti = CMSVMMulti./sum(CMSVMMulti,2);
figure;
imagesc(normCMSVMMulti);
title('Normalized Confusion Matrix SVM Linear Multiclass');
drawnow;

%Compute accuracy of the predictor
AccuracySVMMulti = 100*sum(diag(CMSVMMulti))/sum(sum(CMSVMMulti));

%Display Results
str = ['Predictor Accuracy: ', num2str(AccuracySVMMulti), newline, 'Confusion Matrix: '];
disp(str)
disp(num2str(CMSVMMulti))
disp('Normalized Confusion Matrix: ')
disp(num2str(normCMSVMMulti));
fprintf('\n')
