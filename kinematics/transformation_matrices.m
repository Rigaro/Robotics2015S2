function T = transformation_matrices(dh_params, use_rad)
%implements the DH table and returns all transformation matrices with
%respect to frame 0
%set second parameter to 1 to use radians or 0 to use degrees
%by default 1 if not specified

%default
if (nargin < 2)
    use_rad = 1;
end

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
        if (use_rad)
            rot_mat = [1 0 0;
                0 cos(theta) -sin(theta);
                0 sin(theta) cos(theta)];
        else
            rot_mat = [1 0 0;
                0 cosd(theta) -sind(theta);
                0 sind(theta) cosd(theta)];
        end
    end

    function rot_mat = rotz(theta)
        %returns the rotation matrix corresponding to a rotation about the y-axis
        %by theta radians
        %overrides the degrees function in newer versions
        
        if (use_rad)
            rot_mat = [cos(theta) -sin(theta) 0;
                sin(theta) cos(theta) 0;
                0 0 1];
        else
            rot_mat = [cosd(theta) -sind(theta) 0;
                sind(theta) cosd(theta) 0;
                0 0 1];
        end
    end

end