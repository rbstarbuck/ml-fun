function examine_features()

load('subject_data.mat');

% For simple features, you can define them as such without making a
% function in a separate file (don't use an '@' when passing it, it's 
% already a function handle. Before writing your own feature, check to
% see if it's already included in Matlab, e.g. mean, var, rms...
f_meanabs = @(x) mean(abs(x));
f_medianabs = @(x) median(abs(x));

% set the segmentation values here
% if windowIncrement < windowSize, windows will overlap
windowSize = 512;
windowIncrement = 256;

% if you want to apply any smoothing, etc. to the data, do it here
a1 = action1_xyz;
a2 = action2_xyz;
a3 = action3_xyz;
a4 = action4_xyz;

% if you don't want a new figure window for each run, comment this out
figure

% the vectors passed as the first argument are values used for 'subplot'
% if you add or remove examine_features calls you'll need to change them
examine_feature([2, 3, 1], @mean,       a1, a2, a3, a4, windowSize, windowIncrement);
examine_feature([2, 3, 2], f_medianabs, a1, a2, a3, a4, windowSize, windowIncrement);
examine_feature([2, 3, 3], @var,        a1, a2, a3, a4, windowSize, windowIncrement);
examine_feature([2, 3, 4], f_meanabs,   a1, a2, a3, a4, windowSize, windowIncrement);
examine_feature([2, 3, 5], @rms,        a1, a2, a3, a4, windowSize, windowIncrement);
examine_feature([2, 3, 6], @max,        a1, a2, a3, a4, windowSize, windowIncrement);

end


function examine_feature(sp, featureHandle, action1, action2, action3, action4, windowSize, windowIncrement)

features1 = extract_features(action1(:,:), windowSize, windowIncrement, featureHandle);
features2 = extract_features(action2(:,:), windowSize, windowIncrement, featureHandle);
features3 = extract_features(action3(:,:), windowSize, windowIncrement, featureHandle);
features4 = extract_features(action4(:,:), windowSize, windowIncrement, featureHandle);

subplot(sp(1), sp(2), sp(3))
hold on
scatter3(features1(:,1), features1(:,2), features1(:,3), '+');
scatter3(features2(:,1), features2(:,2), features2(:,3), 'o');
scatter3(features3(:,1), features3(:,2), features3(:,3), '*');
scatter3(features4(:,1), features4(:,2), features4(:,3), 's');
hold off
title(sprintf('%s, WindowSize = %g, WindowIncrement = %g', func2str(featureHandle), windowSize, windowIncrement))
legend('Action 1', 'Action 2', 'Action 3', 'Action 4')
xlabel('X')
ylabel('Y')
zlabel('Z')

end
