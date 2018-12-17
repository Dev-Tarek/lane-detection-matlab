function [ rightLineEquationNew,leftLineEquationNew ] = WeightedAverage( rightLineEquation,leftLineEquation,alpha )
%WEIGHTEDAVERAGE Summary of this function goes here
%   Detailed explanation goes here
    persistent rightLaneOld
    persistent leftLaneOld
    if isempty(rightLaneOld) && isempty(leftLaneOld)
        rightLaneOld = rightLineEquation;
        leftLaneOld = leftLineEquation;
    end
    rightLaneOld = alpha .* rightLaneOld + (1 - alpha) .* rightLineEquation;
    leftLaneOld = alpha .* leftLaneOld + (1 - alpha) .* leftLineEquation;
    rightLineEquationNew = rightLaneOld;
    leftLineEquationNew = leftLaneOld;
end

