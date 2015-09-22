% Performs inverse differential kinematics.
% @parm desTaskSpeed desired Task Space speed x, y, z and Euler
% angles.
% @return qDot the angular velocity of each joint.
function qDot = diffIKine(desTaskSpeed,desJoint)
% Obtain the jacobian for the current joint angles.
Jacob = getJacob(desJoint);
% Inverse jacobian.
qDot_temp = inv(Jacob)*desTaskSpeed;
% q3=0 to avoid redundancy.
qDot = [qDot_temp(1:2);0;qDot_temp(3:6)];
end