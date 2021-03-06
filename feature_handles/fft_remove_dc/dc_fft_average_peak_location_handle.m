% fft_average_peak_location_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = dc_fft_average_peak_location_handle(input_matrix)
    input_matrix(:,1) = abs(fft(input_matrix(:,1)-mean(input_matrix(:,1))));
    input_matrix(:,2) = abs(fft(input_matrix(:,2)-mean(input_matrix(:,2))));
    input_matrix(:,3) = abs(fft(input_matrix(:,3)-mean(input_matrix(:,3))));
    [peaks, locations] = findpeaks(input_matrix(:,1)');
    Xapl = mean(locations);
    [peaks, locations] = findpeaks(input_matrix(:,2)');
    Yapl = mean(locations);
    [peaks, locations] = findpeaks(input_matrix(:,3)');
    Zapl = mean(locations);
    
    features = [Xapl, Yapl, Zapl];
end
