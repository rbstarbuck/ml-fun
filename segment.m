function segmentedData = segment(actionData, windowSize, increment)
%% SEGMENT Segments a M x N matrix of actionData into windows
%  @param actionData The 2D matrix to segment into windows.
%  @param windowSize The number of data points (rows) in a single window.
%  @param increment The distance between start elements of consecutive 
%  windows; if < windowSize, windows will overlap.
%  @return A (windowSize) x N x (numWindows) matrix of segmented data.

lastWindowStart = (size(actionData, 1) - windowSize);
lastWindowStart = lastWindowStart - mod(lastWindowStart, increment);
numWindows = lastWindowStart / increment;
lastWindowStart = lastWindowStart + 1;

segmentedData = zeros(windowSize, size(actionData, 2), numWindows);
s = size(segmentedData);

window = 1;
for start = 1:increment:lastWindowStart
    stop = start + windowSize - 1;
    segmentedData(:,:,window) = actionData(start:stop,:);
    window = window + 1;
end


end

