function [ slope ] = GetSlope( line )

    points=[line.point1; line.point2];

    x1=points(1,1);
    y1=points(1,2);
    x2=points(2,1);
    y2=points(2,2);

    slope=(y2-y1)/(x2-x1);

end