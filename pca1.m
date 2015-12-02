%% Principal Component Analysis 1
%% this is a template using PCA and SVM
% Created on 1st December by Yixing
% Last Modified on 1st December

% concatenate num training samples tp a row
num  = 60;
act1 = action_resize(action1, num);
act2 = action_resize(action2, num);
act3 = action_resize(action3, num);
act4 = action_resize(action4, num);
act = [act1; act2; act3; act4];

[feature_space, training_matrix] = pca(act);
training_label = [ones(size(act1,1),1); 2*ones(size(act2,1),1); 3*ones(size(act3,1),1);4*ones(size(act4,1),1)];

% add path to use the SVM library
addpath('liblinear-2.1/matlab')
svm_model = train(training_label, sparse(training_matrix),'-s 2');

% in principle we should seperate training set and testing set
testing_label = training_label;
testing_matrix = training_matrix;
[predicted_label] = predict(training_label, sparse(training_matrix), svm_model, '-q');

accuracy = sum(predicted_label == testing_label)/size(testing_label,1)


