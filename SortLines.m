function [ lines ] = SortLines( lines )
    sorted = 0;
    while ~sorted
        sorted = 1;
        for k = 1:length(lines)-1
            line1 = [lines(k).point1; lines(k).point2];
            line2 = [lines(k+1).point1; lines(k+1).point2];
            if (max(line1(1,2), line1(2,2)) < max(line2(1,2), line2(2,2)))
                temp =lines(k+1);
                lines(k+1)=lines(k);
                lines(k)=temp;
                sorted = 0;
            end  
        end 
    end 
end