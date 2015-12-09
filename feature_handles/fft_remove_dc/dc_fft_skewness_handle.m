%% dc_fft_skewness_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = dc_fft_skewness_handle(input_matrix)
   Xfskew = skewness(abs(fft(input_matrix(:,1) - mean(input_matrix(:,1)))));
   Yfskew = skewness(abs(fft(input_matrix(:,2) - mean(input_matrix(:,2)))));
   Zfskew = skewness(abs(fft(input_matrix(:,3) - mean(input_matrix(:,3)))));
    
   features = [Xfskew, Yfskew, Zfskew];
end