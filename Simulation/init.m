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