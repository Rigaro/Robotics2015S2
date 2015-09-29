function [design_params, motor_origins, e_eff] = initSyms(use_rad)
%call this to initialise the variables which define the structure of the
%robot
%set parameter to 1 to use radians or 0 to use degrees
%by default 1 if not specified

if (nargin < 1)
    use_rad = 1;
end


%design parameters
syms d1 d3 d5 d7;

%contains the z-position of the centre of each motor with respect to its
%own coordinate frame
motor_origins = [-0.062; 0; -0.056; 0; -0.047; 0; 0.062];

if (use_rad)
%part of the DH table, missing joint displacements
design_params = [0 0 d1;
    -pi/2 0 0;
    pi/2 0 d3;
    -pi/2 0 0;
    pi/2 0 d5;
    -pi/2 0 0;
    pi/2 0 d7];
else
    design_params = [0 0 d1;
    -90 0 0;
    90 0 d3;
    -90 0 0;
    90 0 d5;
    -90 0 0;
    90 0 d7];
end

%end effector offset from end_effector origin
e_eff = 0.04;