function T = transformation_matricesd(dh_params)

%implements the DH table and returns all transformation matrices with
%respect to frame 0
%degrees version

T_prev = eye(4);
for i = 1:size(dh_params, 1)
    Rx = [rotxd(dh_params(i, 1)), [0; 0; 0];
        [0 0 0 1]];
    Dx = [eye(3), [dh_params(i, 2); 0; 0];
        [0 0 0 1]];
    Rz = [rotzd(dh_params(i, 4)), [0; 0; 0];
        [0 0 0 1]];
    Dz = [eye(3), [0; 0; dh_params(i, 3)];
        [0 0 0 1]];
    T(:, :, i) = T_prev*Rx*Dx*Rz*Dz;
    T_prev = T(:, :, i);
end

    function rot_mat = rotxd(theta)
        %returns the rotation matrix corresponding to a rotation about the x-axis
        %by theta degrees
        
        rot_mat = [1 0 0;
            0 cosd(theta) -sind(theta);
            0 sind(theta) cosd(theta)];
    end

    function rot_mat = rotzd(theta)
        %returns the rotation matrix corresponding to a rotation about the y-axis
        %by theta degrees
        
        rot_mat = [cosd(theta) -sind(theta) 0;
            sind(theta) cosd(theta) 0;
            0 0 1];
    end

end