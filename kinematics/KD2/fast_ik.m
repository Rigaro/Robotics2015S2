function jd = fast_ik(pose)
%implements fast inverse kinematics in elbow up position
%
%returns a joint displacement vector (in degrees) given a desired pose 
%[r_pos; r_ori] where r_pos = [x; y; z] is the desired position and
%r_ori = [a; b; c] is the desired vector direction in which the end
%effector points
%
%will cause error if an unreachable pose is specified

[design_params, motor_origins, e_eff] = init();

dE = e_eff + motor_origins(7);

rOE = pose(1:3);
ROE = zeros(3);
ROE(:, 3) = pose(4:6)/norm(pose(4:6));
nll = null(ROE(:, 3)');
ROE(:, 2) = nll(:, 1);
ROE(:, 1) = -nll(:, 2);

TOE = [ROE, rOE;
     [0 0 0 1]];

rOW = rOE - ROE*[0; 0; dE];

d3 = design_params(3, 3);
d5 = design_params(5, 3);

gamma = acos(-(norm(rOW)^2 - d3^2 - d5^2)/(2*d3*d5));

q4 = -(pi - gamma);

q2 = 2*atan2(-d5*sin(q4) - sqrt((d3+d5*cos(q4))^2 + (-d5*sin(q4))^2 - rOW(3)^2), d3 + d5*cos(q4) + rOW(3));

q1 = atan2(-rOW(2), -rOW(1));

T04 = [[ (-0.0833)*cos(q1)*cos(q2) + 0.9965*cos(q1)*sin(q2), 0.9965*cos(q1)*cos(q2) - (-0.0833)*cos(q1)*sin(q2), -sin(q1), 0.117*cos(q1)*sin(q2)];
[ (-0.0833)*cos(q2)*sin(q1) + 0.9965*sin(q1)*sin(q2), 0.9965*cos(q2)*sin(q1) - (-0.0833)*sin(q1)*sin(q2),  cos(q1), 0.117*sin(q1)*sin(q2)];
[                 0.9965*cos(q2) - (-0.0833)*sin(q2),               - (-0.0833)*cos(q2) - 0.9965*sin(q2),        0,         0.117*cos(q2)];
[                 0,                  0,        0,                          1]];

T4E_n = T04\TOE;

q6 = acos(-T4E_n(2, 3));
q7 = atan2(-T4E_n(2, 2), T4E_n(2, 1));
q5 = atan2(T4E_n(3, 3), T4E_n(1, 3));

q3 = 0;

jd = rad2deg([q1; q2; q3; q4; q5; q6; q7]);