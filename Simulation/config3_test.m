clc
clear all
close all

%simulation show how a robot can traverse through the building, satisfying
%the kinematic constraints
%uses R2014a version of fmincon

%uses the path in path3.txt
%see confid3.gif for the animation

filename = 'output.gif';

jd_opt = zeros(7, 1);

figure('Position', [10 100 900 900])

for i = 1:9
    clf('reset')
    jd_opt = zeros(7, 1);
    switch i
        case 1
            pos_G0 = [-0.16; -0.3784; 0.04387 + 0.36 - 0.36];
            rot_G0 = [0 1 0;
                0 0 -1;
                -1 0 0];
            
            pos_GE = [-0.16; -0.3784; 0.04387 + 0.36 - 0.04387];
            rot_GE = [0 -1 0;
                0 0 -1;
                1 0 0];
            
        case 2
            
            pos_G0 = [-0.1923; -0.15; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 0 -1;
                0 1 0;
                1 0 0];
            
            pos_GE = [-0.16; -0.3784; 0.04387 + 0.36 - 0.04387];
            rot_GE = [0 -1 0;
                0 0 -1;
                1 0 0];
            
        case 3
            
            pos_G0 = [-0.1923; -0.15; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 0 -1;
                0 1 0;
                1 0 0];
            
            pos_GE = [0.14; 0; 0.04387 + 0.36 - 0.04387];
            rot_GE = [0 1 0;
                0 0 1;
                1 0 0];
            
        case 4
            
            pos_G0 = [-0.08; 0; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 1 0;
                0 0 1;
                1 0 0];
            
            pos_GE = [0.14; 0; 0.04387 + 0.36 - 0.04387];
            rot_GE = [0 1 0;
                0 0 1;
                1 0 0];
            
        case 5
            
            pos_G0 = [-0.06; 0; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 1 0;
                0 0 1;
                1 0 0];
            
            pos_GE = [0.14; 0; 0.04387 + 0.36 - 0.04387];
            rot_GE = [0 1 0;
                0 0 1;
                1 0 0];
            
        case 5.5
            
            pos_G0 = [-0.06; 0; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 1 0;
                0 0 1;
                1 0 0];
            
            pos_GE = [0.14; 0; 0.04387 + 0.36 - 0.04387];
            rot_GE = [0 -1 0;
                1 0 0;
                0 0 1];
            
        case 6
            
            pos_G0 = [-0.06; 0; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 1 0;
                0 0 1;
                1 0 0];
            
            pos_GE = [0.1923; 0; 0.04387 + 0.36 - 0.04387 - 0.05];
            rot_GE = [0 0 1;
                1 0 0;
                0 1 0];
            
        case 7
            
            pos_G0 = [-0.1923; 0.05; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 0 -1;
                0 1 0;
                1 0 0];
            
            pos_GE = [0.1923; 0; 0.04387 + 0.36 - 0.04387 - 0.05];
            rot_GE = [0 0 1;
                1 0 0;
                0 1 0];
            
        case 8
            
            pos_G0 = [-0.1923; 0.05; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 0 -1;
                0 1 0;
                1 0 0];
            
            pos_GE = [-0.1923; 0.26; 0.04387 + 0.36 - 0.04387];
            rot_GE = [0 0 -1;
                0 1 0;
                1 0 0];
            
        case 9
            pos_G0 = [-0.16; 0.3784; 0.04387 + 0.36 - 0.36];
            rot_G0 = [0 -1 0;
                0 0 1;
                -1 0 0];
            
            pos_GE = [-0.1923; 0.26; 0.04387 + 0.36 - 0.04387];
            rot_GE = [0 0 -1;
                0 1 0;
                1 0 0];
            
    end
    
    TMO_G0 = [[rot_G0, pos_G0];
        0 0 0 1];
    
    TMO_GE = [[rot_GE, pos_GE];
        0 0 0 1];
    
    [design_params, motor_tm, TM0_G0, TM7_GE] = init();
    
    TMO_0 = TMO_G0*inv(TM0_G0);
    
    [jd_opt, error] = inverse_kinematics(TMO_G0, TMO_GE, jd_opt);
    %[jd_opt, error] = inverse_kinematics_pen(TMO_G0, TMO_GE, jd_opt);
    
    plot_frame
    plot_robot(jd_opt, TMO_0)
    drawnow
    
    %%code to write to gif
%     frame = getframe;
%     im = frame2im(frame); 
%     [imind,cm] = rgb2ind(im,256);  
%     if (i == 1);
%         imwrite(imind,cm,filename,'gif', 'LoopCount',inf, 'DelayTime', 1);
%     else
%         imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 1);
%     end
end
