%% dc_fft_mean_autocorr_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = dc_fft_mean_autocorr_handle(input_matrix)
    input_matrix(:,1) = abs(fft(input_matrix(:,1)-mean(input_matrix(:,1))));
    input_matrix(:,2) = abs(fft(input_matrix(:,2)-mean(input_matrix(:,2))));
    input_matrix(:,3) = abs(fft(input_matrix(:,3)-mean(input_matrix(:,3))));
    
   Xmac = mean(autocorr(input_matrix(:,1)));
   Ymac = mean(autocorr(input_matrix(:,2)));
   Zmac = mean(autocorr(input_matrix(:,3)));
    
   features = [Xmac, Ymac, Zmac];
end