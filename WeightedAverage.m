function [ rightLineEquationNew, leftLineEquationNew ] = WeightedAverage( rightLineEquation, leftLineEquation, leftLaneOld, rightLaneOld, alpha )

    if isempty(rightLaneOld) && isempty(leftLaneOld)
        rightLaneOld = rightLineEquation;
        leftLaneOld = leftLineEquation;
    end
    
    rightLaneOld = alpha .* rightLaneOld + (1 - alpha) .* rightLineEquation;
    leftLaneOld = alpha .* leftLaneOld + (1 - alpha) .* leftLineEquation;
    
    rightLineEquationNew = rightLaneOld;
    leftLineEquationNew = leftLaneOld;
    
end

