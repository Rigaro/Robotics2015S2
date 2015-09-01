% Checks that the given position is within the joint Limits
function res = checkJointLim(desPos)
    if(desPos(1)<0||desPos(1)>300||desPos(2)<50||desPos(2)>250||...
       desPos(3)<0||desPos(3)>300||desPos(4)<50||desPos(4)>250||...
       desPos(5)<0||desPos(5)>300||desPos(6)<50||desPos(6)>250||...
       desPos(7)<0||desPos(7)>300)
        res = 0;
    else
        res = 1;
    end
end