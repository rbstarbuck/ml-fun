% dc_fft_std_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = dc_fft_std_handle(input_matrix)
    input_matrix(:,1) = abs(fft(input_matrix(:,1)-mean(input_matrix(:,1))));
    input_matrix(:,2) = abs(fft(input_matrix(:,2)-mean(input_matrix(:,1))));
    input_matrix(:,3) = abs(fft(input_matrix(:,3)-mean(input_matrix(:,1))));
    
    Xstd = std(input_matrix(:,1));
    Ystd = std(input_matrix(:,2));
    Zstd = std(input_matrix(:,3));
    
    features = [Xstd, Ystd, Zstd];
end
