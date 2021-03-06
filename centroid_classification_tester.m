function prediction = centroid_classification_tester(testData, windowSize, centroidSize, classifier, handle_list, weights)
%% CENTROID_CLASSIFICATION
% Classify by using a window of size n, labeling a subset of points of size
% k < n at the center of the window, then moving the window up by k.

prediction = zeros(length(testData), 1);

if nargin == 5
    features = extract_features_tester(testData, windowSize, centroidSize, handle_list);
else
    features = extract_features_tester(testData, windowSize, centroidSize, handle_list, weights);
end

numSegments = size(features,1);
centroidOffset = floor((windowSize - centroidSize + 1) / 2);

for seg = 1:numSegments
    label = classifier(features(seg,:));
    baseIndex = (seg - 1) * centroidSize + centroidOffset;
    prediction(baseIndex:baseIndex + centroidOffset) = label;
end

end

