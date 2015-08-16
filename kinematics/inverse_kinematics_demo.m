%This script demos inverse kinematics for a 7 DOF robot doing a task
%works using an end-effector pose input

clc
clear all
close all

%initialise design parameters
[design_params, motor_origins, e_eff] = init();

%number of motors
N = size(design_params, 1);

%number of periods to demo for
n_periods = 24;
%step size in degrees
sample_size = 10;

%initial start guess for joint_displacement
jd_guess = zeros(7, 1);

%counts number of iterations
step = 1;
%number of iterations. not used unless want to preallocate the trajectory
%matrix
%num_iterations = floor(n_periods*360/sample_size) + 1;

for t = 1:sample_size:n_periods*360
    
    %two options for clearing screen:
    %1. clears figure but still keeps certain settings
    clf('reset')
    %2. clear the previous plot. this method seems to be slower
    %     if (t > 1)
    %         delete(cynplot)
    %         delete(linkplot)
    %         delete(e_effplot)
    %     end
    
    %'orthogonal' view
    view(3);
    
    %program robot here========================
    
    %     %helix-shaped parametric function for end-effector position
    %     r_pos = [0.4*cosd(t); 0.4*sind(t); (0.4 - 0.0001*t)];
    %     %end-effector orientation always pointing up
    %     r_ori = [0; 0; 1];
    
    %draw a torchic
    [x, z] = torchic_curve(deg2rad(t));
    %when [0, 0], do not draw, and skip until non-zero
    while(x == 0 || z == 0)
        trajectory(:, step) = [NaN; NaN; NaN];
        t = t + sample_size;
        if (t >= n_periods*360)
            break
        end
        [x, z] = torchic_curve(deg2rad(t));
        step = step + 1;
    end
    %drawing on a constant y wall
    y = 0.3;
    %scaling and shifting
    z = z + 800;
    z = z/4000;
    x = x/4000;
    
    %position
    r_pos = [x; y; z];
    %end-effector orientation always pointing at the wall
    r_ori = [0; 1; 0];
    
    
    %==========================================
    
    %find optimal joint displacement for given pose
    jd_opt = inverse_kinematics([r_pos; r_ori], jd_guess);
    %a few extra optimisation iterations on the first step
    if (step == 1)
        jd_opt = inverse_kinematics([r_pos; r_ori], jd_opt);
        jd_opt = inverse_kinematics([r_pos; r_ori], jd_opt);
        jd_opt = inverse_kinematics([r_pos; r_ori], jd_opt);
    end
    %construct dh table
    dh_table = [design_params, jd_opt];
    %compute transformation matrices using dh table
    T = transformation_matrices(dh_table);
    
    %plot the motors
    for i = 1:N
        cynplot(i) = plot_cylinder(T(:, :, i), [0; 0; motor_origins(i)]);
    end
    %plot the linkages between motors
    for i = 1:(N - 1)
        a = T(:, :, i)*[0; 0; motor_origins(i); 1];
        b = T(:, :, i + 1)*[0; 0; motor_origins(i + 1); 1];
        hold on
        linkplot(i) = plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)]);
    end
    %plot the end-effector
    a = T(:, :, N)*[0; 0; motor_origins(N); 1];
    b = T(:, :, N)*[0; 0; motor_origins(N) + e_eff; 1];
    e_effplot = plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)]);
    
    %stores the past trajectory
    trajectory(:, step) = b(1:3);
    
    %two options for plotting:
    %1. scatter
    %scatter3(trajectory(1, :), trajectory(2, :), trajectory(3, :));
    %2. line
    plot3(trajectory(1, :), trajectory(2, :), trajectory(3, :));
    
    %configure unit aspect
    daspect([1 1 1])
    %set box bounds
    axis([-0.6, 0.6, -0.6, 0.6, -0.6, 0.6])
    %allows more things to be plotted
    drawnow
    
    %use the current joint displacement as a starting guess for the next
    %joint displacement
    jd_guess = jd_opt;
    
    %increment counter
    step = step + 1;
end