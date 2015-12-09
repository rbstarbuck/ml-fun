% std_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = std_handle(input_matrix)
    Xstd = std(input_matrix(:,1));
    Ystd = std(input_matrix(:,2));
    Zstd = std(input_matrix(:,3));
    
    features = [Xstd, Ystd, Zstd];
end
