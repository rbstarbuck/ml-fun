%% abs_corr_coefficient_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = abs_corr_coefficient_handle(input_matrix)
   XYamcc = corrcoef(abs(input_matrix(:,1)), abs(input_matrix(:,2)));
   XYamcc = XYamcc(2,1);
   XZamcc = corrcoef(abs(input_matrix(:,1)), abs(input_matrix(:,3)));
   XZamcc = XZamcc(2,1);
   YZamcc = corrcoef(abs(input_matrix(:,2)), abs(input_matrix(:,3)));
   YZamcc = YZamcc(2,1);
   
   features = [XYamcc, XZamcc, YZamcc];
end