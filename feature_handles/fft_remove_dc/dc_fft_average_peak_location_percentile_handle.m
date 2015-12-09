% dc_fft_average_peak_location__percentile_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = dc_fft_average_peak_location_percentile_handle(input_matrix)
    input_matrix(:,1) = abs(fft(input_matrix(:,1)-mean(input_matrix(:,1))));
    input_matrix(:,2) = abs(fft(input_matrix(:,2)-mean(input_matrix(:,2))));
    input_matrix(:,3) = abs(fft(input_matrix(:,3)-mean(input_matrix(:,3))));
    
    N = size(input_matrix,1);
    [peaks, locations] = findpeaks(input_matrix(:,1)');
    Xaplp = mean(locations)/N;
    [peaks, locations] = findpeaks(input_matrix(:,2)');
    Yaplp = mean(locations)/N;
    [peaks, locations] = findpeaks(input_matrix(:,3)');
    Zaplp = mean(locations)/N;
    
    features = [Xaplp, Yaplp, Zaplp];
end
