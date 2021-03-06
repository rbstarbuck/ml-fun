%% dc_fft_corr_coefficient_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = dc_fft_corr_coefficient_handle(input_matrix)
    input_matrix(:,1) = abs(fft(input_matrix(:,1)-mean(input_matrix(:,1))));
    input_matrix(:,2) = abs(fft(input_matrix(:,2)-mean(input_matrix(:,2))));
    input_matrix(:,3) = abs(fft(input_matrix(:,3)-mean(input_matrix(:,3))));
    
   XYmcc = corrcoef(input_matrix(:,1), input_matrix(:,2));
   XYmcc = XYmcc(2,1);
   XZmcc = corrcoef(input_matrix(:,1), input_matrix(:,3));
   XZmcc = XZmcc(2,1);
   YZmcc = corrcoef(input_matrix(:,2), input_matrix(:,3));
   YZmcc = YZmcc(2,1);
    
   features = [XYmcc, XZmcc, YZmcc];
end