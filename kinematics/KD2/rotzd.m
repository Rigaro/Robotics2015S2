function rot_mat = rotzd(theta)
%returns the rotation matrix corresponding to a rotation about the y-axis
%by theta degrees
%for use in older versions of matlab

rot_mat = [cosd(theta) -sind(theta) 0;
    sind(theta) cosd(theta) 0;
    0 0 1];