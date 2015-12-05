%% pca_handle
% author Yixing Liu
% created on December 04, 2015
% last modified on December 04, 2015
% @param input matrix is a a N x 3 matrix
% @param M is the number of features you want from PCA
% @return 1 x 3M a row vector
function features = pca_handle(input_matrix, M)
    load('pca_feature_space.mat');
    % pca selects features for x, y, z
    % get the window size
    N = size(input_matrix,1);
    % transform input_matrix (N x 3) to input_vector(3N x 1)
    input_vector = zeros(3*N,1);
    for i = 1:N
        if mod(i,3) == 0
            col = 3;
        else
            col = mod(i,3);
        end
        
        input_vector(i) = input_matrix(ceil(i/3), col);
    end
    % run pca1.m to get the feature space
    % feature_space is of dimension 3N x 3N
    % each row is a feature
    features = ones(1,M);
    for i = 1:M
        features(i) = feature_space(i,:) * input_vector;
    end
end
