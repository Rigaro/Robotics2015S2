function [design_params, motor_origins, e_eff] = init()
%call this to initialise the variables which define the structure of the
%robot
%radians version

%design parameters
d3 = 0.102;
d5 = 0.117;

%contains the z-position of the centre of each motor with respect to its
%own coordinate frame
motor_origins = [-0.062; 0; -0.056; 0; -0.047; 0; 0.062];

%part of the DH table, missing joint displacements
design_params = [0 0 0;
    -pi/2 0 0;
    pi/2 0 d3;
    -pi/2 0 0;
    pi/2 0 d5;
    -pi/2 0 0;
    pi/2 0 0];

%end effector offset
e_eff = 0.04;