function [ img ] = DetectEdges( img )
    img = edge(img, 'canny');
end