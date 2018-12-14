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
        
        
        %lines(k).theta
        %if (lines(k).theta < -10 && lines(k).theta > -60)
        %    rightLines = [rightLines lines(k)];
        %elseif (lines(k).theta > 10 && lines(k).theta < 60)
        %    leftLines = [leftLines lines(k)];
        %end
    end
end

