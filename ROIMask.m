function [ image ] = ROIMask( image )
    [x, y] = size(image);
    X = [0, (y/2)-(y/4), (y/2)+(y/4), y];
    Y = [x, x/2, x/2, x];
    mask = poly2mask(X, Y, x, y);
    image = bitand(image, mask);
end

