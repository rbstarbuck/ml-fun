%% dc_fft_abs_mean_handle
% author Yixing Liu & Michael Glazer
% created on October 19, 2015
% last modified on October 19, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = dc_fft_abs_mean_handle(input_matrix)
    input_matrix(:,1) = abs(fft(input_matrix(:,1)-mean(input_matrix(:,1))));
    input_matrix(:,2) = abs(fft(input_matrix(:,2)-mean(input_matrix(:,2))));
    input_matrix(:,3) = abs(fft(input_matrix(:,3)-mean(input_matrix(:,3))));
    
    Xsum = 0;
    Ysum = 0;
    Zsum = 0; 
    N = size(input_matrix,1);
    for i = 1:N
        Xsum = Xsum + abs(input_matrix(i,1));
        Ysum = Ysum + abs(input_matrix(i,2));
        Zsum = Zsum + abs(input_matrix(i,3)); 
    end
    
    features = [Xsum/N, Ysum/N, Zsum/N];
end
