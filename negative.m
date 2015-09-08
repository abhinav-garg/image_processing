function outImage = negative(inImage)
    outImage = 255 - inImage;
    
    % Displays the image, and saves the results
    displayImage = figure(1);
    % Subplot of mXn images, numbered serially 1 through mn
    subplot(1,2,1);
    imshow(inImage);
    colorbar;
    title('Original');
    subplot(1,2,2);
    imshow(outImage);
    colorbar;
    title('Negative');
    saveas(displayImage, 'negative.png');
end