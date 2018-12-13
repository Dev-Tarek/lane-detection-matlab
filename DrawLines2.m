function [ frame ] = DrawLines2( frame, lines )
    for k = 1:length(lines)
       xy = [lines(k).point1; lines(k).point2];
       x1 = xy(1,1);
       y1 = xy(1,2);
       x2 = xy(2,1);
       y2 = xy(2,2);
       frame = insertShape(frame, 'Line', [x1 y1 x2 y2], 'LineWidth', 2, 'Color', 'blue');
    end
end