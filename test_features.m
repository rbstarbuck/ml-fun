
%{
% you can add or modify function references and weights here
 %  FROM RICHMOND: how does multiplying the handle output by a constant
 %  weight the feature?
 f1 = @abs_mean_handle;
 weight1 = 1;
 f2 = @rms_handle;
 weight2 = 1;
 f3 = @var;
 weight3 = 1;
 f4 = @(x) median(abs(x));
 weight4 = 1;
 
 %Michael handle additions
 f5 = @abs_std_handle;
 weight5 = 1;
 f6 = @abs_average_peak_handle;
 weight6 = 1;
 f7 = @abs_skewness_handle;
 weight7 = 1;
 f8 = @abs_kurtosis_handle;
 weight8 = 1;
 f9 = @energy_handle;
 weight9 = 1;
 
 weight10 = 1.2;
 f10 = @pca_handle;
 
 f5 = @abs_std_handle;
 weight5 = 1;
 
 f5 = @abs_std_handle;
 weight5 = 1;
 
 f5 = @abs_std_handle;
 weight5 = 1;
 
 f5 = @abs_std_handle;
 weight5 = 1;
 
 f5 = @abs_std_handle;
 weight5 = 1;
%}
weight1 = 1;
f1 = @rms_handle;
 features = [weight1*f1(input_matrix)];
 accuracy = centroid_test_features(features)
 f1 = @abs_fft_rms_handle;
 features = [weight1*f1(input_matrix)];
 accuracy = centroid_test_features(features)
 f1 = @energy_handle;
 features = [weight1*f1(input_matrix)];
 accuracy = centroid_test_features(features)
 f1 = @entropy_handle;
 features = [weight1*f1(input_matrix)];
 accuracy = centroid_test_features(features)
 f1 = @fft_rms_handle;
 features = [weight1*f1(input_matrix)];
 accuracy = centroid_test_features(features)
 