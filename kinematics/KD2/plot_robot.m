function plot_robot(jd)
%takes joint displacement as an input and plots the robot

%initialise design parameters
[design_params, motor_origins, e_eff] = init();

%number of motors
N = size(design_params, 1);

%construct dh table
dh_table = [design_params, jd];
%compute transformation matrices using dh table
T = transformation_matrices(dh_table);

%plots in figure 3 to avoid overwriting
figure(3)
clf('reset')

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

%configure unit aspect
daspect([1 1 1])
%set box bounds
axis([-0.6, 0.6, -0.6, 0.6, -0.2, 0.6])
%'orthogonal' view
view(3);
%draws now
drawnow

    function [design_params, motor_origins, e_eff] = init()
        %call this to initialise the variables which define the structure of the
        %robot
        
        %design parameters
        d3 = 0.117;
        d5 = 0.102;
        
        %contains the z-position of the centre of each motor with respect to its
        %own coordinate frame
        motor_origins = [-0.062; 0; -0.056; 0; -0.047; 0; 0.062];
        
        %part of the DH table, missing joint displacements
        design_params = [0 0 0;
            -90 0 0;
            90 0 d3;
            -90 0 0;
            90 0 d5;
            -90 0 0;
            90 0 0];
        
        %end effector offset
        e_eff = 0.04;
        
    end

    function T = transformation_matrices(dh_params)
        
        %implements the DH table and returns all transformation matrices with
        %respect to frame 0
        
        T_prev = eye(4);
        for i = 1:size(dh_params, 1)
            Rx = [rotx(dh_params(i, 1)), [0; 0; 0];
                [0 0 0 1]];
            Dx = [eye(3), [dh_params(i, 2); 0; 0];
                [0 0 0 1]];
            Rz = [rotz(dh_params(i, 4)), [0; 0; 0];
                [0 0 0 1]];
            Dz = [eye(3), [0; 0; dh_params(i, 3)];
                [0 0 0 1]];
            T(:, :, i) = T_prev*Rx*Dx*Rz*Dz;
            T_prev = T(:, :, i);
        end
        
    end

    function rot_mat = rotx(theta)
        %returns the rotation matrix corresponding to a rotation about the x-axis
        %by theta degrees
        %for use in older versions of matlab
        
        rot_mat = [1 0 0;
            0 cosd(theta) -sind(theta);
            0 sind(theta) cosd(theta)];
        
    end

    function rot_mat = rotz(theta)
        %returns the rotation matrix corresponding to a rotation about the y-axis
        %by theta degrees
        %for use in older versions of matlab
        
        rot_mat = [cosd(theta) -sind(theta) 0;
            sind(theta) cosd(theta) 0;
            0 0 1];
        
    end

end
