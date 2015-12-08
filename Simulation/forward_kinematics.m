function TM0_GE = forward_kinematics(jd)
%given a joint displacement vector, returns the transformation matrix from
%the robot origin to the end gripper

%initialise design variables
[design_params, motor_tm, origin_tm, effector_tm] = init();

%construct DH table
dh_table = [design_params, jd];

%compute transformation matrices from dh table
T = transformation_matrices(dh_table);

%counts number of transformation matrices
N = size(T, 3);

%the last transformation matrix
tm = T(:, :, N);

%calculates the transformation of the end effector from the origin
TM0_GE = tm*effector_tm;

function T = transformation_matrices(dh_params)
        
        %implements the DH table and returns all transformation matrices with
        %respect to frame 0
        
        T_prev = eye(4);
        for j = 1:size(dh_params, 1)
            Rx = [rotx(dh_params(j, 1)), [0; 0; 0];
                [0 0 0 1]];
            Dx = [eye(3), [dh_params(j, 2); 0; 0];
                [0 0 0 1]];
            Rz = [rotz(dh_params(j, 4)), [0; 0; 0];
                [0 0 0 1]];
            Dz = [eye(3), [0; 0; dh_params(j, 3)];
                [0 0 0 1]];
            T(:, :, j) = T_prev*Rx*Dx*Rz*Dz;
            T_prev = T(:, :, j);
        end
        
    end

    function rot_mat = rotx(theta)
        %returns the rotation matrix corresponding to a rotation about the x-axis
        %by theta degrees
        %for use in older versions of matlab
        
        rot_mat = [1 0 0;
            0 cosd(theta) -sind(theta);
            0 sind(theta) cosd(theta)];
        
    end

    function rot_mat = rotz(theta)
        %returns the rotation matrix corresponding to a rotation about the y-axis
        %by theta degrees
        %for use in older versions of matlab
        
        rot_mat = [cosd(theta) -sind(theta) 0;
            sind(theta) cosd(theta) 0;
            0 0 1];
        
    end
end