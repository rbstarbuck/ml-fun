%% kurtosis_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = kurtosis_handle(input_matrix)
   Xskew = kurtosis(input_matrix(:,1));
   Yskew = kurtosis(input_matrix(:,2));
   Zskew = kurtosis(input_matrix(:,3));
    
   features = [Xskew, Yskew, Zskew];
end