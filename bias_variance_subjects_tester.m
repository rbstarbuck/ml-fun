addpath('liblinear-2.1/matlab')
load('subject_data.mat')

p = mfilename('fullpath');
codeDirectory = fileparts(p);
addpath([codeDirectory '/feature_handles']);
addpath([codeDirectory '/liblinear-2.1']);
addpath([codeDirectory '/liblinear-2.1/matlab']);
addpath(genpath([codeDirectory '/feature_handles']));

windowSize = 64
windowIncrement = 8
testingWindowCentroid = 8
svm_params = '-s 2 -q'

subjects = [1, 2, 3, 4, 5, 6];



% f1 = extract_features(subject1_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% f2 = extract_features(subject1_action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% f3 = extract_features(subject1_action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% f4 = extract_features(subject1_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% l1 = 1 * ones(length(f1), 1);
% l2 = 2 * ones(length(f2), 1);
% l3 = 3 * ones(length(f3), 1);
% l4 = 4 * ones(length(f4), 1);
% trainMatrix1 = [f1 ; f2 ; f3 ; f4];
% trainLabels1 = [l1 ; l2 ; l3 ; l4];
% 
% f1 = extract_features(subject2_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% f3 = extract_features(subject2_action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% f4 = extract_features(subject2_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% l1 = 1 * ones(length(f1), 1);
% l2 = 2 * ones(length(f2), 1);
% l3 = 3 * ones(length(f3), 1);
% l4 = 4 * ones(length(f4), 1);
% trainMatrix2 = [f1 ; f2 ; f3 ; f4];
% trainLabels2 = [l1 ; l2 ; l3 ; l4];
% 
% f1 = extract_features(subject3_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% f2 = extract_features(subject3_action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% f3 = extract_features(subject3_action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% f4 = extract_features(subject3_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% l1 = 1 * ones(length(f1), 1);
% l2 = 2 * ones(length(f2), 1);
% l3 = 3 * ones(length(f3), 1);
% l4 = 4 * ones(length(f4), 1);
% trainMatrix3 = [f1 ; f2 ; f3 ; f4];
% trainLabels3 = [l1 ; l2 ; l3 ; l4];
% 
% f1 = extract_features(subject1_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% f2 = extract_features(subject1_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% f3 = extract_features(subject1_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% f4 = extract_features(subject1_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% l1 = 1 * ones(length(f1), 1);
% l2 = 2 * ones(length(f2), 1);
% l3 = 3 * ones(length(f3), 1);
% l4 = 4 * ones(length(f4), 1);
% trainMatrix4 = [f1 ; f2 ; f3 ; f4];
% trainLabels4 = [l1 ; l2 ; l3 ; l4];
% 
% f1 = extract_features(subject5_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% f2 = extract_features(subject5_action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% f3 = extract_features(subject5_action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% f4 = extract_features(subject5_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% l1 = 1 * ones(length(f1), 1);
% l2 = 2 * ones(length(f2), 1);
% l3 = 3 * ones(length(f3), 1);
% l4 = 4 * ones(length(f4), 1);
% trainMatrix5 = [f1 ; f2 ; f3 ; f4];
% trainLabels5 = [l1 ; l2 ; l3 ; l4];

% f1 = extract_features(subject6_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% f2 = extract_features(subject6_action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% f3 = extract_features(subject6_action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% f4 = extract_features(subject6_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% l1 = 1 * ones(length(f1), 1);
% l2 = 2 * ones(length(f2), 1);
% l3 = 3 * ones(length(f3), 1);
% l4 = 4 * ones(length(f4), 1);
% trainMatrix6 = [f1 ; f2 ; f3 ; f4];
% trainLabels6 = [l1 ; l2 ; l3 ; l4];
% 
% save('bias-variance-subjects-test', 'trainMatrix1', 'trainLabels1', 'trainMatrix2', 'trainLabels2', 'trainMatrix3', 'trainLabels3', 'trainMatrix4', 'trainLabels4', 'trainMatrix5', 'trainLabels5', 'trainMatrix6', 'trainLabels6');

load bias-variance-subjects-test

handle{1} = @abs_average_peak_handle;
handle{2} = @abs_std_handle;
handle{3} = @abs_fft_skewness_handle;
handle{4} = @rms_handle;
weights = [1, 0.5, 0.25, 0.75];

for numSubjects = 1:length(subjects)
    pct = numSubjects / length(subjects)
    combos = nchoosek(subjects, numSubjects);
    
    testAccuracies = zeros(size(combos, 1));
    trainAccuracies = zeros(size(combos, 1));
    
    for c = 1:size(combos, 1)
        subjectPerm = combos(c,:)
        
        trainMatrix = [ ; ];
        trainLabel = [ ];
        testInputData = [ ; ];
        testInputLabel = [ ];
        for subjectId = 1:length(subjects)
            if ismember(subjectId, subjectPerm)
                testInputData = [testInputData(:,:) ; eval(sprintf('subject%g_xyz', subjectId))];
                testInputLabel = [testInputLabel(:) ; eval(sprintf('subject%g_label', subjectId))];
            else
                trainMatrix = [trainMatrix(:,:) ; eval(sprintf('trainMatrix%g', subjectId))];
                trainLabel = [trainLabel(:) ; eval(sprintf('trainLabels%g', subjectId))];
            end
        end
        
        svm_model = train(trainLabel, sparse(trainMatrix), svm_params);
        classifier = @(x)(predict(ones(1), sparse(x), svm_model, '-q'));
        predictions = centroid_classification_tester(testInputData, windowSize, testingWindowCentroid, classifier, handle, weights);

        hits = zeros(size(predictions));
        hits(testInputLabel == predictions) = 1;
        hits(predictions == 0) = [];
        testAccuracy = sum(hits) / length(hits);
        testAccuracies(c) = testAccuracy
        
        predictions = predict(trainLabel, sparse(trainMatrix), svm_model, '-q');

        hits = zeros(size(predictions));
        hits(trainLabel == predictions) = 1;
        hits(predictions == 0) = [];
        trainAccuracy = sum(hits) / length(hits);
        trainAccuracies(c) = trainAccuracy
    end
    
    save(sprintf('bvSubjects%g', numSubjects), 'trainAccuracies', 'testAccuracies');
end
