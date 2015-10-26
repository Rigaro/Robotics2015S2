%simulates the entire path
%see config5.gif for disjoint animation and pathdemo.gif for smooth
%animation

clc
clear all
close all

filename = 'output.gif';

jd_opt = zeros(7, 1);

figure('Position', [10 100 900 900])

quadrant = 4;
azi = 37.5;
penmode = 0;

for i = 1:13 %note: smooth mode currently only goes up to 13
    clf('reset')
    jd_opt = zeros(7, 1);
    
    [TMO_G0, TMO_GE, penmode] = get_configs(i);
    
    [design_params, motor_tm, TM0_G0, TM7_GE] = init();
    
    TMO_0 = TMO_G0*inv(TM0_G0);
    
    if (penmode)
        [jd_opt, error] = inverse_kinematics_pen(TMO_G0, TMO_GE, jd_opt);
    else
        [jd_opt, error] = inverse_kinematics(TMO_G0, TMO_GE, jd_opt);
    end
    
    %two simulation modes: smooth and disjoint. use code directly below for
    %disjoint
    %%=====================================================================
%     plot_frame
%     plot_robot(jd_opt, TMO_0)
%     drawnow
%%%========================================================================
%use code directly below for smooth mode
    jd_opt2 = zeros(7, 1);
    [TMO_G0, TMO_GE, penmode, quadrant, controlmode, n] = get_configs(i + 1);
    
    TMO_0 = TMO_G0*inv(TM0_G0);
    
    if (penmode)
        [jd_opt2, error] = inverse_kinematics_pen(TMO_G0, TMO_GE, jd_opt2);
    else
        [jd_opt2, error] = inverse_kinematics(TMO_G0, TMO_GE, jd_opt2);
    end
    
    jds = veclin(jd_opt, jd_opt2, n);
    
    switch quadrant
        case 1
            az = 142.5;
        case 2
            az = -142.5;
        case 3
            az = -37.5;
        case 4
            az = 37.5;
    end
    for j = 1:size(jds, 1)
        clf('reset')
        azi = azi - sign(azi - az)*5;
        view(azi, 30)
        
        plot_frame
        if (controlmode == 0) %control origin effector
            TM0_GE = forward_kinematics(jds(j, :)');
            TMO_0 = TMO_GE*inv(TM0_GE);
        end
        plot_robot(jds(j, :)', TMO_0)
        
        %%attempt to draw where the pen is. does not appear to work well
%         hold on
%         if (i >= 2)
%             scatter(0.105, -0.1, 0.1, 'm')
%         end
%         if (i >= 12)
%             scatter(0.05, -0.225, 0.1, 'm')
%         end
        
        view(azi, 30)
        view(37.5, 30) %use this line to force camera angle
        drawnow
        
            %%toggle to write to gif or not for smooth mode
%             frame = getframe;
%             im = frame2im(frame);
%             [imind,cm] = rgb2ind(im,256);
%             if (i == 1 && j == 1)
%                 imwrite(imind,cm,filename,'gif', 'LoopCount',inf, 'DelayTime', 0.1);
%             else
%                 imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
%                 if (i == 2 && j == 1 || i == 12 && j == 1 || i == 13 && j == size(jds, 1))
%                    for k = 1:10
%                       imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1); 
%                    end
%                 end
%             end
        
    end
    
    %=====================================================================
    %save joint history
    %jd_hist(i, :) = jd_opt';
    
    %%===================================================================
    %%toggle to write to gif or not, for disjoint mode
    %         frame = getframe;
    %         im = frame2im(frame);
    %         [imind,cm] = rgb2ind(im,256);
    %         if (i == 1);
    %             imwrite(imind,cm,filename,'gif', 'LoopCount',inf, 'DelayTime', 1);
    %         else
    %             imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 1);
    %         end
end
