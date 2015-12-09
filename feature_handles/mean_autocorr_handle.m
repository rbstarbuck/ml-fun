%% mean_autocorr_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = mean_autocorr_handle(input_matrix)
   Xmac = mean(autocorr(input_matrix(:,1)));
   Ymac = mean(autocorr(input_matrix(:,2)));
   Zmac = mean(autocorr(input_matrix(:,3)));
    
   features = [Xmac, Ymac, Zmac];
end