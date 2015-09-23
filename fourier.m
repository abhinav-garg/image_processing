function [ft mag phase] = fourier(inImage)
    % Returns fourier transform, spectrum (mag) and phase of an image
    
    % 2D Fourier transform
    ft = fft2(inImage);
    
    % Center the transform 
    % Clarify - is the use only for cosmetic purposes?
    % - It gives unexpected results if used
    ft = fftshift(ft);
    
    % Spectrum and Phase spectrum
    mag = abs(ft);
    phase = angle(ft);
    
    % Note that for viewing you'll have to scale logarithmically
end