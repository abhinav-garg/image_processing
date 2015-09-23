function RMSD = calcRMSD(image1, image2);
    dim = size(image1);
    N = dim(1)*dim(2);
    diff = (image1-image2).^2;
    RMSD = sum(sum(diff))/N;
end