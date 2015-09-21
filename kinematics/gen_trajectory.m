function [jds] = gen_trajectory(pose1, pose2, n)
%DISCLAIMER: this is linear trajectory generation, different from what is taught in lectures
%generates a 7 by n matrix containing joint displacement angles (in degrees)
%which interpolates between pose1 and pose2
%NOTE: currently does not deal well with poses that are "opposite" to each
%other

%if n is not given, the default is 10
if (nargin < 3)
    n = 10;
end

%interpolate position linearly
poses(1, :) = linspace(pose1(1), pose2(1), n);
poses(2, :) = linspace(pose1(2), pose2(2), n);
poses(3, :) = linspace(pose1(3), pose2(3), n);

%make unit vectors first
pose1(4:6) = pose1(4:6)/norm(pose1(4:6));
pose2(4:6) = pose2(4:6)/norm(pose2(4:6));

if (pose1(4:6) == -pose2(4:6))
    %special case when one orientation is opposite to the other
    %interpolate orientation using linear combinations
    i = 1;
    for alpha = linspace(0, 1, n);
        poses(4:6, i) = (1 - alpha)*pose1(4:6) + alpha*pose2(4:6);
        i = i + 1;
    end
else
    %interpolate orientation using linear combinations
    i = 1;
    for alpha = linspace(0, 1, n);
        poses(4:6, i) = (1 - alpha)*pose1(4:6) + alpha*pose2(4:6);
        i = i + 1;
    end
end

jds = robust_ik(poses);