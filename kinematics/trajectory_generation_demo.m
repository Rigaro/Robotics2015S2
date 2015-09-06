%demo to generate and plot trajectory, showing the surface which the robot
%passed
clc
clear all
close all

%initialise design parameters
[design_params, motor_origins, e_eff] = init(0);

%origin of robot 0 frame with respect to world frame
robot_origin = [0; -0.378375; 0.13];
%transformation of robot 0 frame with respect to world frame
originT = [eye(3), robot_origin; 0 0 0 1];

%number of motors
N = size(design_params, 1);

%poses to move from to
%set 1=========
% pose1 = [0; 0; 0.32; 0; 0; 1];
% pose2 = [0.1; -0.05; 0; 1; 0; 0];
%==============
% %set 2=========
pose1 = [-0.15; -0.2; 0; 0; -1; 0];
pose2 = [0.2; -0.15; 0; 1; 0; 0];
% %==============
%set 3=========opposite
% pose1 = [-0.2; -0.05; 0; -1; 0; 0];
% pose2 = [0.2; -0.05; 0; 1; 0; 0];
%==============
%set 4=========out of workspace. try at own risk
% pose1 = [-0.5; -0.05; 0; -1; 0; 0];
% pose2 = [0.5; -0.05; 0; 1; 0; 0];
%==============


%number of points in between
n = 25;
%timestep
dt = 0.1;

%generate trajectory
jds = gen_trajectory(pose1, pose2, n);

%matrix to store the points the robot has passed through
surface_trajectory = [];

%starting time to keep control of timesteps
t1 = clock;

for i = 1:n
    clf('reset')
    
    jd = jds(:, i);
    
    %construct dh table and create transformation matrices
    dh_table = [design_params, jd];
    T = transformation_matrices(dh_table, 0);
    
    plot_frame
    %plot the motors
    for i = 1:N
        cynplot(i) = plot_cylinder(originT*T(:, :, i), [0; 0; motor_origins(i)]);
    end
    %plot the linkages between motors
    for i = 1:(N - 1)
        a = originT*T(:, :, i)*[0; 0; motor_origins(i); 1];
        b = originT*T(:, :, i + 1)*[0; 0; motor_origins(i + 1); 1];
        hold on
        linkplot(i) = plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)]);
        surface_trajectory(:, size(surface_trajectory, 2) + 1) = a;
    end
    %plot the end-effector
    a = originT*T(:, :, N)*[0; 0; motor_origins(N); 1];
    b = originT*T(:, :, N)*[0; 0; motor_origins(N) + e_eff; 1];
    e_effplot = plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)]);
    surface_trajectory(:, size(surface_trajectory, 2) + 1) = b;
    
    %plot points which robot has passed through
    fill3(surface_trajectory(1, :), surface_trajectory(2, :), surface_trajectory(3, :), 'r')
    
    %configure unit aspect
    daspect([1 1 1])
    %set box bounds
    axis([-0.6, 0.6, -0.6, 0.6, 0, 1])
    %'orthogonal' view
    view(3);
    %draws now
    drawnow
    
    %pause the amount of time to keep in step with timing
    pause(dt - etime(clock, t1))
    t1 = clock;
end