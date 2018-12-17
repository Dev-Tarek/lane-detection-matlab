function [ frame ] = DrawLines3( frame, line )
    
    x1 = line.point1(1);
    y1 = line.point1(2);
    x2 = line.point2(1);
    y2 = line.point2(2);
    frame = insertShape(frame, 'Line', [x1 y1 x2 y2], 'LineWidth', 2, 'Color', 'blue');
   
end