function [ ] = LaneDetection( video )
    initFrame = readFrame(video);
    display = imshow(initFrame);
    while hasFrame(video)
        image = readFrame(video);
        grayImage = PrepareImage(image);
        maskedImage = MaskImage(grayImage);
        blurImage = BlurImage(maskedImage, 4);
        edgesImage = DetectEdges(blurImage);
        roiImage = ROIMask(edgesImage);
        
        imshow(image), hold;
        
        detectedLines = DetectLines(roiImage);
        DrawLines(detectedLines), hold;
        drawnow;
    end
end

