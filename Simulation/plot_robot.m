function plot_robot(jd, TM)
%takes joint displacement as an input and plots the robot on the current
%figure, given a transformation matrix of the origin. if no transformation
%matrix is given, then the identity is used

if (nargin < 1)
    jd = zeros(7, 1);
end
if (nargin < 2)
    TM = eye(4);
end

%initialise design parameters
[design_params, motor_tm, origin_tm, effector_tm, pen_tm] = init();

%number of motors
N = size(design_params, 1);

%construct dh table
dh_table = [design_params, jd];
%compute transformation matrices using dh table
T = transformation_matrices(dh_table);

% %plots in figure 3 to avoid overwriting
% figure(3)
% clf('reset')
hold on

%plot the motors
for i = 1:N
    %create a transformation matrixes asuming there was no joint
    %displacement for a particular joint (for plotting the boxes)
    jd0 = jd;
    jd0(i) = 0;
    T0 = transformation_matrices([design_params, jd0]);
    if (i <= 5)
        plot_motor(TM*T(:, :, i)*motor_tm(:, :, i), TM*T0(:, :, i)*motor_tm(:, :, i));
    else
        plot_motor(TM*T(:, :, i)*motor_tm(:, :, i), TM*T(:, :, i)*motor_tm(:, :, i));
    end
    %plot gripper and linkages between grippers
    if (i == 1)
        plot_gripper(TM*T0(:, :, i)*origin_tm)
        a = TM*T0(:, :, 1)*motor_tm(:, 4, 1);
        b = TM*T0(:, :, 1)*origin_tm(:, 4);
        plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)], 'black', 'Linewidth', 3);
        
    elseif (i == 7)
        plot_gripper(TM*T(:, :, i)*effector_tm)
        a = TM*T(:, :, N)*motor_tm(:, 4, N);
        b = TM*T(:, :, N)*effector_tm(:, 4);
        plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)], 'black', 'Linewidth', 3);
    end
end
%plot the linkages between motors
for i = 1:(N - 1)
    a = TM*T(:, :, i)*motor_tm(:, 4, i);
    b = TM*T(:, :, i + 1)*motor_tm(:, 4, i + 1);
    hold on
    linkplot(i) = plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)], 'black', 'Linewidth', 3);
end
%plot pen
a = TM*T(:, :, N)*effector_tm*(pen_tm(:, 4) - [0; 0; 0.06; 0]);
b = TM*T(:, :, N)*effector_tm*pen_tm(:, 4);
plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)], 'm', 'Linewidth', 4);




%configure unit aspect
daspect([1 1 1])
%set box bounds
%axis([-0.3, 0.3, -0.3, 0.3, -0.1, 0.35])
%'orthogonal' view
view(3);
%draws now
drawnow

    function T = transformation_matrices(dh_params)
        
        %implements the DH table and returns all transformation matrices with
        %respect to frame 0
        
        T_prev = eye(4);
        for j = 1:size(dh_params, 1)
            Rx = [rotx(dh_params(j, 1)), [0; 0; 0];
                [0 0 0 1]];
            Dx = [eye(3), [dh_params(j, 2); 0; 0];
                [0 0 0 1]];
            Rz = [rotz(dh_params(j, 4)), [0; 0; 0];
                [0 0 0 1]];
            Dz = [eye(3), [0; 0; dh_params(j, 3)];
                [0 0 0 1]];
            T(:, :, j) = T_prev*Rx*Dx*Rz*Dz;
            T_prev = T(:, :, j);
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
