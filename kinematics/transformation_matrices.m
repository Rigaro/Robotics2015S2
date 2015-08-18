function T = transformation_matrices(dh_params)

%implements the DH table and returns all transformation matrices with
%respect to frame 0

T_prev = eye(4);
for i = 1:size(dh_params, 1)
   Rx = [rotx(dh_params(i, 1)), [0; 0; 0];
       [0 0 0 1]];
      Dx = [eye(3), [dh_params(i, 2); 0; 0];
       [0 0 0 1]];
       Rz = [rotz(dh_params(i, 4)), [0; 0; 0];
       [0 0 0 1]];
      Dz = [eye(3), [0; 0; dh_params(i, 3)];
       [0 0 0 1]];
   T(:, :, i) = T_prev*Rx*Dx*Rz*Dz;
   T_prev = T(:, :, i);
end