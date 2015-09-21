function outImage = laplacian(inImage)
    laplacianMask = [1 1 1; 1 -8 1; 1 1 1]; % Is normalised already
    % Normalising is important otherwise your image will saturate
    outImage = convolve(inImage, laplacianMask);
end