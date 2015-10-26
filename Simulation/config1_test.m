clc
clear all
close all

%testing of configurations to see what gripping positions are possible in
%"configuration1" (see config1.png)

%the plot config1_error gives the error (0 means possible, >0 means not
%possible) as the horizonal and vertical locations of the grippers along
%the bars are varied. congif1_solvable is a binary version of this

n = 20;

[horiz, verti] = meshgrid(linspace(0, -0.1923, n), linspace(0.04387, 0.36, n));
jd_opt = zeros(7, 1);

for i = 10:10
    for j = 10:10
        pos_G0 = [horiz(i, j); -0.3784; 0.04387 + 0.36 - 0.36];
        rot_G0 = [0 -1 0;
            1 0 0;
            0 0 -1];
        
        pos_GE = [0.1923; -0.3784; verti(i, j)];
        rot_GE = [0 0 1;
            1 0 0;
            0 -1 0];
        
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

figure, surf(horiz, verti, errorgrid)
xlabel('horizontal')
ylabel('vertical')
zlabel('error')

thres = 0.002;
figure, surf(horiz, verti, double(errorgrid <= thres))
xlabel('horizontal')
ylabel('vertical')
zlabel('solvable')
