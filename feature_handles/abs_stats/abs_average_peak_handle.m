% abs_average_peak_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = abs_average_peak_handle(input_matrix)
    [peaks, locations] = findpeaks(abs(input_matrix(:,1)'));
    Xaap = mean(peaks);
    [peaks, locations] = findpeaks(abs(input_matrix(:,2)'));
    Yaap = mean(peaks);
    [peaks, locations] = findpeaks(abs(input_matrix(:,3)'));
    Zaap = mean(peaks);
    
    features = [Xaap, Yaap, Zaap];
end
