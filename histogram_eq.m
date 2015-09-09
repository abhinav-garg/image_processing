function outImage = histogram_eq(inImage)
    [sizeX, sizeY] = size(inImage);
    outImage = zeros(sizeX, sizeY);
    intensities = zeros(256,1);
    for i = 1:sizeX
       for j = 1:sizeY
           intensities(inImage(i,j)+1) = intensities(inImage(i,j)+1)+1;
       end
    end
    hist = cumsum(intensities);
    hist = hist/sum(intensities)*255;
    for i = 1:sizeX
       for j = 1:sizeY
           outImage(i,j) = round(hist(inImage(i,j)+1));
       end
    end
    
    intensitiesOut = zeros(256,1);
    for i = 1:sizeX
       for j = 1:sizeY
           intensitiesOut(outImage(i,j)+1) = intensitiesOut(outImage(i,j)+1)+1;
       end
    end
    histOut = cumsum(intensitiesOut);
    histOut = hist/sum(intensitiesOut)*256;
    % Plotting
    % Histogram plots
    statsPlot = figure(1);
    subplot(2,2,1);
    plot(0:255, hist);
    subplot(2,2,2);
    plot(0:255, intensities);
    subplot(2,2,3);
    plot(0:255, histOut);
    subplot(2,2,4);
    plot(0:255, intensitiesOut);
    
    % Need to convert to compatible data-type for imshow
    outImage = uint8(outImage);
    inImage = uint8(inImage);
    % Displays the image, and saves the results
    displayImage = figure(2);
    % Subplot of mXn images, numbered serially 1 through mn
    subplot(2,1,1);
    imshow(inImage);
    colorbar;
    title('Original');
    subplot(2,1,2);
    imshow(outImage);
    colorbar;
    title('Histogram Equalisation');
    saveas(displayImage, 'histogram_eq.png');
end