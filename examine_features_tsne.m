load('subject_data.mat');
addpath('feature_handles/');
addpath('tSNE_matlab/');

feature_handles = @handle_wrapper;

features1 = [];
features2 = [];
features3 = [];
features4 = [];

% for i = 1:length(feature_handles)
    features1 = [features1, extract_features(action1_xyz(:,:), windowSize, windowIncrement, feature_handles)];
    features2 = [features2, extract_features(action2_xyz(:,:), windowSize, windowIncrement, feature_handles)];
    features3 = [features3, extract_features(action3_xyz(:,:), windowSize, windowIncrement, feature_handles)];
    features4 = [features4, extract_features(action4_xyz(:,:), windowSize, windowIncrement, feature_handles)];
% end

input_dim = size(features1, 2);
output_dim = 2;
perplexity = input_dim;

mapped1 = tsne(features1, [], output_dim, input_dim, perplexity);
mapped2 = tsne(features2, [], output_dim, input_dim, perplexity);
mapped3 = tsne(features3, [], output_dim, input_dim, perplexity);
mapped4 = tsne(features4, [], output_dim, input_dim, perplexity);

figure
hold on
scatter(mapped1(:,1), mapped1(:,2), '+');
scatter(mapped2(:,1), mapped2(:,2), 'o');
scatter(mapped3(:,1), mapped3(:,2), '*');
scatter(mapped4(:,1), mapped4(:,2), 's');
hold off
legend('Spreading Mortar', 'Laying Block', 'Adjusting', 'Removing')
xlabel('X')
ylabel('Y')

