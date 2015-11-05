addpath('liblinear-2.1/matlab')
load('subject_data.mat')

windowSize = 64
windowIncrement = 8
testingWindowCentroid = 8
svm_params = '-s 2 -q'

numSubjects = 6;
numSlices = 50;

testAccuracies = zeros(numSlices, numSubjects);
% trainAccuracies = zeros(numSlices, numSubjects);

% [trainMatrix1, trainLabel1, testInputData1, testInputLabel1] = leave_one_out(1, numSubjects, windowSize, windowIncrement, @handle_wrapper);
% [trainMatrix2, trainLabel2, testInputData2, testInputLabel2] = leave_one_out(2, numSubjects, windowSize, windowIncrement, @handle_wrapper);
% [trainMatrix3, trainLabel3, testInputData3, testInputLabel3] = leave_one_out(3, numSubjects, windowSize, windowIncrement, @handle_wrapper);
% [trainMatrix4, trainLabel4, testInputData4, testInputLabel4] = leave_one_out(4, numSubjects, windowSize, windowIncrement, @handle_wrapper);
% [trainMatrix5, trainLabel5, testInputData5, testInputLabel5] = leave_one_out(5, numSubjects, windowSize, windowIncrement, @handle_wrapper);
% [trainMatrix6, trainLabel6, testInputData6, testInputLabel6] = leave_one_out(6, numSubjects, windowSize, windowIncrement, @handle_wrapper);

save bias-variance-centroid-test-temp

for slice = 1:numSlices
    pct = slice / numSlices
    for subjectId = 1:numSubjects
        subjectId
        
        trainMatrix = eval(sprintf('trainMatrix%g', subjectId));
        trainLabel = eval(sprintf('trainLabel%g', subjectId));
        n = size(trainMatrix, 1);
        k = floor(pct * n);
        perm = randperm(n,k);
        trainMatrix = trainMatrix(perm,:);
        trainLabel = trainLabel(perm);
        
        testInputData = eval(sprintf('testInputData%g', subjectId));
        testInputLabel = eval(sprintf('testInputLabel%g', subjectId));
        
        svm_model = train(trainLabel, sparse(trainMatrix), svm_params);
%         classifier = @(x)(predict(ones(1), sparse(x), svm_model, '-q'));
%         predictions = centroid_classification(testInputData, windowSize, testingWindowCentroid, classifier, @handle_wrapper);
% 
%         hits = zeros(size(predictions));
%         hits(testInputLabel == predictions) = 1;
%         hits(predictions == 0) = [];
%         testAccuracy = sum(hits) / length(hits)
%         testAccuracies(slice, subjectId) = testAccuracy;
        
        predictions = predict(trainLabel, sparse(trainMatrix), svm_model, '-q');

        hits = zeros(size(predictions));
        hits(trainLabel == predictions) = 1;
        hits(predictions == 0) = [];
        trainAccuracy = sum(hits) / length(hits)
        
        trainAccuracies(slice, subjectId) = trainAccuracy;
    end
end

save('bias-variance-centroid-test-result-2', 'testAccuracies', 'trainAccuracies')

testAccuracies
trainAccuracies

xaxis = (1:numSlices) ./ numSlices;

testErr = ones(size(testAccuracies, 1), 1) - mean(testAccuracies, 2);
trainErr = ones(size(trainAccuracies, 1), 1) - mean(trainAccuracies, 2);

testPoly = polyval(polyfit(xaxis', testErr, 3), xaxis);
trainPoly = polyval(polyfit(xaxis', trainErr, 3), xaxis);


plot(xaxis, testErr, 'LineSmoothing', 'on');
hold on
plot(xaxis, trainErr, 'LineSmoothing', 'on');
plot(xaxis, testPoly, 'LineSmoothing', 'on');
plot(xaxis, trainPoly, 'LineSmoothing', 'on');
hold off
xlabel('Training set size (% of total)');
ylabel('Error (%)');
title('Classification error over training set size');
legend('Testing set', 'Training set');
