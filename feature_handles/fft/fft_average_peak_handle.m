% dc_fft_average_peak_handle
% author Yixing Liu & Michael Glazer
% created on December 06, 2015
% last modified on December 06, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = fft_average_peak_handle(input_matrix)
    [peaks, locations] = findpeaks(fft(input_matrix(:,1))');
    Xap = mean(peaks);
    [peaks, locations] = findpeaks(fft(input_matrix(:,2))');
    Yap = mean(peaks);
    [peaks, locations] = findpeaks(fft(input_matrix(:,3))');
    Zap = mean(peaks);
    
    features = [Xap, Yap, Zap];
end
