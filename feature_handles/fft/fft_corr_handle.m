% fft_abs_corr_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = fft_corr_handle(input_matrix)
    input_matrix(:,1) = fft(input_matrix(:,1));
    input_matrix(:,2) = fft(input_matrix(:,2));
    input_matrix(:,3) = fft(input_matrix(:,3));
    
    XYacorr = corr(input_matrix(:,1), input_matrix(:,2));
    XZacorr = corr(input_matrix(:,1), input_matrix(:,3));
    YZacorr = corr(input_matrix(:,2), input_matrix(:,3));
    
    features = [XYacorr, XZacorr, YZacorr];
end
