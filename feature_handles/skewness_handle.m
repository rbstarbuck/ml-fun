%% skewness_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = skewness_handle(input_matrix)
   Xskew = skewness(input_matrix(:,1));
   Yskew = skewness(input_matrix(:,2));
   Zskew = skewness(input_matrix(:,3));
    
   features = [Xskew, Yskew, Zskew];
end