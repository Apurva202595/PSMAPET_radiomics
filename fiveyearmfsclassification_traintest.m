function [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% Returns a trained classifier and its accuracy. This code recreates the
% classification model trained in Classification Learner app.
%
%  Input:
%      trainingData: A table containing the same predictor and response
%       columns as those imported into the app.
%
%
%  Output:
%      trainedClassifier: A struct containing the trained classifier. The
%       struct contains various fields with information about the trained
%       classifier.
%
%      trainedClassifier.predictFcn: A function to make predictions on new
%       data.
%
%      validationAccuracy: A double representing the validation accuracy as
%       a percentage. In the app, the Models pane displays the validation
%       accuracy for each model.
%

% To train a classifier trained with the train data T1 (imbalance corrected)
% enter:
%   [trainedClassifier, validationAccuracy] = trainClassifier(T1)
%
% To make predictions with the returned 'trainedClassifier' on original test data T2,
% use
%   [yfit,scores] = trainedClassifier.predictFcn(T2)
%
% T2 is a table containing the same predictor columns as used
% during training. 

% To input test data set T2, we use the GUI tab Import- 'Test data'
% Test set results can be viewed from the 'Confusion Matrix (Test)' tab
% Compute sensitivity, specificity and AUC values from the confusion
% matrix.

% For supervised feature selection, Model 1 used the top 12 features ranked
% by MDA from clinical, ring and weighted GTVp/GTVn radiomics.
% For supervised feature selection, Model 2 used the top 12 MDA-ranked
% features from clinical and primary tumor, ring radiomics.
% For unsupervised feature selection, Model 1 used the top 12
% highest-variance features from clinical, ring and weighted GTVp/GTVn
% radiomics.
% For unsupervised feature selection, Model 2 used the top 12
% highest-variance features from clinical and primary tumor, ring
% radiomics.
% Model 3 across all feature selection types was built using clinical
% variables (age, Gleason score, iPSA, PSA-relapse).