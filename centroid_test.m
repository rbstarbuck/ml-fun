addpath('liblinear-2.1/matlab');
load('subject_data.mat');

windowSize = 64
windowIncrement = 8
testingWindowCentroid = 8

% trainInputData = [action1_xyz ; action2_xyz ; action3_xyz ; action4_xyz];
% trainInputLabel = [ones(length(action1_xyz), 1) ; 2*ones(length(action2_xyz), 1) ; 3*ones(length(action3_xyz), 1) ; 4*ones(length(action4_xyz), 1)];
% 
% testInputData = subject1_xyz;
% testInputLabel = subject1_label;

% trainMatrix = extract_features(trainInputData, windowSize, windowIncrement, @handle_wrapper);
% trainLabel = window_labels(trainInputLabel, windowSize, windowIncrement);

% training_matrix1 = extract_features(action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% training_matrix2 = extract_features(action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% training_matrix3 = extract_features(action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% training_matrix4 = extract_features(action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% trainMatrix = [training_matrix1 ; training_matrix2 ; training_matrix3 ; training_matrix4];
% trainLabel = [ones(size(training_matrix1,1),1) ; 2*ones(size(training_matrix2,1),1) ; 3*ones(size(training_matrix3,1),1) ; 4*ones(size(training_matrix4,1),1)];

% testMatrix = extract_features(testInputData, windowSize, windowIncrement, @handle_wrapper);
% testLabel = windowLabels(testInputLabel, windowSize, windowIncrement);

[trainMatrix, trainLabel, testInputData, testInputLabel] = leave_one_out(1, 6, windowSize, windowIncrement, @handle_wrapper);

svm_model = train(trainLabel, sparse(trainMatrix), '-s 2 -q');
classifier = @(x)(predict(ones(1), sparse(x), svm_model, '-q'));

predictions = centroid_classification(testInputData, windowSize, testingWindowCentroid, classifier, @handle_wrapper);

hits = zeros(length(predictions), 1);
hits(testInputLabel == predictions) = 1;
% predictions has '0' values at begin/end of vector where centroid is not
% in bounds, get rid of them.
hits(predictions == 0) = [];

accuracy = sum(hits) / length(hits)
