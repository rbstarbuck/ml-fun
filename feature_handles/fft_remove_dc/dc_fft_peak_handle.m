% dc_fft_peak_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = dc_fft_peak_handle(input_matrix)
    [Xmax, Xloc] = max(abs(fft(input_matrix(:,1) - mean(input_matrix(:,1)))));
    [Ymax, Yloc] = max(abs(fft(input_matrix(:,2) - mean(input_matrix(:,2)))));
    [Zmax, Zloc] = max(abs(fft(input_matrix(:,3) - mean(input_matrix(:,3)))));
    
    features = [Xmax, Ymax, Zmax];
end
