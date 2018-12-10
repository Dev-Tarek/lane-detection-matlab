function [ ] = LaneDetection( video )
    videoFrames = read(video);
    framesCount = video.NumberOfFrames;
    for i = 1 : framesCount
        image = videoFrames(:,:,i);
        grayImage = PrepareImage(image);
        maskedImage = MaskImage(grayImage);
        blurImage = BlurImage(maskedImage, 4);
        edgesImage = DetectEdges(blurImage);
        
        imshow(image), hold;
        
        detectedLines = DetectLines(edgesImage);
        DrawLines(detectedLines), hold;
        
    end
end

