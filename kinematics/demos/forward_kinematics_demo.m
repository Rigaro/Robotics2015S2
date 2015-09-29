%This script demos forward kinematics for a 7 DOF robot doing a 'dance'
%works using a joint displacement input

clc
clear all
close all

%initialise design parameters
[design_params, motor_origins, e_eff] = init(0);

%number of motors
N = size(design_params, 1);

%number of periods to demo for
n_periods = 4;

for t = 0:4:n_periods*360
    
    %clears figure but still keeps certain settings
    clf('reset')
    
    %choose this for 'square' view
    view([0 0]);
    %choose this for 'orthogonal' view
    view(3);
    
    %initial joint displacement vector
    joint_displacement = zeros(7, 1);
    
    %program robot here====================================
    
    %choose between this dance
    %joint_displacement = t*ones(7, 1);
    
    %or this dance (does not crash into itself)
    joint_displacement([1 3 5 7]) = t;
    joint_displacement([2 4 6]) = 90*sind(t);
    
    %======================================================
    
    %construct DH table
    dh_table = [design_params, joint_displacement];
    
    %compute transformation matrices from dh table
    T = transformation_matrices(dh_table, 0);
    
    %plot the motors
    for i = 1:N
        plot_cylinder(T(:, :, i), [0; 0; motor_origins(i)]);
    end
    %plot the linkages between the motors
    for i = 1:(N - 1)
        a = T(:, :, i)*[0; 0; motor_origins(i); 1];
        b = T(:, :, i + 1)*[0; 0; motor_origins(i + 1); 1];
        hold on
        plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)])
    end
    %plot the end-effector
    a = T(:, :, N)*[0; 0; motor_origins(N); 1];
    b = T(:, :, N)*[0; 0; motor_origins(N) + e_eff; 1];
    plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)])
    
    %configure unit aspect
    daspect([1 1 1])
    %set box bounds
    axis([-0.6, 0.6, -0.6, 0.6, -0.6, 0.6])
    
    %allows more things to be plotted
    drawnow
    
    %adjust this to adjust the speed
    %pause(0.1)
end
