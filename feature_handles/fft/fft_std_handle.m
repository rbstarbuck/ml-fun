% fft_std_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = fft_std_handle(input_matrix)
    input_matrix(:,1) = fft(input_matrix(:,1));
    input_matrix(:,2) = fft(input_matrix(:,2));
    input_matrix(:,3) = fft(input_matrix(:,3));
    
    Xstd = std(input_matrix(:,1));
    Ystd = std(input_matrix(:,2));
    Zstd = std(input_matrix(:,3));
    
    features = [Xstd, Ystd, Zstd];
end
