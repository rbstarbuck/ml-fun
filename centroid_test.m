p = mfilename('fullpath');
codeDirectory = fileparts(p);
addpath([codeDirectory '/feature_handles']);
addpath([codeDirectory '/liblinear-2.1']);
addpath([codeDirectory '/liblinear-2.1/matlab']);
addpath(genpath([codeDirectory '/feature_handles']));
%make;
load('subject_data.mat');

windowSize = 64;
windowIncrement = 8;
testingWindowCentroid = 8;

maxSubjects = 6;

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

totalAccuracy = 0;
for subjectId = 1:maxSubjects
    subjectId;
     fprintf('Window Size: %d\nWindow Increment: %d\nTesting Window Centroid: %d\nSubject ID: %d\n', ...
        windowSize, windowIncrement, testingWindowCentroid, subjectId);
    
    [trainMatrix, trainLabel, testInputData, testInputLabel] = leave_one_out(subjectId, maxSubjects, windowSize, windowIncrement, @handle_wrapper);

     svm_model = train(trainLabel, sparse(trainMatrix), '-s 2 -q');
     classifier = @(x)(predict(ones(1), sparse(x), svm_model, '-q'));

 %    knn_model = fitcknn(trainMatrix, trainLabel, 'NumNeighbors', 80);
 %    classifier = @(x)(predict(knn_model, x));

%    nb_model = fitcnb(trainMatrix, trainLabel);
%    classifier = @(x)(predict(nb_model, x));

    predictions = centroid_classification(testInputData, windowSize, testingWindowCentroid, classifier, @handle_wrapper);

    hits = zeros(length(predictions), 1);
    hits(testInputLabel == predictions) = 1;
    % predictions has '0' values at begin/end of vector where centroid is not
    % in bounds, get rid of them.
    hits(predictions == 0) = [];

    accuracy = sum(hits) / length(hits);
    totalAccuracy = totalAccuracy + accuracy;
    
    fprintf('Accuracy = %f%%\n\n', accuracy*100);
end

average_accuracy = totalAccuracy / maxSubjects

