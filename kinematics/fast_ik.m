function jd = fast_ik(pose)
%implements fast inverse kinematics in elbow up position
%
%returns a joint displacement vector (in degrees) given a desired pose 
%[r_pos; r_ori] where r_pos = [x; y; z] is the desired position and
%r_ori = [a; b; c] is the desired vector direction in which the end
%effector points
%
%will cause error if an unreachable pose is specified

%initialise parameters
[design_params, motor_origins, e_eff] = init();

%distance between wrist and end effector
dE = e_eff + motor_origins(7);

%create reference position
rOE = pose(1:3);
%create reference orientation using null space
ROE = zeros(3);
ROE(:, 3) = pose(4:6)/norm(pose(4:6));
nll = null(ROE(:, 3)');
ROE(:, 2) = nll(:, 1);
ROE(:, 1) = -nll(:, 2);

%transformation between origin and end-effector
TOE = [ROE, rOE;
     [0 0 0 1]];

%find vector from origin to wrist
rOW = rOE - ROE*[0; 0; dE];

%distance between origin and elbow
d3 = design_params(3, 3);
%distance between elbow and wrist
d5 = design_params(5, 3);

%find inner elbow angle using cos rule
gamma = acos(-(norm(rOW)^2 - d3^2 - d5^2)/(2*d3*d5));

%change between negative for "elbow up" and positive for "elbow down"
q4 = -(pi - gamma);

%compute q2
q2 = 2*atan2(-d5*sin(q4) - sqrt((d3+d5*cos(q4))^2 + (-d5*sin(q4))^2 - rOW(3)^2), d3 + d5*cos(q4) + rOW(3));

%compute q1. should possibly have positive arguments, but for some reason
%putting them negative makes it work. still not well understood. results
%can vary between MATLAB versions
q1 = atan2(-rOW(2), -rOW(1));

%numerical transformation matrix between origin and elbow
T04 = [[ cos(q1)*cos(q2)*cos(q4) - cos(q1)*sin(q2)*sin(q4), - cos(q1)*cos(q2)*sin(q4) - cos(q1)*cos(q4)*sin(q2), -sin(q1), 0.102*cos(q1)*sin(q2)];
[ cos(q2)*cos(q4)*sin(q1) - sin(q1)*sin(q2)*sin(q4), - cos(q2)*sin(q1)*sin(q4) - cos(q4)*sin(q1)*sin(q2),  cos(q1), 0.102*sin(q1)*sin(q2)];
[               - cos(q2)*sin(q4) - cos(q4)*sin(q2),                   sin(q2)*sin(q4) - cos(q2)*cos(q4),        0,         0.102*cos(q2)];
[                                                 0,                                                   0,        0,                        1]];
%numerical transformation between elbow and end effector
T4E_n = T04\TOE;

%compute q6, q7, q5
q6 = acos(-T4E_n(2, 3));
q7 = atan2(-T4E_n(2, 2), T4E_n(2, 1));
q5 = atan2(T4E_n(3, 3), T4E_n(1, 3));

%set q3 = 0 (redundant manipulator)
q3 = 0;

%convert to degrees and make between -180 and 180 before output
jd = mod(rad2deg([q1; q2; q3; q4; q5; q6; q7]) + 180, 360) - 180;