% handle_wrapper_tester
% author Yixing Liu & Michael Glazer
% created on October 19, 2015
% last modified on October 19, 2015
% handles: a vector of feature_handles 
% weights: a vector of weights associated with its relative handle
% input_matrix: N x 3 matrix of input (accelerometer) data
% @return a row vector

function features = handle_wrapper_tester(input_matrix, handles, weights)
    features = [];
    args = nargin;
    if nargin == 1
        features = handle_wrapper(input_matrix);
    elseif nargin == 2
        weights = ones(5);
        for i = 1:size(handles,2)
            handle = handles{i};
            weight = weights(i);
            features = [features, weight*handle(input_matrix)];
        end
    elseif nargin == 3
        for i = 1:size(handles,2)
            handle = handles{i};
            weight = weights(i);
            features = [features, weight*handle(input_matrix)];
        end
    end
end
