function features = extract_features(actionData, windowSize, windowIncrement, featureHandle)
%% EXTRACT_FEATURES Segments a 2D dataset and applies a feature extractor to each window
%  @param actionData The data to extract features from.
%  @param windowSize The number of data points (rows) in a single window.
%  @param windowIncrement The distance between start elements of consecutive 
%  windows; if < windowSize, windows will overlap.
%  @param featureHandle A function handle to a feature extractor that
%  accepts a N x 3 matrix
%  @return A M x N matrix of extracted features, where N = number of
%  windows and M = length of a feature extraction vector

segmentedData = segment(actionData, windowSize, windowIncrement);
numWindows = size(segmentedData, 3);
featureSize = size(featureHandle(squeeze(segmentedData(:,:,1))));
features = zeros(featureSize);

for i = 1:numWindows
    features(i,:) = featureHandle(squeeze(segmentedData(:,:,i)));
end

end

