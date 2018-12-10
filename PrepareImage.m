function [ img_gray ] = PrepareImage( img )
    img_gray = rgb2gray(img);
    img_gray = double(img_gray);
end

