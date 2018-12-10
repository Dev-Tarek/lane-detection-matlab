function [ image ] = MaskImage( image )
    [m, n] = size(image);
    for i=1:n
        for j=1:m
             if (image(j,i) < 195)
                 image(j,i)=0;
             else 
                 image(j,i)=255;
             end
        end
    end
end

