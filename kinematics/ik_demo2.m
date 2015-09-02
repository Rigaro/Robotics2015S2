%script to help analytically help solve inverse kinematics
clc
clear all

%reference position
rOE = [0.01; 0.01; 0.25];
%orientation pointing up
ROE = eye(3);

%transformation matrix
TOE = [ROE, rOE;
     [0 0 0 1]];

%initialise parameters
[design_params, motor_origins, e_eff] = init();

%distance between wrist and end effector
dE = e_eff + motor_origins(7);

%symbolic angles
syms 'q1' 'q2' 'q3' 'q4' 'q5' 'q6' 'q7'

%set q3 = 0 (redundant manipulator)
q3 = 0;

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

%symbolic joint displacement vector
jd = [q1; q2; q3; q4; q5; q6; q7];

%symbolic denavit-hartenberg table
dh_table = [design_params, jd];

%symbolic tranformation matrices
T = transformation_matrices(dh_table);

%the expressions below were found by looking at the symbolic tranformation
%matrices

%==========================these did not work well
%q2 = double(vpasolve(rOW(3) == T(3, 4, 5)));
%q1 = double(vpasolve(rOW(2) == subs(T(2, 4, 5), 'q2', q2)));
%==========================

%compute q2 numerically
q2 = 2*atan2(-d5*sin(q4) - sqrt((d3+d5*cos(q4))^2 + (-d5*sin(q4))^2 - rOW(3)^2), d3 + d5*cos(q4) + rOW(3));

%compute q1 numerically
%should have positive arguments by comparing the T matrix, but for some
%reason only putting them negative makes it work. 
%still not well understood
%results can even vary between MATLAB versions 
%(eg. needed positive in R2012b)
q1 = atan2(-rOW(2), -rOW(1));

%alternate solutions for q1. neither worked well when tested (gave wrong
%sign in task space)
%q1 = acos(rOW(1)/(d3*sin(q2) + d5*cos(q2)*sin(q4) + d5*cos(q4)*sin(q2)));
%q1 = asin(rOW(2)/(d3*sin(q2) + d5*cos(q2)*sin(q4) + d5*cos(q4)*sin(q2)));

%substitute numerical values into the symbolic matrix from 0 to 4 (elbow)
T04 = subs(T(:, :, 4), 'q1', q1);
T04 = subs(T04, 'q2', q2);
T04 = double(subs(T04, 'q4', q4));

%numerical transformation between elbow and end effector
T4E_n = inv(T04)*TOE;

%transformation between 7 and end effector
T7E = [eye(3), [0; 0; dE];
       [0 0 0 1]];

%this code computes symbolically the transformation between 4 and 7
%WARNING: uncommenting may cause errors because this used to use overriden
%rotx and rotz which used radians (and could compute symbolically)
%to make it work again, recreate rotx and rotz which are now nested
%functions in transformation matrices
% T_prev = eye(4);
% for i = 5:7
%    Rx = [rotx(dh_table(i, 1)), [0; 0; 0];
%        [0 0 0 1]];
%       Dx = [eye(3), [dh_table(i, 2); 0; 0];
%        [0 0 0 1]];
%        Rz = [rotz(dh_table(i, 4)), [0; 0; 0];
%        [0 0 0 1]];
%       Dz = [eye(3), [0; 0; dh_table(i, 3)];
%        [0 0 0 1]];
%    T47 = T_prev*Rx*Dx*Rz*Dz;
%    T_prev = T47;
% end
%%analytical (symbolic) 
% T4E_a = T47*T7E;

%the expressions below were found by looking at the symbolic tranformation
%T4E_a 

%compute the remaining angles
q6 = acos(-T4E_n(2, 3));
q7 = atan2(-T4E_n(2, 2), T4E_n(2, 1));
q5 = atan2(T4E_n(3, 3), T4E_n(1, 3));

%plotting to see results
plot_robot(rad2deg([q1; q2; q3; q4; q5; q6; q7]))
scatter3([rOE(1) rOW(1)], [rOE(2) rOW(2)], [rOE(3) rOW(3)])