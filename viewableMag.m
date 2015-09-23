function vMag = viewableMag(mag)
    % Without perceptual scaling, can't really check out spectrum
    % log(0) isn't defined, hence adding 1
    vMag = mat2gray(log(mag+1));
end