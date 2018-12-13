function [ leftLines, rightLines ] = SplitLinesBySlope( lines )
    leftLines = [];   
    rightLines = [];
    for k = 1:length(lines)
        slope = GetSlope(lines(k));
        if (slope < -0.4)
            leftLines = [leftLines lines(k)];
        elseif (slope > 0.4)
            rightLines = [rightLines lines(k)];
        end
    end
end

