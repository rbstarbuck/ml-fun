% abs_fft_sum_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = abs_fft_sum_handle(input_matrix)
    input_matrix(:,1) = abs(fft(input_matrix(:,1)));
    input_matrix(:,2) = abs(fft(input_matrix(:,2)));
    input_matrix(:,3) = abs(fft(input_matrix(:,3)));
    
    N = size(input_matrix,1);
    Xsum = sum(input_matrix(1:N,1));
    Ysum = sum(input_matrix(1:N,2));
    Zsum = sum(input_matrix(1:N,3));
    
    features = [Xsum, Ysum, Zsum];
end
