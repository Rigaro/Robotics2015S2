function jd_opt = inverse_kinematics(pose, jd0)
%Finds optimal joint displacement vector for a given end effector pose.
%A specified position is compulsory, but an orientation is optional.

%set up number of iterations to optimise
%LargeScale uses line-search rather than trust-region-reflective
options = optimset('MaxFunEvals', 80, 'LargeScale', 'off', 'TolFun',1e-8);

%Quasi-newton optimisation (unconstrained minimum)
jd_opt = fminunc(@sumsqr, jd0, options);

%Non-linear least squares optimisation
%jd_opt = lsqnonlin(@sumsqr, jd0, options);

    function F = sumsqr(jd)
        %distance function, which is the objective function to minimise
        
        %desired position
        des_pos = pose(1:3);
        %computed pose
        [comp_pos, comp_ori] = forward_kinematics(jd);
        
        %check whether an orientation has been specified
        if (numel(pose) > 3)
            %desired orientation
            des_ori = pose(4:6);
            %change to unit vector if it isn't already
            des_ori = des_ori/norm(des_ori);
            
            %distance between desired and computed positions, and arccos of 
            %angle between desired and computed orientations
            F = norm(des_pos - comp_pos);
            F = F - dot(des_ori, comp_ori);
        else
            %distance between desired and computed
            F = norm(des_pos - comp_pos);
        end
        
    end

end