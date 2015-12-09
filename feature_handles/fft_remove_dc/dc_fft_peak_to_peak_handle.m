%% dc_fft_peak_to_peak_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = dc_fft_peak_to_peak_handle(input_matrix)
   Xp2p = peak2peak(abs(fft(input_matrix(:,1)-mean(input_matrix(:,1)))));
   Yp2p = peak2peak(abs(fft(input_matrix(:,2)-mean(input_matrix(:,2)))));
   Zp2p = peak2peak(abs(fft(input_matrix(:,3)-mean(input_matrix(:,3)))));
    
   features = [Xp2p, Yp2p, Zp2p];
end