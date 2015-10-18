function jd = iKineEuInv(pose)
%implements fast inverse kinematics
%default is elbow down
%
%returns a joint displacement vector (in degrees) given a desired pose
%[r_pos; r_ori] where r_pos = [x; y; z] is the desired position and
%r_ori = [a; b; c] is the desired euler angles in degrees.
%accepts matrix 6 by n and returns matrix 7 by n
%will cause error if in unreachable pose

%initialise parameters
[design_params, motor_origins, e_eff] = initInv();

%distance between wrist and end effector
dE = e_eff + motor_origins(7);

%distance between origin and elbow
d3 = design_params(3, 3);
%distance between elbow and wrist
d5 = design_params(5, 3);

jd = zeros(7, 1);
    
%set q3 = 0 (redundant manipulator)
q3 = 0;
%create reference position
rOE = pose(1:3, 1);
%create reference orientation using null space
ROE = eul2rotm(transpose(deg2rad(pose(4:6))));

%transformation between origin and end-effector
TOE = [ROE, rOE;
    [0 0 0 1]];

%find vector from origin to wrist
rOW = rOE - ROE*[0; 0; dE];

%find inner elbow angle using cos rule
gamma = acos(-(norm(rOW)^2 - d3^2 - d5^2)/(2*d3*d5));

%change between negative for "elbow up" and positive for "elbow down"
q4 = -(pi - gamma);

%compute q2
% q2 = 2*atan2(-d5*sin(q4) - sqrt((d3+d5*cos(q4))^2 + (-d5*sin(q4))^2 - rOW(3)^2), d3 + d5*cos(q4) + rOW(3));
q2 = 2*atan2((-d5*sin(q4) - sqrt((d3+d5*cos(q4))^2 + (-d5*sin(q4))^2 - rOW(3)^2)),(d3 + d5*cos(q4) + rOW(3)));

%compute q1. should possibly have positive arguments, but for some reason
%putting them negative makes it work. still not well understood. results
%can vary between MATLAB versions
% q1 = atan2(-rOW(2), -rOW(1));
q1 = atan2(-rOW(2),-rOW(1));

%numerical transformation matrix between origin and elbow
T04 = [[ cos(q1)*cos(q2)*cos(q4) - cos(q1)*sin(q2)*sin(q4), - cos(q1)*cos(q2)*sin(q4) - cos(q1)*cos(q4)*sin(q2), -sin(q1), 0.117*cos(q1)*sin(q2)];
    [ cos(q2)*cos(q4)*sin(q1) - sin(q1)*sin(q2)*sin(q4), - cos(q2)*sin(q1)*sin(q4) - cos(q4)*sin(q1)*sin(q2),  cos(q1), 0.117*sin(q1)*sin(q2)];
    [               - cos(q2)*sin(q4) - cos(q4)*sin(q2),                   sin(q2)*sin(q4) - cos(q2)*cos(q4),        0,         0.117*cos(q2)];
    [                                                 0,                                                   0,        0,                        1]];
%numerical transformation between elbow and end effector
T4E_n = T04\TOE;

%compute q6, q7, q5   
% q5 = atan2(T4E_n(3, 3), T4E_n(1, 3));
q5 = atan2(T4E_n(3, 3),T4E_n(1, 3));
q6 = acos(-T4E_n(2, 3));
q7 = atan2(-T4E_n(2, 2),T4E_n(2, 1));
if(q5 > deg2rad(150))
    q5 = q5 - pi;
    q6 = -q6;
    q7 = q7 + pi;
elseif(q5 < deg2rad(-150))
    q5 = q5 + pi;
    q6 = -q6;
    q7 = q7 - pi;
end



%convert to degrees and make between -180 and 180 before output
jd(:, 1) = rad2deg([q7; q6; q5; q4; q3; q2; q1]);
    
end