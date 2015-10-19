% handle_wrapper
% author Yixing Liu
% created on October 19, 2015
% last modified on October 19, 2015
% @param input matrix is a a N x 3 matrix
% @return a row vector

function features = handle_wrapper(input_matrix)

 % you can add or modify function references and weights here
 f1 = @abs_mean_handle;
 weight1 = 1;
 f2 = @rms_handle;
 weight2 = 1;
 
 features = [weight1*f1(input_matrix), weight2*f2(input_matrix)];
end
