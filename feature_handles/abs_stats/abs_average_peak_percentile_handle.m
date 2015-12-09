% abs_average_peak_percentile_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = abs_average_peak_percentile_handle(input_matrix)
    N = size(input_matrix,1);
    [peaks, locations] = findpeaks(abs(input_matrix(:,1)'));
    Xaapp = mean(peaks)/N;
    [peaks, locations] = findpeaks(abs(input_matrix(:,2)'));
    Yaapp = mean(peaks)/N;
    [peaks, locations] = findpeaks(abs(input_matrix(:,3)'));
    Zaapp = mean(peaks)/N;
    
    features = [Xaapp, Yaapp, Zaapp];
end
