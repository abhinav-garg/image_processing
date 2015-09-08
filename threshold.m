function outImage = threshold(inImage, cutoffIntensity)
    
    % One way of doing it, using for loops
    outImageSlow = ones(size(inImage))*255;
    for i = 1:size(inImage, 1)
        for j = 1:size(inImage, 2)
            if inImage(i,j) >= cutoffIntensity
                outImageSlow(i,j) = inImage(i,j);
            end
        end
    end
    
    
    % Faster way of doing it is to vectorise
    inImage = double(inImage); % need to support all Math operations
    isOverCutoff = inImage >= cutoffIntensity; % Creates a boolean matrix
    % .* and .^ are operators to do point wise multiplication
    outImage = inImage.*isOverCutoff; 
    % 0 maps to black, 255 to white
    outImage = inImage + (isOverCutoff == 0)*255;
    
    % Need to convert to compatible data-type for imshow
    outImage = uint8(outImage);
    outImageSlow = uint8(outImageSlow);
    inImage = uint8(inImage);
    % Displays the image, and saves the results
    displayImage = figure(1);
    % Subplot of mXn images, numbered serially 1 through mn
    subplot(2,2,1);
    imshow(inImage);
    colorbar;
    title('Original');
    subplot(2,2,2);
    imshow(outImage);
    colorbar;
    title('Thresholded - vectorised');
    subplot(2,2,3);
    imshow(outImageSlow);
    colorbar;
    title('Thresholded - slower version');
    subplot(2,2,4);
    imshow(outImage-outImageSlow);
    colorbar;
    title('Difference');
    saveas(displayImage, 'threshold.png');
end