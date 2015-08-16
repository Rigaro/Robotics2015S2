function [design_params, motor_origins, e_eff] = init()
%call this to initialise the variables which define the structure of the
%robot

%design parameters
d3 = 0.2;
d5 = 0.2;

%contains the z-position of the centre of each motor with respect to its
%own coordinate frame
motor_origins = [-0.1; 0; -0.1; 0; -0.1; 0; 0.1];

%part of the DH table, missing joint displacements
design_params = [0 0 0;
    -90 0 0;
    90 0 d3;
    -90 0 0;
    90 0 d5;
    -90 0 0;
    90 0 0];

%end effector offset
e_eff = 0.1;