function prediction = centroid_classification(testData, windowSize, centroidSize, classifier, featureHandle)
%% CENTROID_CLASSIFICATION
% Classify by using a window of size n, labeling a subset of points of size
% k < n at the center of the window, then moving the window up by k.

prediction = zeros(length(testData), 1);

features = extract_features(testData, windowSize, centroidSize, featureHandle);

numSegments = size(features,1);
centroidOffset = floor((windowSize - centroidSize + 1) / 2);

for seg = 1:numSegments
    label = classifier(features(seg,:));
    baseIndex = (seg - 1) * centroidSize + centroidOffset;
    prediction(baseIndex:baseIndex + centroidOffset) = label;
end

end

