% Offsets real motor angles to simulation values
% Robot zero in motor angles is 150 deg.
% Modelled zero is 0 deg.
function simJoint = offsetSimJoint(motorJoint)
    simJoint = zeros([7, 1]);
    for i=1:1:7
        %Joint 4 moves in opposite direction
        if(i==4)
            simJoint(i) = -(motorJoint(i) - 150);
        else
            simJoint(i) = motorJoint(i) - 150;
        end
    end
end