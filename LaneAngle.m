function [ angle,rotation ] = LaneAngle( lane1, lane2 )
    %angle1 = atand(lane1.point(1,2)-lane1.point(2,2)/lane1.point(1,1)-lane1.point(2,1));
    %angle2 = atand(lane2.point(1,2)-lane2.point(2,2)/lane2.point(1,1)-lane2.point(2,1));
    %angle = (angle1 + angle2)/2;
    xLower = (lane1.point1(1) + lane2.point1(1)) / 2;
    yLower = lane1.point1(2);
   
    xUpper = (lane1.point2(1) + lane2.point2(1)) / 2;
    yUpper = lane1.point2(2);
    
    angle = atand(-(yUpper-yLower)/(xUpper-xLower));  
    
    if(angle>0)
       angle = 90-angle;
       rotation = 'R';
    else
       angle = 90+angle;
       rotation = 'L';
    end
    
    
    
end


