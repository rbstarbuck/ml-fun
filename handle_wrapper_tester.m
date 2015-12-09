% handle_wrapper
% author Yixing Liu
% created on October 19, 2015
% last modified on October 19, 2015
% @param input matrix is a a N x 3 matrix
% @return a row vector

function features = handle_wrapper_tester(handle_matrix, input_matrix)
    features = [];
    for i = 1:size(handle_matrix,2)
        handle = handle_matrix{i};
        features = [features, handle(input_matrix)];
    end
end
