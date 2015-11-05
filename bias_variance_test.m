load('subject_data.mat');
addpath('liblinear-2.1/matlab');

% ...or just load it
load('bias-variance-test-temp.mat');

fileId = fopen('bias-variance-test.txt', 'wt');

windowSize = 64
windowIncrement = 8
testingWindowCentroid = 8
svm_params = '-s 2 -q'

subjects = [1, 2, 3, 5, 6];
maxSubjects = length(subjects);
numSlices = 100;

yaxis_loo = zeros(numSlices, 1);
yaxis_ttm_avg = zeros(numSlices, 1);
yaxis_ttm_all = zeros(numSlices, 1);

fprintf(fileId, 'Window size = %g\nWindow increment = %g\nWindow centroid = %g\n\n', windowSize, windowIncrement, testingWindowCentroid);

% Make 'test-on-train' matrices and labels
% ttm1 = extract_features(subject1_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm2 = extract_features(subject1_action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm3 = extract_features(subject1_action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm4 = extract_features(subject1_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm_matrix_s1 = [ttm1 ; ttm2 ; ttm3 ; ttm4];
% ttm_labels_s1 = [ones(size(ttm1,1),1) ; 2*ones(size(ttm2,1),1) ; 3*ones(size(ttm3,1),1) ; 4*ones(size(ttm4,1),1)];
% 
% ttm1 = extract_features(subject2_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% % ttm2 = extract_features(subject2_action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm3 = extract_features(subject2_action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm4 = extract_features(subject2_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm_matrix_s2 = [ttm1 ; ttm3 ; ttm4];
% ttm_labels_s2 = [ones(size(ttm1,1),1) ; 3*ones(size(ttm3,1),1) ; 4*ones(size(ttm4,1),1)];

% ttm1 = extract_features(subject3_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm2 = extract_features(subject3_action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm3 = extract_features(subject3_action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm4 = extract_features(subject3_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm_matrix_s3 = [ttm1 ; ttm2 ; ttm3 ; ttm4];
% ttm_labels_s3 = [ones(size(ttm1,1),1) ; 2*ones(size(ttm2,1),1) ; 3*ones(size(ttm3,1),1) ; 4*ones(size(ttm4,1),1)];
% 
% ttm1 = extract_features(subject4_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm2 = extract_features(subject4_action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm3 = extract_features([subject4_action3_xyz ; subject4_action3_xyz], windowSize, windowIncrement, @handle_wrapper);
% ttm4 = extract_features(subject4_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm_matrix_s4 = [ttm1 ; ttm2 ; ttm3 ; ttm4];
% ttm_labels_s4 = [ones(size(ttm1,1),1) ; 2*ones(size(ttm2,1),1) ; 3*ones(size(ttm3,1),1) ; 4*ones(size(ttm4,1),1)];
% 
% ttm1 = extract_features(subject5_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm2 = extract_features(subject5_action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm3 = extract_features(subject5_action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm4 = extract_features(subject5_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm_matrix_s5 = [ttm1 ; ttm2 ; ttm3 ; ttm4];
% ttm_labels_s5 = [ones(size(ttm1,1),1) ; 2*ones(size(ttm2,1),1) ; 3*ones(size(ttm3,1),1) ; 4*ones(size(ttm4,1),1)];
% 
% ttm1 = extract_features(subject6_action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm2 = extract_features(subject6_action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm3 = extract_features(subject6_action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm4 = extract_features(subject6_action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% ttm_matrix_s6 = [ttm1 ; ttm2 ; ttm3 ; ttm4];
% ttm_labels_s6 = [ones(size(ttm1,1),1) ; 2*ones(size(ttm2,1),1) ; 3*ones(size(ttm3,1),1) ; 4*ones(size(ttm4,1),1)];
% 
% ttm_matrix_all = [ttm_matrix_s1 ; ttm_matrix_s2 ; ttm_matrix_s3 ; ttm_matrix_s4 ; ttm_matrix_s5 ; ttm_matrix_s6];
% ttm_labels_all = [ttm_labels_s1 ; ttm_labels_s2 ; ttm_labels_s3 ; ttm_labels_s4 ; ttm_labels_s5 ; ttm_labels_s6]; 
% 
% % Make 'leave-one-out' matrices and labels
% loo_matrix_s1 = [ttm_matrix_s2 ; ttm_matrix_s3 ; ttm_matrix_s4 ; ttm_matrix_s5 ; ttm_matrix_s6];
% loo_matrix_s2 = [ttm_matrix_s1 ; ttm_matrix_s3 ; ttm_matrix_s4 ; ttm_matrix_s5 ; ttm_matrix_s6];
% loo_matrix_s3 = [ttm_matrix_s1 ; ttm_matrix_s2 ; ttm_matrix_s4 ; ttm_matrix_s5 ; ttm_matrix_s6];
% loo_matrix_s4 = [ttm_matrix_s1 ; ttm_matrix_s2 ; ttm_matrix_s3 ; ttm_matrix_s5 ; ttm_matrix_s6];
% loo_matrix_s5 = [ttm_matrix_s1 ; ttm_matrix_s2 ; ttm_matrix_s3 ; ttm_matrix_s4 ; ttm_matrix_s6];
% loo_matrix_s6 = [ttm_matrix_s1 ; ttm_matrix_s2 ; ttm_matrix_s3 ; ttm_matrix_s4 ; ttm_matrix_s5];
% 
% loo_labels_s1 = [ttm_labels_s2 ; ttm_labels_s3 ; ttm_labels_s4 ; ttm_labels_s5 ; ttm_labels_s6];
% loo_labels_s2 = [ttm_labels_s1 ; ttm_labels_s3 ; ttm_labels_s4 ; ttm_labels_s5 ; ttm_labels_s6];
% loo_labels_s3 = [ttm_labels_s1 ; ttm_labels_s2 ; ttm_labels_s4 ; ttm_labels_s5 ; ttm_labels_s6];
% loo_labels_s4 = [ttm_labels_s1 ; ttm_labels_s2 ; ttm_labels_s3 ; ttm_labels_s5 ; ttm_labels_s6];
% loo_labels_s5 = [ttm_labels_s1 ; ttm_labels_s2 ; ttm_labels_s3 ; ttm_labels_s4 ; ttm_labels_s6];
% loo_labels_s6 = [ttm_labels_s1 ; ttm_labels_s2 ; ttm_labels_s3 ; ttm_labels_s4 ; ttm_labels_s5];

% [trainMatrix1, trainLabel1, testInputData1, testInputLabel1] = leave_one_out(1, maxSubjects, windowSize, windowIncrement, @handle_wrapper);
% [trainMatrix2, trainLabel2, testInputData2, testInputLabel2] = leave_one_out(2, maxSubjects, windowSize, windowIncrement, @handle_wrapper);
% [trainMatrix3, trainLabel3, testInputData3, testInputLabel3] = leave_one_out(3, maxSubjects, windowSize, windowIncrement, @handle_wrapper);
% [trainMatrix4, trainLabel4, testInputData4, testInputLabel4] = leave_one_out(4, maxSubjects, windowSize, windowIncrement, @handle_wrapper);
% [trainMatrix5, trainLabel5, testInputData5, testInputLabel5] = leave_one_out(5, maxSubjects, windowSize, windowIncrement, @handle_wrapper);
% [trainMatrix6, trainLabel6, testInputData6, testInputLabel6] = leave_one_out(6, maxSubjects, windowSize, windowIncrement, @handle_wrapper);

% Save these for later so we can comment-out above code on subsequent runs
% save bias-variance-test-temp;

for slice = 1:numSlices
    fprintf(fileId, '--- Slice %g of %g ---\n\n', slice, numSlices);
    
    fprintf(fileId, 'Leave-one-out\n');
    totalAccuracy = 0;
    for subjectId = subjects
        subjectId
        
        trainMatrix = eval(sprintf('loo_matrix_s%g', subjectId));
        trainLabel = eval(sprintf('loo_labels_s%g', subjectId));
        testMatrix = eval(sprintf('ttm_matrix_s%g', subjectId));
        testLabel = eval(sprintf('ttm_labels_s%g', subjectId));
        
        totalSamples = size(trainMatrix,1);
        numInSlice = floor((slice / numSlices) * totalSamples)
        perm = randperm(totalSamples,numInSlice);
        trainMatrix = trainMatrix(perm,:);
        trainLabel = trainLabel(perm);

        svm_model = train(trainLabel, sparse(trainMatrix), svm_params);
        [predictions] = predict(testLabel, sparse(testMatrix), svm_model);
        
        hits = zeros(size(predictions,1), 1);
        hits(testLabel == predictions) = 1;
        hits(predictions == 0) = [];

        accuracy = sum(hits) / size(hits,1)

        fprintf(fileId, ' - Subject %g: %g pct accuracy on %g/%g samples\n', subjectId, accuracy * 100, numInSlice, totalSamples);
        totalAccuracy = totalAccuracy + accuracy;
    end
    averageAccuracy = totalAccuracy / maxSubjects;
    fprintf(fileId, ' - Average: %g pct\n\n', averageAccuracy * 100);
    yaxis_loo(slice) = averageAccuracy;
    
    fprintf(fileId, 'Test-on-train\n');
    totalAccuracy = 0;
    for subjectId = subjects
        subjectId
        
        trainMatrix = eval(sprintf('ttm_matrix_s%g', subjectId));
        trainLabel = eval(sprintf('ttm_labels_s%g', subjectId));
        
        totalSamples = size(trainMatrix,1);
        numInSlice = floor((slice / numSlices) * totalSamples)
        perm = randperm(totalSamples,numInSlice);
        trainMatrix = trainMatrix(perm,:);
        trainLabel = trainLabel(perm);

        svm_model = train(trainLabel, sparse(trainMatrix), svm_params);
        [predictions] = predict(trainLabel, sparse(trainMatrix), svm_model);
        
        hits = zeros(size(predictions,1), 1);
        hits(trainLabel == predictions) = 1;
        hits(predictions == 0) = [];

        accuracy = sum(hits) / size(hits,1)

        fprintf(fileId, ' - Subject %g: %g pct accuracy on %g/%g samples\n', subjectId, accuracy * 100, numInSlice, totalSamples);
        totalAccuracy = totalAccuracy + accuracy;
    end
    averageAccuracy = totalAccuracy / maxSubjects;
    fprintf(fileId, ' - Average: %g pct\n', averageAccuracy * 100);   
    yaxis_ttm_avg(slice) = averageAccuracy;
    
    trainMatrix = ttm_matrix_all;
    trainLabel = ttm_labels_all;

    totalSamples = size(trainMatrix,1);
    numInSlice = floor((slice / numSlices) * totalSamples)
    perm = randperm(totalSamples,numInSlice);
    trainMatrix = trainMatrix(perm,:);
    trainLabel = trainLabel(perm);

    svm_model = train(trainLabel, sparse(trainMatrix), svm_params);
    [predictions] = predict(trainLabel, sparse(trainMatrix), svm_model);

    hits = zeros(size(predictions,1), 1);
    hits(trainLabel == predictions) = 1;
    hits(predictions == 0) = [];

    accuracy = sum(hits) / size(hits,1)
    fprintf(fileId, ' - All subjects %g: %g pct accuracy on %g/%g samples\n\n', subjectId, accuracy * 100, numInSlice, totalSamples);
    yaxis_ttm_all(slice) = accuracy;
        
end

% plot(1:numSlices, smooth(yaxis_loo, 20, 'rlowess'), 1:numSlices, smooth(yaxis_ttm_avg, 20, 'rlowess'), 1:numSlices, smooth(yaxis_ttm_all, 20, 'rlowess'));
% figure
yaxis_loo = ones(size(yaxis_loo)) - yaxis_loo;
yaxis_ttm_avg = ones(size(yaxis_ttm_avg)) - yaxis_ttm_avg;
yaxis_ttm_all = ones(size(yaxis_ttm_all)) - yaxis_ttm_all;

xaxis = 1:numSlices;
xaxis = xaxis ./ 100 .* 47360;
xaxis = xaxis';
yaxis_loo_fit = polyval(polyfit(xaxis, yaxis_loo, 3), xaxis);
yaxis_ttm_avg_fit = polyval(polyfit(xaxis, yaxis_ttm_avg, 3), xaxis);
yaxis_ttm_all_fit = polyval(polyfit(xaxis, yaxis_ttm_all, 3), xaxis);

plot(xaxis, yaxis_loo, 'LineSmoothing', 'on')
hold on
plot(xaxis, yaxis_ttm_avg, 'LineSmoothing', 'on')
plot(xaxis, yaxis_loo_fit, 'LineSmoothing', 'on')
plot(xaxis, yaxis_ttm_avg_fit, 'LineSmoothing', 'on')
hold off
legend('Testing set classification', 'Training set classification')
ylabel('Classification error (pct)')
xlabel('Data points in training set')
title('Classication error over training set size')
