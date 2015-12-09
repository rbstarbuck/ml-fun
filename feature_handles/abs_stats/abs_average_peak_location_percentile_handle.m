% abs_average_peak_location__percentile_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = abs_average_peak_location_percentile_handle(input_matrix)
    N = size(input_matrix,1);
    [peaks, locations] = findpeaks(abs(input_matrix(:,1)'));
    Xaaplp = mean(locations)/N;
    [peaks, locations] = findpeaks(abs(input_matrix(:,2)'));
    Yaaplp = mean(locations)/N;
    [peaks, locations] = findpeaks(abs(input_matrix(:,3)'));
    Zaaplp = mean(locations)/N;
    
    features = [Xaaplp, Yaaplp, Zaaplp];
end
