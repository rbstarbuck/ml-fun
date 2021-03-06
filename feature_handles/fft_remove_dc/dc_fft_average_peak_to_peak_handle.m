%% dc_fft_average_peak_to_peak_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = dc_fft_average_peak_to_peak_handle(input_matrix)
    input_matrix(:,1) = abs(fft(input_matrix(:,1)-mean(input_matrix(:,1))));
    input_matrix(:,2) = abs(fft(input_matrix(:,2)-mean(input_matrix(:,2))));
    input_matrix(:,3) = abs(fft(input_matrix(:,3)-mean(input_matrix(:,3))));
    
    N = size(input_matrix,1);
   Xap2p = peak2peak(input_matrix(:,1))/N;
   Yap2p = peak2peak(input_matrix(:,2))/N;
   Zap2p = peak2peak(input_matrix(:,3))/N;
    
   features = [Xap2p, Yap2p, Zap2p];
end