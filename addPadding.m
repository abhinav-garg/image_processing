function paddedImage = addPadding(image, mask)
    % Returns a zero padded image as per the mask size
    
    [imXMax imYMax] = size(image);
    [maskXMax maskYMax] = size(mask);
    
    % Mask will usually have odd by odd dimensions
    % Half mask will overflow at boundary, excluding central entry
    % (maskXMax-1)/2 + imXMax + (maskXMax-1)/2
    paddedImage = zeros([imXMax+(maskXMax-1) imYMax+(maskYMax-1)]);
    startRow = 1 + (maskXMax-1)/2; % indexing does not start from 0, careful
    endRow = imXMax + (maskXMax-1)/2;
    startCol = 1 + (maskYMax-1)/2;
    endCol = imYMax + (maskXMax-1)/2;
    paddedImage(startRow:endRow, startCol:endCol) = image;
end