function [ line ] = ConstructLineFromParameters( line )
    y1 = 680;
    x1 = (y1 - line(2)) / line(1);
    y2 = 450;
    x2 = (y2 - line(2)) / line(1);
    line = struct('point1', [x1, y1], 'point2', [x2, y2]);
    if isnan(x1) || isnan(x2)
        line = NaN;
    end;
end

