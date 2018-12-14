function [ line ] = AverageLines( lines, n )
    line = struct('point1',[0 0],'point2',[0 0],'theta',0,'rho',0);
    len = min(length(lines),n);
    for i=1:len
        line.point1 = line.point1 + lines(i).point1/len;
        line.point2 = line.point2 + lines(i).point2/len;
        line.theta = line.theta + lines(i).theta/len;
        line.rho = line.rho + lines(i).rho/len;
    end
end

