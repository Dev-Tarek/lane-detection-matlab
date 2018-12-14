function [ offset ] = CarPositionOffset( rightLane,leftLane,imageWidth )
    meterPerPixel =  3.7 / 800;
    vechileCenter = (rightLane.point1(1)+leftLane.point1(1))/2;
    offset = (vechileCenter - imageWidth/2)*meterPerPixel;

end

