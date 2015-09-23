function outImage = myButterworthFiltering(inImage, d0)
    n = 2;  % Order of the filter
    ft = fft2(inImage);
    [uMax vMax] = size(ft);
    h = zeros([uMax vMax]);
    for u = 1:uMax
        for v = 1:vMax
            h(u,v) = 1/(1+((u+v)/d0)^n);
        end
    end
    outFt = h.*ft;
    outImage = ifft2(outFt);
    % Was getting some rounding erros, which eas leading to complex values
    % in outImage. Solution - take real part.
    outImage = real(outImage);
    outImage = uint8(outImage);
    
%     d0 = abs(max(max(ft)));
%     h = 1./(1+(abs(ft)/d0)).^2;
%     ft = h.*ft;
%     outImage = ifft2(ft);
%     outImage = uint8(outImage);
end