%% kurtosis_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = fft_kurtosis_handle(input_matrix)
    input_matrix(:,1) = fft(input_matrix(:,1));
    input_matrix(:,2) = fft(input_matrix(:,2));
    input_matrix(:,3) = fft(input_matrix(:,3));
   Xkur = kurtosis(input_matrix(:,1));
   Ykur = kurtosis(input_matrix(:,2));
   Zkur = kurtosis(input_matrix(:,3));
    
   features = [Xkur, Ykur, Zkur];
end