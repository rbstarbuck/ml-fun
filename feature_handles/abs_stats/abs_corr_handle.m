% abs_corr_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = abs_corr_handle(input_matrix)
    XYacorr = corr(abs(input_matrix(:,1)), abs(input_matrix(:,2)));
    XZacorr = corr(abs(input_matrix(:,1)), abs(input_matrix(:,3)));
    YZacorr = corr(abs(input_matrix(:,2)), abs(input_matrix(:,3)));
    
    features = [XYacorr, XZacorr, YZacorr];
end
