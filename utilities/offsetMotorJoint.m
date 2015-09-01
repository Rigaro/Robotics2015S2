% Offsets simulation values to real motor angles
% Robot zero in motor angles is 150 deg.
% Modelled zero is 0 deg.
function motorJoint = offsetMotorJoint(simJoint)
    motorJoint = zeros([7, 1]);
    for i=1:1:7
        %Joint 4 moves in opposite direction
        if(i==4)
            motorJoint(i) = -simJoint(i) + 150;
        else
            motorJoint(i) = simJoint(i) + 150;
        end
    end
end