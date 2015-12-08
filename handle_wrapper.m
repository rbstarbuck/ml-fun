% handle_wrapper
% author Yixing Liu
% created on October 19, 2015
% last modified on October 19, 2015
% @param input matrix is a a N x 3 matrix
% @return a row vector

function features = handle_wrapper(input_matrix)

 % you can add or modify function references and weights here
 %  FROM RICHMOND: how does multiplying the handle output by a constant
 %  weight the feature?
 f1 = @abs_mean_handle;
 weight1 = 1;
 f2 = @rms_handle;
 weight2 = 1;
 f3 = @var;
 weight3 = 1;
 f4 = @pca_handle;
 weight4 = 0.7;
 features = [weight1*f1(input_matrix), weight2*f2(input_matrix), weight3*f3(input_matrix), weight4*f4(input_matrix,10)];
end
