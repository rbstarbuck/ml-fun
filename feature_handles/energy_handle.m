% energy_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = energy_handle(input_matrix)
    N = size(input_matrix,1);
    Xenergy = sum(abs(fft(input_matrix(1:N,1))).^2);
    Yenergy = sum(abs(fft(input_matrix(1:N,2))).^2);
    Zenergy = sum(abs(fft(input_matrix(1:N,3))).^2);
    
    features = [Xenergy, Yenergy, Zenergy];
end
