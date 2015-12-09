%% abs_mean_autocorr_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = abs_mean_autocorr_handle(input_matrix)
   Xamac = mean(autocorr(abs(input_matrix(:,1))));
   Yamac = mean(autocorr(abs(input_matrix(:,2))));
   Zamac = mean(autocorr(abs(input_matrix(:,3))));
    
   features = [Xamac, Yamac, Zamac];
end