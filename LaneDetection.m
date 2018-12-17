function [ frame ] = LaneDetection( frame )
    
    grayImage = PrepareImage(frame);
    maskedImage = MaskImage(grayImage);
    blurImage = BlurImage(maskedImage, 4);
    edgesImage = DetectEdges(blurImage);
    roiImage = ROIMask(edgesImage);
    detectedLines = DetectLines(roiImage);
    
    [leftLines, rightLines] = SplitLinesBySlope(detectedLines);
    leftLines = SortLines(leftLines);
    rightLines = SortLines(rightLines);
    
    rightLine = AverageLines(rightLines,30);
    leftLine = AverageLines(leftLines,30);
    
    rightLineEquation = FindLineEquation(rightLine);
    leftLineEquation = FindLineEquation(leftLine);
    
    [rightLineEquation, leftLineEquation] = WeightedAverage(rightLineEquation, leftLineEquation, .8);
    
    rightLane = ConstructLineFromParameters(rightLineEquation);
    leftLane = ConstructLineFromParameters(leftLineEquation);
    
    if ~isstruct(rightLane) || ~isstruct(leftLane)
        return;
    end
    
    frame = DrawLines3(frame, leftLane);
    frame = DrawLines3(frame, rightLane);

    [angle, r] = LaneAngle(rightLane,leftLane);
    
    [r,c,d] = size(frame);
    offset = CarPositionOffset(rightLane,leftLane,c);
    
    
    frame = Draw4(frame,offset,r,c);
    frame = insertShape(frame, 'Circle', [(rightLane.point1(1)+leftLane.point1(1))/2 r-10 1], 'LineWidth', 2, 'Color', 'blue');

    %frame = insertShape(frame, 'Line', [c/2 0 c/2 720], 'LineWidth', 2, 'Color', 'blue');

    %frame = DrawLines2(frame, rightLine);
    %frame = DrawLines2(frame, leftLine);
  
    
end

