% dc_fft_rms_handle
% author Yixing Liu & Michael Glazer
% created on December 06, 2015
% last modified on December 06, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = dc_fft_rms_handle(input_matrix)
    input_matrix(:,1) = abs(fft(input_matrix(:,1)-mean(input_matrix(:,1))));
    input_matrix(:,2) = abs(fft(input_matrix(:,2)-mean(input_matrix(:,2))));
    input_matrix(:,3) = abs(fft(input_matrix(:,3)-mean(input_matrix(:,3))));
    
    hrms = dsp.RMS('Dimension','column');
    Xrms = step(hrms, input_matrix(:,1));
    Yrms = step(hrms, input_matrix(:,2));
    Zrms = step(hrms, input_matrix(:,3));
    
    features = [Xrms, Yrms, Zrms];
end
