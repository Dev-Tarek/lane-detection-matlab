function [ offset ] = CarPositionOffset( rightLane, leftLane, imageWidth )
    meterPerPixel =  3.7 / 800;
    roadCenter = (rightLane.point1(1)+leftLane.point1(1))/2;
    offset = (roadCenter - imageWidth/2)*meterPerPixel;
end

