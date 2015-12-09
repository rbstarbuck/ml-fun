% peak_location_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = peak_location_handle(input_matrix)
    [max2, Xloc] = max(abs(fft(input_matrix(:,1) - mean(input_matrix(:,1)))));
    [max2, Yloc] = max(abs(fft(input_matrix(:,1) - mean(input_matrix(:,1)))));
    [max2, Zloc] = max(abs(fft(input_matrix(:,1) - mean(input_matrix(:,1)))));
    
    features = [Xloc, Yloc, Zloc];
end
