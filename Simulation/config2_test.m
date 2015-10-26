%testing of configurations to see what gripping positions are possible in
%"configuration2" (see config2.png)

%the plot config2_error gives the error (0 means possible, >0 means not
%possible) as the horizonal locations of the grippers along
%the top and bottom bars are varied. config1_solvable is a binary version of this

clc
clear all
close all

n = 20;

[horizl, horizu] = meshgrid(linspace(0, -0.1923, n), linspace(0, 0.1923, n));
jd_opt = zeros(7, 1);

for i = 1:n
    for j = 1:n
        pos_G0 = [horizl(i, j); -0.3784; 0.04387 + 0.36 - 0.36];
        rot_G0 = [0 -1 0;
            1 0 0;
            0 0 -1];
        
        pos_GE = [horizu(i, j); -0.3784; 0.04387 + 0.36 - 0.04387];
        rot_GE = [0 1 0;
            1 0 0;
            0 0 1];
        
        %draw on wall
%         pos_GE = [0; -0.225; 0.2];
%         rot_GE = [0 1 0;
%             0 0 1;
%             1 0 0];
        
        TMO_G0 = [[rot_G0, pos_G0];
            0 0 0 1];
        
        TMO_GE = [[rot_GE, pos_GE];
            0 0 0 1];
        
        [design_params, motor_tm, TM0_G0, TM7_GE] = init();
        
        TMO_0 = TMO_G0*inv(TM0_G0);
        
        [jd_opt, error] = inverse_kinematics(TMO_G0, TMO_GE, jd_opt);
        %[jd_opt, error] = inverse_kinematics_pen(TMO_G0, TMO_GE, jd_opt);
        
        errorgrid(i, j) = error;
        disp([num2str(100*((i - 1)*n + j)/n^2), '%'])
    end
end


plot_frame
plot_robot(jd_opt, TMO_0)

figure, surf(horizl, horizu, errorgrid)
xlabel('horizontal lower')
ylabel('horizontal upper')
zlabel('error')

thres = 0.002;
figure, surf(horizl, horizu, double(errorgrid <= thres))
xlabel('horizontal lower')
ylabel('horizontal upper')
zlabel('solvable')
