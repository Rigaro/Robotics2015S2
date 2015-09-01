clc
clear all

rOE = [0.01; 0.01; 0.25];
ROE = eye(3);

TOE = [ROE, rOE;
     [0 0 0 1]];

[design_params, motor_origins, e_eff] = init();

dE = e_eff + motor_origins(7);

syms 'q1' 'q2' 'q3' 'q4' 'q5' 'q6' 'q7'

q3 = 0;

rOW = rOE - ROE*[0; 0; dE];

d3 = design_params(3, 3);
d5 = design_params(5, 3);

gamma = acos(-(norm(rOW)^2 - d3^2 - d5^2)/(2*d3*d5));

q4 = -(pi - gamma);

jd = [q1; q2; q3; q4; q5; q6; q7];

dh_table = [design_params, jd];

T = transformation_matrices(dh_table);

%q2 = double(vpasolve(rOW(3) == T(3, 4, 5)));
%q1 = double(vpasolve(rOW(2) == subs(T(2, 4, 5), 'q2', q2)));

q2 = 2*atan2(-d5*sin(q4) - sqrt((d3+d5*cos(q4))^2 + (-d5*sin(q4))^2 - rOW(3)^2), d3 + d5*cos(q4) + rOW(3));

q1 = atan2(-rOW(2), -rOW(1));
%q1a = acos(rOW(1)/(d3*sin(q2) + d5*cos(q2)*sin(q4) + d5*cos(q4)*sin(q2)));
%q1b = asin(rOW(2)/(d3*sin(q2) + d5*cos(q2)*sin(q4) + d5*cos(q4)*sin(q2)));

T04 = subs(T(:, :, 4), 'q1', q1);
T04 = subs(T04, 'q2', q2);
T04 = double(subs(T04, 'q4', q4));

T4E_n = inv(T04)*TOE;

T7E = [eye(3), [0; 0; dE];
       [0 0 0 1]];

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
% T4E_a = T47*T7E;

q6 = acos(-T4E_n(2, 3));
q7 = atan2(-T4E_n(2, 2), T4E_n(2, 1));
q5 = atan2(T4E_n(3, 3), T4E_n(1, 3));

plot_robot(rad2deg([q1; q2; q3; q4; q5; q6; q7]))
scatter3([rOE(1) rOW(1)], [rOE(2) rOW(2)], [rOE(3) rOW(3)])