% Naive Bayes 
% author Yixing Liu
% created on October 20,2015
% last updated on October 20,2015
% description: this can be used as a Naive Bayes template. 
% Change the training_matrix, training_label and prior

load('subject_data.mat');
predictorNames = {'Xmean', 'Ymean', 'Zmean', 'Xrms', 'Yrms', 'Zrms'};
classNames = {'action1', 'action2', 'action3', 'action4'};

training_matrix1 = extract_features(action1(:,2:4), 50, 50, @handle_wrapper);
training_matrix2 = extract_features(action2(:,2:4), 50, 50, @handle_wrapper);
training_matrix3 = extract_features(action3(:,2:4), 50, 50, @handle_wrapper);
training_matrix4 = extract_features(action4(:,2:4), 50, 50, @handle_wrapper);
training_matrix = [training_matrix1; training_matrix2; training_matrix3; training_matrix4];
training_label = [ones(size(training_matrix1,1),1); 2*ones(size(training_matrix2,1),1); 3*ones(size(training_matrix3,1),1);4*ones(size(training_matrix4,1),1)];
% by default, the prior class probability distribution is the relative
% frequency distribution of the training set
% Suppose you know the Prior you can modify the model by
% e.g. nb_model.Prior = [0.4, 0.3, 0.2, 0.1];
% skip Laplace smoothing
nb_model = fitcnb(training_matrix, training_label, 'PredictorNames', predictorNames, 'ClassNames', classNames);

% in priciple, training set and testing set should be seperate
testing_matrix = training_matrix;
testing_label = training_label;
label = predict(nb_model, testing_matrix);
count = 0;
for i = 1:size(label,1)
    if(label(i) ~= testing_label(i))
        count = count + 1;
    end
end

count/size(label,1)
