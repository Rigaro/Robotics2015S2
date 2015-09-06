function [pos, orientation] = forward_kinematics(jd)
%given a joint displacement vector, returns the position and pose of the
%end effector

%initialise design variables
[design_params, motor_origins, e_eff] = init(0);

%construct DH table
dh_table = [design_params, jd];

%compute transformation matrices from dh table
T = transformation_matrices(dh_table, 0);

%counts number of transformation matrices
N = size(T, 3);

%the last transformation matrix
tm = T(:, :, N);

%extracts rotation matrix
rot_mat = tm(1:3, 1:3);

%calculates the position of the end effector
pos = tm*[0; 0; motor_origins(N) + e_eff; 1];

%removes the 1 at the end of the vector
pos = pos(1:3);

%calculates the orientation of the end effector, which is represented by
%a vector pointing in the same direction
orientation = rot_mat*[0; 0; 1];

%outputs the orientation as a unit vector
orientation = orientation/norm(orientation);