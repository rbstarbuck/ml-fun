function [trainData, trainLabels, testData, testLabels] = leave_one_out_tester(subjectToLeaveOut, numSubjects, windowSize, windowIncrement, handle_list, weights)
%% LEAVE_ONE_OUT
%  Partitions all available data into an action-segmented training set and
%  a single-subject test set which is not included in the training data

load('subject_data2.mat');

a1 = [ ; ];
a2 = [ ; ];
a3 = [ ; ];
%a4 = [ ; ];

for subjectId = 1:numSubjects
    if subjectId == subjectToLeaveOut
        testData = eval(sprintf('subject%g_xyz', subjectId));
        testLabels = eval(sprintf('subject%g_label', subjectId));
    else
        a1 = [a1(:,:) ; eval(sprintf('subject%g_action1_xyz', subjectId))];
        a2 = [a2(:,:) ; eval(sprintf('subject%g_action2_xyz', subjectId))];
        a3 = [a3(:,:) ; eval(sprintf('subject%g_action3_xyz', subjectId))];
        %a4 = [a4(:,:) ; eval(sprintf('subject%g_action4_xyz', subjectId))];
    end
end

if nargin == 5
    f1 = extract_features_tester(a1, windowSize, windowIncrement, handle_list);
    f2 = extract_features_tester(a2, windowSize, windowIncrement, handle_list);
    f3 = extract_features_tester(a3, windowSize, windowIncrement, handle_list);
    %f4 = extract_features_tester(a4, windowSize, windowIncrement, handle_list);
else
    f1 = extract_features_tester(a1, windowSize, windowIncrement, handle_list, weights);
    f2 = extract_features_tester(a2, windowSize, windowIncrement, handle_list, weights);
    f3 = extract_features_tester(a3, windowSize, windowIncrement, handle_list, weights);
    %f4 = extract_features_tester(a4, windowSize, windowIncrement, handle_list, weights);
end

l1 = 1 * ones(length(f1), 1);
l2 = 2 * ones(length(f2), 1);
l3 = 3 * ones(length(f3), 1);
%l4 = 4 * ones(length(f4), 1);

trainData = [f1 ; f2 ; f3];% ; f4];
trainLabels = [l1 ; l2 ; l3];% ; l4];

end

