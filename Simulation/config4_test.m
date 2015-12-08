%simulation showing how it is possible to draw on each face along the path
%from config3

%see config4 for the animation

clc
clear all
close all

filename = 'output.gif';

jd_opt = zeros(7, 1);

figure('Position', [10 100 900 900])

for i = 1:5
    clf('reset')
    jd_opt = zeros(7, 1);
    
    switch i
        case 1
            pos_G0 = [-0.16; -0.3784; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 -1 0;
                0 0 -1;
                1 0 0];
            
        pos_GE = [-0.105; -0.1; 0.1];
        rot_GE = [0 0 1;
            1 0 0;
            0 1 0];
            
        case 2
            
            pos_G0 = [-0.1923; -0.35; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 0 -1;
                0 1 0;
                1 0 0];
            
        pos_GE = [0.05; -0.225; 0.1];
        rot_GE = [0 1 0;
            0 0 1;
            1 0 0];
            
        case 3
            
            pos_G0 = [-0.16; -0.3784; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 -1 0;
                0 0 -1;
                1 0 0];
            
        pos_GE = [0.05; -0.1; 0.21];
        rot_GE = [0 1 0;
            1 0 0;
            0 0 -1];
        case 4
            
            pos_G0 = [0.16; -0.3784; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 1 0;
                0 0 -1;
                1 0 0];
            
        pos_GE = [0.105; -0.1; 0.1];
        rot_GE = [0 0 -1;
            1 0 0;
            0 -1 0];
            
        case 5
            
            pos_G0 = [-0.1923; 0.35; 0.04387 + 0.36 - 0.04387];
            rot_G0 = [0 0 -1;
                0 1 0;
                1 0 0];
            
        pos_GE = [0.05; 0.225; 0.1];
        rot_GE = [1 0 0;
            0 0 -1;
            0 1 0];
            
    end
    
    TMO_G0 = [[rot_G0, pos_G0];
        0 0 0 1];
    
    TMO_GE = [[rot_GE, pos_GE];
        0 0 0 1];
    
    [design_params, motor_tm, TM0_G0, TM7_GE] = init();
    
    TMO_0 = TMO_G0*inv(TM0_G0);
    
    [jd_opt, error] = inverse_kinematics_pen(TMO_G0, TMO_GE, jd_opt);
    %[jd_opt, error] = inverse_kinematics_pen(TMO_G0, TMO_GE, jd_opt);
    
    plot_frame
    plot_robot(jd_opt, TMO_0)
    drawnow
    
%     frame = getframe;
%     im = frame2im(frame); 
%     [imind,cm] = rgb2ind(im,256);  
%     if (i == 1);
%         imwrite(imind,cm,filename,'gif', 'LoopCount',inf, 'DelayTime', 1);
%     else
%         imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 1);
%     end
end
