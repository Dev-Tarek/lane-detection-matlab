function [ blurImage ] = BlurImage( image, b )
    intImage = integralImage(image);
    avgH = integralKernel([1 1 b b], 1/b^2);
    blurImage = integralFilter(intImage, avgH);
    % blurImage = uint8(blurImage);
end

