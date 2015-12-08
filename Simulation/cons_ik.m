function [jd_opt, error] = cons_ik(pos, ori, jd0)
%Finds optimal joint displacement vector of position and orientation of end
%gripper, relative to "inverted" origin gripper (z pointing in the same
%directions). Orientation is a vector of euler angles, ie. [alpha; beta;
%gamma]. Uses constrained optimisation. Starting guess joint displacement
%is optional. May be slow but it works without complaint.
%The second output gives how close the solution is (0 is ideal)
%
%Usage
%eg. for zero position, enter pos = [0; 0; 0.45], ori = [0; 0; 0]
%
%Note: in older versions of MATLAB (R2012b) may not work as well because
%the default fmincon algorithm is slightly different
%Note: this function is currently self-contained (has all required nested
%functions)

%set up number of iterations to optimise
%LargeScale uses line-search rather than trust-region-reflective
%options = optimset('MaxFunEvals', 80, 'LargeScale', 'off', 'TolFun',1e-8);

%Quasi-newton optimisation (unconstrained minimum)
%jd_opt = fminunc(@sumsqr, jd0, options);

if (nargin < 3)
    jd0 = zeros(7, 1);
end

%transformation of the "inverted" origin gripper from the robot origin
TM0_G0prime = [1 0 0 0.064;
    0 1 0 0;
    0 0 1 (-0.062-0.0525);
    0 0 0 1];

%initialise design variables
[design_params, motor_tm, origin_tm, effector_tm] = init();

alpha = ori(1);
beta = ori(2);
gamma = ori(3);

rotx = [1 0 0;
    0 cosd(alpha) -sind(alpha);
    0 sind(alpha) cosd(alpha)];

roty = [cosd(beta) 0 sind(beta);
    0 1 0;
    -sind(beta) 0 cosd(beta)];

rotz = [cosd(gamma) -sind(gamma) 0;
    sind(gamma) cosd(gamma) 0;
    0 0 1];

rot = rotx*roty*rotz;

TMG0prime_GE_des = [[rot, pos]; 0 0 0 1];

lb = [-150; -100; -150; -100; -150; -100; -150];
ub = -lb;
%lb = [];
%ub = [];

%unconstrained optimisation
%jd_opt = fminunc(@sumsqr, jd0);

%constrained optimisation
jd_opt = fmincon(@sumsqr, jd0,[],[],[],[], lb, ub);

%Non-linear least squares optimisation
%jd_opt = lsqnonlin(@sumsqr, jd0, options);

error = sumsqr(jd_opt) + 3;

    function F = sumsqr(jd)
        
        [design_params, motor_tm, TM0_G0, TM7_GE] = init();
        TM0_GE_comp = forward_kinematics(jd);
        TMG0prime_GE_comp = inv(TM0_G0prime)*TM0_GE_comp;
        %F = norm(TMG0_GE_des - TMG0_GE_comp);
        
        des_pos = TMG0prime_GE_des(1:3, 4);
        comp_pos = TMG0prime_GE_comp(1:3, 4);
        F = norm(des_pos - comp_pos);
        
        des_ori = TMG0prime_GE_des(1:3, 1:3);
        comp_ori = TMG0prime_GE_comp(1:3, 1:3);
        
        %the trace expression calculates the sum of dot products of the
        %orientations
        F = F - trace(des_ori'*comp_ori);
    end

    function [design_params, motor_tm, origin_tm, effector_tm, pen_tm] = init(use_rad)
        %call this to initialise the variables which define the structure of the
        %robot
        %set parameter to 1 to use radians or 0 to use degrees
        %by default 0 if not specified
        
        if (nargin < 1)
            use_rad = 0;
        end
        
        
        
        %call this to initialise the variables which define the structure of the
        %robot
        
        %design parameters
        d3 = 0.117;
        d5 = 0.102;
        
        %contains the transformation of each motor with respect to its
        %own coordinate frame
        motor_tm(:, :, 1) = [1 0 0 0;
            0 1 0 0;
            0 0 1 -0.062;
            0 0 0 1];
        
        motor_tm(:, :, 2) = [0 1 0 0;
            -1 0 0 0;
            0 0 1 0;
            0 0 0 1]; %RotZ(-90)
        
        motor_tm(:, :, 3) = [1 0 0 0;
            0 1 0 0;
            0 0 1 -0.072;
            0 0 0 1];
        
        motor_tm(:, :, 4) = [0 1 0 0;
            -1 0 0 0;
            0 0 1 0;
            0 0 0 1];
        
        motor_tm(:, :, 5) = [1 0 0 0;
            0 1 0 0;
            0 0 1 -0.047;
            0 0 0 1];
        
        motor_tm(:, :, 6) = [0 -1 0 0;
            1 0 0 0;
            0 0 1 0;
            0 0 0 1];
        
        motor_tm(:, :, 7) = [1 0 0 0;
            0 1 0 0;
            0 0 1 0.062;
            0 0 0 1];
        
        %transformation of the origin gripper from the robot origin
        origin_tm = [1 0 0 0.064;
            0 -1 0 0;
            0 0 -1 (-0.062-0.0525);
            0 0 0 1];
        
        %transformation of the end gripper from the robot origin
        effector_tm = [1 0 0 0.064;
            0 1 0 0;
            0 0 1 (0.062 + 0.0525);
            0 0 0 1];
        
        %transformation of the end gripper from the end gripper
        pen_tm = [1 0 0 0.01 + 0.005;
            0 1 0 0;
            0 0 1 (0.025 + 0.02);
            0 0 0 1];
        
        if (use_rad)
            %part of the DH table, missing joint displacements
            design_params = [0 0 0;
                -pi/2 0 0;
                pi/2 0 d3;
                -pi/2 0 0;
                pi/2 0 d5;
                -pi/2 0 0;
                pi/2 0 0];
        else
            design_params = [0 0 0;
                -90 0 0;
                90 0 d3;
                -90 0 0;
                90 0 d5;
                -90 0 0;
                90 0 0];
        end
        
        
        
    end

    function TM0_GE = forward_kinematics(jd)
        %given a joint displacement vector, returns the transformation matrix from
        %the robot origin to the end gripper
        
        
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
end