%% SVM classification template
% author Yixing Liu
% created on October 17,2015
% last updated on October 19,2015
% environment: mac x64, windows x64

% add path to use the SVM library
addpath('liblinear-2.1/matlab')

% define window size
window_size = 64;
% make sure the num in pca1.m is same as window_size
pca1;

% you can design your own training_matrix, training_label,
% testing_matrix, testing_label here

% According to Richmond, mean of abs and RMS gives the best visualization
% so I use mean of abs and RMS as examples here
action1_xyz = [action1(:,2),action1(:,3),action1(:,4)];
action2_xyz = [action2(:,2),action2(:,3),action2(:,4)];
action3_xyz = [action3(:,2),action3(:,3),action3(:,4)];
action4_xyz = [action4(:,2),action4(:,3),action4(:,4)];
% this can be simplied as action1(:,2:4))

training_matrix1 = extract_features(action1_xyz, window_size, window_size, @handle_wrapper);
training_matrix2 = extract_features(action2_xyz, window_size, window_size, @handle_wrapper);
training_matrix3 = extract_features(action3_xyz, window_size, window_size, @handle_wrapper);
training_matrix4 = extract_features(action4_xyz, window_size, window_size, @handle_wrapper);
training_matrix = [training_matrix1; training_matrix2; training_matrix3; training_matrix4];
training_label = [ones(size(training_matrix1,1),1); 2*ones(size(training_matrix2,1),1); 3*ones(size(training_matrix3,1),1);4*ones(size(training_matrix4,1),1)];

% type keyword train to look up parameters of train
% predict parameters should be consistent with train parameters
svm_model = train(training_label, sparse(training_matrix),'-s 2');
% in principle we should seperate training set and testing set
testing_label = training_label;
testing_matrix = training_matrix;
[predicted_label] = predict(training_label, sparse(training_matrix), svm_model, '-q');

accuracy = sum(predicted_label == testing_label)/size(testing_label,1)

%% result abs_mean + rms = 76.93%
%% result pca selected features = 67.83%
%% result abs_mean + rms + pca selected features = 93.54%


