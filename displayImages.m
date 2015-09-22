function displayImages(inImage, outImage, path)
    % All arguments are by default optional, error if some variable is
    % undefined
    
    displayImage = figure(1);
    % Subplot of mXn images, numbered serially 1 through mn
    subplot(1,2,1);
    imshow(inImage);
    colorbar;
    title('Original');
    subplot(1,2,2);
    imshow(outImage);
    colorbar;
    title('Modified');
    
    if nargin > 2
        % If number of arguments is more than 2 (path also given)
        saveas(displayImage, path);
    end
end