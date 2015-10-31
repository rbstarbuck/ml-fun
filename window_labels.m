function segmentedLabels = windowLabels(originalLabels, windowSize, windowIncrement)
%% WINDOWLABELS Generates labels for segmented data

lastWindowStart = (length(originalLabels) - windowSize);
lastWindowStart = lastWindowStart - mod(lastWindowStart, windowIncrement);
numWindows = lastWindowStart / windowIncrement;
lastWindowStart = lastWindowStart + 1;

segmentedLabels = zeros(numWindows, 1);

window = 1;
for start = 1:windowIncrement:lastWindowStart
    stop = start + windowSize - 1;
    segmentedLabels(window) = mode(originalLabels(start:stop));
    window = window + 1;
end

end

