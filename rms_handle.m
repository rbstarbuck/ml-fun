% rms_handle
% author Yixing Liu
% created on October 19, 2015
% last modified on October 19, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = rms_handle(input_matrix)
    hrms = dsp.RMS('Dimension','column');
    Xrms = step(hrms, input_matrix(:,1));
    Yrms = step(hrms, input_matrix(:,2));
    Zrms = step(hrms, input_matrix(:,3));
    
    features = [Xrms, Yrms, Zrms];
end
