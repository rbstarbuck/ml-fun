% abs_std_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = corr_handle(input_matrix)
    Xastd = std(abs(input_matrix(:,1)));
    Yastd = std(abs(input_matrix(:,2)));
    Zastd = std(abs(input_matrix(:,3)));
    
    features = [Xastd, Yastd, Zastd];
end
