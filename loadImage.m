function inImage = loadImage(path)
    % First three lines help find the extension
    formatLoc = strfind(path, '.');
    formatLoc = formatLoc(end);
    extension = path(formatLoc+1:end);
    inImage = imread(path, extension)
end 