load('subject_data.mat');
fileId = fopen('bias-variance-test.txt', 'wt');

windowSize = 64
windowIncrement = 8
testingWindowCentroid = 8

maxSubjects = 6;
numSlices = 30;

fprintf(fileId, 'Window size = %g\nWindow increment = %g\nWindow centroid = %g\n\n', windowSize, windowIncrement, testingWindowCentroid);


% training_matrix1 = extract_features(action1_xyz, windowSize, windowIncrement, @handle_wrapper);
% training_matrix2 = extract_features(action2_xyz, windowSize, windowIncrement, @handle_wrapper);
% training_matrix3 = extract_features(action3_xyz, windowSize, windowIncrement, @handle_wrapper);
% training_matrix4 = extract_features(action4_xyz, windowSize, windowIncrement, @handle_wrapper);
% training_matrix = [training_matrix1; training_matrix2; training_matrix3; training_matrix4];
% training_label = [ones(size(training_matrix1,1),1); 2*ones(size(training_matrix2,1),1); 3*ones(size(training_matrix3,1),1);4*ones(size(training_matrix4,1),1)];
% 
% svm_model_testOnTrain = train(training_label, sparse(training_matrix),'-s 2 -q');
% 
% 
[trainMatrix1, trainLabel1, testInputData1, testInputLabel1] = leave_one_out(1, maxSubjects, windowSize, windowIncrement, @handle_wrapper);
[trainMatrix2, trainLabel2, testInputData2, testInputLabel2] = leave_one_out(2, maxSubjects, windowSize, windowIncrement, @handle_wrapper);
[trainMatrix3, trainLabel3, testInputData3, testInputLabel3] = leave_one_out(3, maxSubjects, windowSize, windowIncrement, @handle_wrapper);
[trainMatrix4, trainLabel4, testInputData4, testInputLabel4] = leave_one_out(4, maxSubjects, windowSize, windowIncrement, @handle_wrapper);
[trainMatrix5, trainLabel5, testInputData5, testInputLabel5] = leave_one_out(5, maxSubjects, windowSize, windowIncrement, @handle_wrapper);
[trainMatrix6, trainLabel6, testInputData6, testInputLabel6] = leave_one_out(6, maxSubjects, windowSize, windowIncrement, @handle_wrapper);


for slice = 1:numSlices
    fprintf(fileId, '--- Slice %g of %g ---\n\n', slice, numSlices);
    
    fprintf(fileId, 'Leave-one-out\n');
    totalAccuracy = 0;
    for subjectId = 1:maxSubjects
        subjectId
        
        trainMatrix = eval(sprintf('trainMatrix%g', subjectId));
        trainLabel = eval(sprintf('trainLabel%g', subjectId));
        testInputData = eval(sprintf('testInputData%g', subjectId));
        testInputLabel = eval(sprintf('testInputLabel%g', subjectId));
        
        totalSamples = size(trainMatrix,1);
        numInSlice = floor((slice / numSlices) * size(trainMatrix,1))
        temp = [trainMatrix, trainLabel];
        temp = temp(randperm(size(temp,1),numInSlice),:);
        trainMatrix = temp(:,1:end-1);
        trainLabel = temp(:,end);

        svm_model = train(trainLabel, sparse(trainMatrix), '-s 2 -q');
        classifier = @(x)(predict(ones(1), sparse(x), svm_model, '-q'));

        predictions = centroid_classification(testInputData, windowSize, testingWindowCentroid, classifier, @handle_wrapper);

        hits = zeros(size(predictions,1), 1);
        hits(testInputLabel == predictions) = 1;
        hits(predictions == 0) = [];

        accuracy = sum(hits) / size(hits,1)

        fprintf(fileId, ' - Subject %g: %g %% accuracy on %g out of %g samples\n', subjectId, accuracy * 100, numInSlice, totalSamples);
        totalAccuracy = totalAccuracy + accuracy;
    end
    fprintf(fileId, ' - Average: %g pct\n\n', (totalAccuracy / maxSubjects) * 100);
    
    fprintf(fileId, 'Test-on-train\n');
    totalAccuracy = 0;
    for subjectId = 1:maxSubjects
        subjectId
        
        testInputData = eval(sprintf('subject%g_xyz', subjectId));
        testInputLabel = eval(sprintf('subject%g_label', subjectId));

        totalSamples = size(testInputData,1);
        numInSlice = floor((slice / numSlices) * totalSamples)
        if (numInSlice < windowSize)
            numInSlice = windowSize
        end
        temp = [testInputData, testInputLabel];
        temp = temp(randperm(size(temp,1),numInSlice),:);
        testInputData = temp(:,1:end-1);
        testInputLabel = temp(:,end);

        classifier = @(x)(predict(ones(1), sparse(x), svm_model_testOnTrain, '-q'));
        predictions = centroid_classification(testInputData, windowSize, testingWindowCentroid, classifier, @handle_wrapper);
        
        hits = zeros(size(predictions,1), 1);
        hits(testInputLabel == predictions) = 1;
        hits(predictions == 0) = [];

        accuracy = sum(hits) / size(hits,1)

        fprintf(fileId, ' - Subject %g: %g %% accuracy on %g out of %g samples\n', subjectId, accuracy * 100, numInSlice, totalSamples);
        totalAccuracy = totalAccuracy + accuracy;
    end
    fprintf(fileId, ' - Average: %g pct\n\n', (totalAccuracy / maxSubjects) * 100);    
    
end


