function rot_mat = rotx(theta)
%returns the rotation matrix corresponding to a rotation about the x-axis
%by theta radians
%for use in older versions of matlab

rot_mat = [1 0 0;
    0 cos(theta) -sin(theta);
    0 sin(theta) cos(theta)];