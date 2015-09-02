function T = transformation_matrices(dh_params)

%implements the DH table and returns all transformation matrices with
%respect to frame 0
%radians version

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

    function rot_mat = rotx(theta)
        %returns the rotation matrix corresponding to a rotation about the x-axis
        %by theta radians
        %overrides the degree-input function in newer versions
        
        rot_mat = [1 0 0;
            0 cos(theta) -sin(theta);
            0 sin(theta) cos(theta)];
    end

    function rot_mat = rotz(theta)
        %returns the rotation matrix corresponding to a rotation about the y-axis
        %by theta radians
        %overrides the degrees function in newer versions
        
        rot_mat = [cos(theta) -sin(theta) 0;
            sin(theta) cos(theta) 0;
            0 0 1];
    end

end