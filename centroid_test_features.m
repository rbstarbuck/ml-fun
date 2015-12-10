function centroid_test_features() 

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
%     handle = {};
%     handle{1} = @abs_average_peak_handle;
%     handle{2} = @abs_std_handle;
%     %handle{3} = @abs_mean_handle;
%     handle{3} = @abs_fft_skewness_handle;
%     %handle{5} = @pca_handle;
%     handle{4} = @rms_handle;
%     handle{1} = @rms_handle;
%     handle{2} = @abs_fft_rms_handle;
%     handle{3} = @energy_handle;
%     handle{4} = @entropy_handle;
%     handle{5} = @abs_mean_handle;
%     handle{6} = @fft_rms_handle;
    %{
    handle{7} = @dc_fft_rms_handle;
    handle{8} = @abs_corr_coefficient_handle;
    handle{9} = @abs_corr_handle;
    handle{10} = @peak_to_peak_handle;
    handle{11} = @abs_fft_peak_to_peak_handle;
    handle{12} = @abs_average_peak_percentile_handle;
    handle{13} = @average_peak_percentile_handle;
    handle{14} = @abs_average_peak_handle;
    handle{15} = @abs_fft_std_handle;
    handle{16} = @fft_std_handle;
    handle{17} = @abs_std_handle;
    handle{18} = @(x)mean(abs(x));
    handle{19} = @var;
    handle{20} = @abs_fft_sum_handle;
    handle{21} = @abs_fft_skewness_handle;
    handle{22} = @abs_skewness_handle; 
    handle{23} = @abs_fft_kurtosis_handle;
    %}
    handle = {};
    handle{1} = @abs_average_peak_handle;
    handle{2} = @abs_std_handle;
    handle{3} = @abs_fft_skewness_handle;
    handle{4} = @rms_handle;
    handleComb = handle;
    weights = [1, 0.5, .25, .75];
    for comb = 1:1
        average_accuracy = [];
        %handleComb = nchoosek(handle,comb);
        for featNum = 1:size(handleComb,1)
            totalAccuracy = 0;
               for subjectId = 1:maxSubjects
                 fprintf('Window Size: %d\nWindow Increment: %d\nTesting Window Centroid: %d\nSubject ID: %d\n', ...
                    windowSize, windowIncrement, testingWindowCentroid, subjectId);
                %wrapper = handle_wrapper_tester(handleComb{featNum});
                [trainMatrix, trainLabel, testInputData, testInputLabel] = leave_one_out_tester(subjectId, maxSubjects, windowSize, windowIncrement, handleComb(featNum,:), weights);

                 svm_model = train(trainLabel, sparse(trainMatrix), '-s 2 -q');
                 classifier = @(x)(predict(ones(1), sparse(x), svm_model, '-q'));

             %    knn_model = fitcknn(trainMatrix, trainLabel, 'NumNeighbors', 80);
             %    classifier = @(x)(predict(knn_model, x));

            %    nb_model = fitcnb(trainMatrix, trainLabel);
            %    classifier = @(x)(predict(nb_model, x));

                predictions = centroid_classification_tester(testInputData, windowSize, testingWindowCentroid, classifier, handleComb(featNum,:), weights);

                hits = zeros(length(predictions), 1);
                hits(testInputLabel == predictions) = 1;
                % predictions has '0' values at begin/end of vector where centroid is not
                % in bounds, get rid of them.
                hits(predictions == 0) = [];

                accuracy = sum(hits) / length(hits);
                totalAccuracy = totalAccuracy + accuracy;

                fprintf('Accuracy = %f%%\n\n', accuracy*100);
            end
            average_accuracy(featNum) = totalAccuracy / maxSubjects;
            fprintf('Average Accuracy = %f%%\n\n', average_accuracy(featNum)*100);
        end
%         for i = 1:size(average_accuracy,2)
%             for j = 1:size(handleComb(i,:), 2)
%                 f = handleComb{i,j};
%                 fprintf('%s, ', func2str(f));
%             end
%             fprintf('= %f\n', average_accuracy(i));
%         end
    end
end