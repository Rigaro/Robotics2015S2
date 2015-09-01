function rot_mat = rotz(theta)
%returns the rotation matrix corresponding to a rotation about the y-axis
%by theta radians
%for use in older versions of matlab

rot_mat = [cos(theta) -sin(theta) 0;
    sin(theta) cos(theta) 0;
    0 0 1];