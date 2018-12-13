function [ result ] = LaneDetection( frame )

    grayImage = PrepareImage(frame);
    maskedImage = MaskImage(grayImage);
    blurImage = BlurImage(maskedImage, 4);
    edgesImage = DetectEdges(blurImage);
    roiImage = ROIMask(edgesImage);
    detectedLines = DetectLines(roiImage);
    [leftLines, rightLines] = SplitLinesBySlope(detectedLines);
    leftLines = SortLines(leftLines);
    rightLines = SortLines(rightLines);
    try
        result = DrawLines2(frame, rightLines(1:2));
    catch
        result = DrawLines2(frame, rightLines);
    end
    
end

