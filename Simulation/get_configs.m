function [TMO_G0, TMO_GE, penmode, quadrant, controlmode, n] = get_configs(i)
%a very big case statement to get the transformations of both the origin
%gripper and the end effector for each step i
%
%penmode is 1 if the end effector transformation is for the tip of the pen,
%otherwise 0 for the end effector gripper
%
%quadrant is from 1 to 4, and gives the location for best viewing camera
%for the location (quadrant numbers are the same as for 2D cartesian plane)
%
%controlmode specifies which gripper is to be moved (the other gripper is
%fixed) going to that step from the previous step. 1 to control the end
%effector and 0 to control the origin
switch i
    
    case 1
        pos_G0 = [0.16; -0.3784; 0.04387 + 0.36 - 0.36];
        rot_G0 = [0 1 0;
            0 0 -1;
            -1 0 0];
        
        pos_GE = [0.17; -0.1; 0.1];
        rot_GE = [0 0 -1;
            0 -1 0;
            -1 0 0];
        
        penmode = 0;
        quadrant = 4;
        
    case 2
        pos_G0 = [0.16; -0.3784; 0.04387 + 0.36 - 0.36];
        rot_G0 = [0 1 0;
            0 0 -1;
            -1 0 0];
        
        pos_GE = [0.105; -0.1; 0.1];
        rot_GE = [0 0 -1;
            1 0 0;
            0 -1 0];
        
        penmode = 1;
        quadrant = 4;
        controlmode = 1;
        n = 15;
        
    case 3
        pos_G0 = [0.16; -0.3784; 0.04387 + 0.36 - 0.36];
        rot_G0 = [0 1 0;
            0 0 -1;
            -1 0 0];
        
        pos_GE = [0.17; 0.1; 0.13];
        rot_GE = [0 -1 0;
            1 0 0;
            0 0 1];
        
        penmode = 0;
        quadrant = 4;
        controlmode = 1;
        n = 15;
        
     case 4
        pos_G0 = [0.16; -0.3784; 0.04387 + 0.36 - 0.36];
        rot_G0 = [0 1 0;
            0 0 -1;
            -1 0 0];
        
        pos_GE = [0.16; -0.3; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 -1 0;
            0 0 -1;
            1 0 0];
        
        penmode = 0;
        quadrant = 4;
        controlmode = 1;
        n = 15;
        
    case 5
        pos_G0 = [0.16; -0.3784; 0.04387 + 0.36 - 0.36];
        rot_G0 = [0 1 0;
            0 0 -1;
            -1 0 0];
        
        pos_GE = [0.12; -0.3; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 -1 0;
            0 0 -1;
            1 0 0];
        
        penmode = 0;
        quadrant = 4;
        controlmode = 1;
        n = 15;
    case 6
        pos_G0 = [0.16; -0.3784; 0.04387 + 0.36 - 0.36];
        rot_G0 = [0 1 0;
            0 0 -1;
            -1 0 0];
        
        pos_GE = [0.12; -0.3784; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 -1 0;
            0 0 -1;
            1 0 0];
        
        penmode = 0;
        quadrant = 4;
        controlmode = 1;
        n = 15;
        
    case 7
        pos_G0 = [0.16; -0.3; 0.04387 + 0.36 - 0.36];
        rot_G0 = [0 1 0;
            0 0 -1;
            -1 0 0];
        
        pos_GE = [0.12; -0.3784; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 -1 0;
            0 0 -1;
            1 0 0];
        
        penmode = 0;
        quadrant = 4;
        controlmode = 0;
        
 case 8
        pos_G0 = [0.16; -0.05; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 1 0;
            1 0 0;
            0 0 -1];
        
        pos_GE = [0.12; -0.3784; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 -1 0;
            0 0 -1;
            1 0 0];
        
        penmode = 0;
        quadrant = 4;
        controlmode = 0;
        
         case 9
        pos_G0 = [-0.15; -0.35; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 -1;
            0 1 0;
            1 0 0];
        
        pos_GE = [0.12; -0.3784; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 -1 0;
            0 0 -1;
            1 0 0];
        
        penmode = 0;
        quadrant = 4;
        controlmode = 0;
    case 10
        
        pos_G0 = [-0.1923; -0.35; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 -1;
            0 1 0;
            1 0 0];
        
        pos_GE = [0.12; -0.3784; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 -1 0;
            0 0 -1;
            1 0 0];
        
        penmode = 0;
        quadrant = 4;
        controlmode = 0;
        
     case 11
        
        pos_G0 = [-0.1923; -0.35; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 -1;
            0 1 0;
            1 0 0];
        
        pos_GE = [0.12; -0.28; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 -1 0;
            0 0 -1;
            1 0 0];
        penmode = 0;
        quadrant = 4;
        controlmode = 1;
        
    case 12
        
        pos_G0 = [-0.1923; -0.35; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 -1;
            0 1 0;
            1 0 0];
        
        pos_GE = [0.05; -0.225; 0.1];
        rot_GE = [0 1 0;
            0 0 1;
            1 0 0];
        penmode = 1;
        quadrant = 4;
        controlmode = 1;
        
    case 13
        
        pos_G0 = [-0.1923; -0.35; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 -1;
            0 1 0;
            1 0 0];
        
        pos_GE = [0.12; -0.28; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 -1 0;
            0 0 -1;
            1 0 0];
        penmode = 0;
        quadrant = 4;
        controlmode = 1;
    case 14
        
        pos_G0 = [-0.1923; -0.35; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 -1;
            0 1 0;
            1 0 0];
        
        pos_GE = [0.05; -0.1; 0.21];
        rot_GE = [0 1 0;
            1 0 0;
            0 0 -1];
        penmode = 1;
        quadrant = 4;
        controlmode = 1;
        

        
    case 15
        
        pos_G0 = [-0.1923; -0.35; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 -1;
            0 1 0;
            1 0 0];
        
        pos_GE = [-0.15; -0.15; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 0 -1;
            0 1 0;
            1 0 0];
        penmode = 0;
        quadrant = 3;
        controlmode = 1;
        
    case 16
        
        pos_G0 = [-0.1923; -0.35; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 -1;
            0 1 0;
            1 0 0];
        
        pos_GE = [-0.1923; -0.15; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 0 -1;
            0 1 0;
            1 0 0];
        penmode = 0;
        quadrant = 3;
        controlmode = 1;
        
    case 17
        
        pos_G0 = [-0.16; -0.3784; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 -1 0;
            0 0 -1;
            1 0 0];
        
        pos_GE = [-0.1923; -0.15; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 0 -1;
            0 1 0;
            1 0 0];
        penmode = 0;
        quadrant = 3;
        controlmode = 0;
    case 18
        pos_G0 = [-0.16; -0.3784; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 -1 0;
            0 0 -1;
            1 0 0];
        
        pos_GE = [-0.105; -0.1; 0.1];
        rot_GE = [0 0 1;
            1 0 0;
            0 1 0];
        
        penmode = 1;
        quadrant = 3;
        controlmode = 1;
    case 19
        pos_G0 = [-0.16; -0.3784; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 -1 0;
            0 0 -1;
            1 0 0];
        
        pos_GE = [-0.1923; -0.15; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 0 -1;
            0 1 0;
            1 0 0];
        penmode = 0;
        quadrant = 3;
        controlmode = 1;
    case 20
        
        pos_G0 = [0.06; 0; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 1 0;
            0 0 1;
            1 0 0];
        
        pos_GE = [-0.1923; -0.15; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 0 -1;
            0 1 0;
            1 0 0];
        penmode = 0;
        quadrant = 4;
        controlmode = 0;
    case 21
        
        pos_G0 = [0.06; 0; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 1 0;
            0 0 1;
            1 0 0];
        
        pos_GE = [-0.1923; 0; 0.04387 + 0.36 - 0.04387 - 0.05];
        rot_GE = [0 0 -1;
            1 0 0;
            0 -1 0];
        penmode = 0;
        quadrant = 4;
        controlmode = 1;
    case 22
        
        pos_G0 = [0.1923; 0.04; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 1;
            0 -1 0;
            1 0 0];
        
        pos_GE = [-0.1923; 0; 0.04387 + 0.36 - 0.04387 - 0.05];
        rot_GE = [0 0 -1;
            1 0 0;
            0 -1 0];
        penmode = 0;
        quadrant = 4;
        controlmode = 0;
    case 23
        
        pos_G0 = [0.1923; 0.04; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 1;
            0 -1 0;
            1 0 0];
        
        pos_GE = [0.1923; 0.18; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 0 1;
            0 -1 0;
            1 0 0];
        penmode = 0;
        quadrant = 4;
        controlmode = 1;
    case 24
        
        pos_G0 = [0.1923; 0.35; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 1;
            0 -1 0;
            1 0 0];
        
        pos_GE = [0.1923; 0.18; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 0 1;
            0 -1 0;
            1 0 0];
        penmode = 0;
        quadrant = 1;
        controlmode = 0;
    case 25
        
        pos_G0 = [0.1923; 0.35; 0.04387 + 0.36 - 0.04387];
        rot_G0 = [0 0 1;
            0 -1 0;
            1 0 0];
        
        pos_GE = [-0.05; 0.225; 0.1];
        rot_GE = [1 0 0;
            0 0 -1;
            0 -1 0];
        penmode = 1;
        quadrant = 1;
        controlmode = 1;
end

n = 15;

TMO_G0 = [[rot_G0, pos_G0];
    0 0 0 1];

TMO_GE = [[rot_GE, pos_GE];
    0 0 0 1];