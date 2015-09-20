function outImage = corruptImage(inImage, dev)
    % .* is for point wise multiplication
    % Corrupt with zero mean, given standard deviation noise
    minIntensity = min(min(inImage));
    maxIntensity = max(max(inImage));
    dimensions = size(inImage);
    intensityDev = double(dev*(maxIntensity-minIntensity));
    % Noise, rounded values to nearest integer
    noise = round(0 + intensityDev.*randn(dimensions));
    outImage = double(inImage) + noise;
    outImage = round(outImage);
    % Boolean matrices, to put values in range
    % Note - not using the following 4 lines gives better results
    % Otherwise, there is salt and pepper noise
%     lowerBound = outImage >= 0;
%     upperBound = outImage <= 255;
%     outImage = outImage.*lowerBound;
%     outImage = outImage.*upperBound;
    % Image handling functions need unsigned integers
    outImage = uint8(outImage);
end