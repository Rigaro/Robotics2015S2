function rot_mat = rotxd(theta)
%returns the rotation matrix corresponding to a rotation about the x-axis
%by theta degrees
%for use in older versions of matlab

rot_mat = [1 0 0;
    0 cosd(theta) -sind(theta);
    0 sind(theta) cosd(theta)];