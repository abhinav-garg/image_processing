function outImage = convolve(inImage, mask)
    % Slow version, vectorise the convolution later
    
    [imXMax imYMax] = size(inImage);
    [maskXMax maskYMax] = size(mask);
    
    % Add some padding for convolution
    % Mask will usually have odd by odd dimensions
    % Half mask will overflow at boundary, excluding central entry
    % (maskXMax-1)/2 + imXMax + (maskXMax-1)/2
    paddedInImage = zeros([imXMax+(maskXMax-1) imYMax+(maskYMax-1)]);
    startRow = 1 + (maskXMax-1)/2; % indexing does not start from 0, careful
    endRow = imXMax + (maskXMax-1)/2;
    startCol = 1 + (maskYMax-1)/2;
    endCol = imYMax + (maskXMax-1)/2;
    paddedInImage(startRow:endRow, startCol:endCol) = inImage;
    paddedOutImage = zeros(size(paddedInImage));
    
    % Outer two loops run through the image
    for x = startRow:endRow
        for y = startCol:endCol
            % Inner two loops run through the mask
            for i = -(maskXMax-1)/2:(maskXMax-1)/2
                for j = -(maskXMax-1)/2:(maskXMax-1)/2
                    paddedOutImage(x,y) = paddedOutImage(x,y) + paddedInImage(x+i,y+j)*mask(1+i+(maskXMax-1)/2,1+j+(maskXMax-1)/2);
                end
            end
        end
    end
    outImage = uint8(paddedOutImage(startRow:endRow, startCol:endCol));
end