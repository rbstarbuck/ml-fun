function features = extract_features_tester(actionData, windowSize, windowIncrement, handle_list, weights)
%% EXTRACT_FEATURES Segments a 2D dataset and applies a feature extractor to each window
%  @param actionData The data to extract features from.
%  @param windowSize The number of data points (rows) in a single window.
%  @param windowIncrement The distance between start elements of consecutive 
%  windows; if < windowSize, windows will overlap.
%  @param featureHandle A function handle to a feature extractor that
%  accepts a N x 3 matrix
%  @return A M x N matrix of extracted features, where M = number of
%  windows and N = length of a feature extraction vector

segmentedData = segment(actionData, windowSize, windowIncrement);
numWindows = size(segmentedData, 3);
featureSize = size(handle_wrapper_tester(squeeze(segmentedData(:,:,1)), handle_list));
features = zeros(featureSize);
if nargin == 4
    for i = 1:numWindows
        features(i,:) = handle_wrapper_tester(squeeze(segmentedData(:,:,i)), handle_list);
    end
else
    for i = 1:numWindows
        features(i,:) = handle_wrapper_tester(squeeze(segmentedData(:,:,i)), handle_list, weights);
    end
end

end

