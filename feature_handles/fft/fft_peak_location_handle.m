% fft_peak_location_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = fft_peak_location_handle(input_matrix)
    [Xmax, Xloc] = max(fft(input_matrix(:,1)));
    [Ymax, Yloc] = max(fft(input_matrix(:,2)));
    [Zmax, Zloc] = max(fft(input_matrix(:,3)));
    
    features = [Xloc, Yloc, Zloc];
end
