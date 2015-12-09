% average_peak_location_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = average_peak_location_handle(input_matrix)
    [peaks, locations] = findpeaks(input_matrix(:,1)');
    Xapl = mean(locations);
    [peaks, locations] = findpeaks(input_matrix(:,2)');
    Yapl = mean(locations);
    [peaks, locations] = findpeaks(input_matrix(:,3)');
    Zapl = mean(locations);
    
    features = [Xapl, Yapl, Zapl];
end