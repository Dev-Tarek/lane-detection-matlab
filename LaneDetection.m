function [ frame ] = LaneDetection( frame )
    
    actual_image = frame;
    
    % Variables to save previous lines.
    persistent rightLaneOld;
    persistent leftLaneOld;
    
    % Processing image to get all lines in ROI.
    grayImage = PrepareImage(frame);
    maskedImage = MaskImage(grayImage);
    blurImage = BlurImage(maskedImage, 4);
    edgesImage = DetectEdges(blurImage);
    roiImage = ROIMask(edgesImage);
    detectedLines = DetectLines(roiImage);
    
    [leftLines, rightLines] = SplitLinesBySlope(detectedLines);
    
    % Drawing previous line if no lines were detected in current frame.
    if ~length(leftLines) || ~length(rightLines)
        if isempty(leftLaneOld) || isempty(rightLaneOld)
            return;
        end
        frame = DrawLine(frame, ConstructLineFromParameters(leftLaneOld));
        frame = DrawLine(frame, ConstructLineFromParameters(rightLaneOld));
        return;
    end

    % Sort lines by closest to bottom of camera.
    leftLines = SortLines(leftLines);
    rightLines = SortLines(rightLines);
    
    % Average nearest 2 lines to the bottom of the image
    rightLine = AverageLines(rightLines, 2);
    leftLine = AverageLines(leftLines, 2);
    
    % Get the equations of the resulting lines
    rightLineEquation = FindLineEquation(rightLine);
    leftLineEquation = FindLineEquation(leftLine);
    
    [rightLineEquation, leftLineEquation ] = ...
       WeightedAverage(rightLineEquation, leftLineEquation, leftLaneOld, rightLaneOld, .8);
    
    % Update last lines
    leftLaneOld = leftLineEquation;
    rightLaneOld = rightLineEquation;
    
    % Get lines as structs from the weighted averaged lines
    rightLane = ConstructLineFromParameters(rightLineEquation);
    leftLane = ConstructLineFromParameters(leftLineEquation);
    
    frame = DrawLine(frame, leftLane);
    frame = DrawLine(frame, rightLane);
    
    [r, c, d] = size(frame);
    offset = CarPositionOffset(rightLane,leftLane,c);
    
    frame = DrawDirection(frame, offset, r, c);
    frame = insertShape(frame, 'Circle', [(rightLane.point1(1)+leftLane.point1(1))/2 r-10 1], 'LineWidth', 2, 'Color', 'green');

end