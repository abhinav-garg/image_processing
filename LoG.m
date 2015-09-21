function outImage = LoG(inImage)
    % Laplacian of Gaussian, same as blurring first and then taking
    % derivative
    LoGMask = [0 0 -1 0 0; 0 -1 -2 -1 0; -1 -2 16 -2 -1; 0 -1 -2 -1 0; 0 0 -1 0 0];
    outImage = convolve(inImage, LoGMask);
end