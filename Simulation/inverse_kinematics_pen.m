function [jd_opt, error] = inverse_kinematics_pen(TMO_G0, TMO_P, jd0)
%Finds optimal joint displacement vector for a given transformation from
%the world to the origin gripper, and a given transformation from the world
%to the end gripper pen. a starting guess is optional

%set up number of iterations to optimise
%LargeScale uses line-search rather than trust-region-reflective
%options = optimset('MaxFunEvals', 80, 'LargeScale', 'off', 'TolFun',1e-8);

%Quasi-newton optimisation (unconstrained minimum)
%jd_opt = fminunc(@sumsqr, jd0, options);

if (nargin < 3)
    jd0 = zeros(7, 1);
end

TMG0_P_des = inv(TMO_G0)*TMO_P;

lb = [-150; -100; -150; -100; -150; -100; -150];
ub = -lb;
%lb = [];
%ub = [];
jd_opt = fmincon(@sumsqr, jd0,[],[],[],[], lb, ub);
%jd_opt = fminunc(@sumsqr, jd0);

%Non-linear least squares optimisation
%jd_opt = lsqnonlin(@sumsqr, jd0, options);
error = sumsqr(jd_opt) + 1;

    function F = sumsqr(jd)
        
        [design_params, motor_tm, TM0_G0, TM7_GE, TMGE_P] = init();
        TM0_GE_comp = forward_kinematics(jd);
        TMG0_GE_comp = inv(TM0_G0)*TM0_GE_comp;
        TMG0_P_comp = TMG0_GE_comp*TMGE_P;
        %F = norm(TMG0_GE_des - TMG0_GE_comp);
        
        des_pos = TMG0_P_des(1:3, 4);
        comp_pos = TMG0_P_comp(1:3, 4);
        
        F = norm(des_pos - comp_pos);
        
        des_ori = TMG0_P_des(1:3, 1:3);
        comp_ori = TMG0_P_comp(1:3, 1:3);
        
        %the trace expression calculates the sum of dot products of the
        %orientations
        F = F - trace(des_ori(1:3, 3)'*comp_ori(1:3, 3));
    end

end