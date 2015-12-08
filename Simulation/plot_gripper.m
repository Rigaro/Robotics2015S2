function plot_gripper(TM)
%plots the gripper onto current figure, given a transformation matrix
%between the motor origin and the figure origin

%%testing code
% pos = [1; 1; 1];
% 
% alpha = 10;
% beta = 10;
% gamma = 45;
% 
% rotx = [1 0 0;
%     0 cosd(alpha) -sind(alpha);
%     0 sind(alpha) cosd(alpha)];
% 
% roty = [cosd(beta) 0 sind(beta);
%     0 1 0;
%     -sind(beta) 0 cosd(beta)];
% 
% rotz = [cosd(gamma) -sind(gamma) 0;
%     sind(gamma) cosd(gamma) 0;
%     0 0 1];
% 
% rot = rotx*roty*rotz;
% 
% TM = [[rot, pos]; 0 0 0 1];

%define and plot the 3 faces of the gripper
x = [0.01; 0.01; -0.08; -0.08; -0.025; -0.025; 0; 0];
y = 0.02*ones(8, 1);
z = [0.025; -0.025; -0.025; 0.025; 0.025; 0; 0; 0.025];

lightgrey = [0.8 0.8 0.8];
data = TM*[x, y, z, ones(numel(x), 1)]';
fill3(data(1, :), data(2, :), data(3, :), lightgrey)
hold on

x = [0.01; 0.01; -0.08; -0.08; -0.025; -0.025; 0; 0];
y = -0.02*ones(8, 1);
z = [0.025; -0.025; -0.025; 0.025; 0.025; 0; 0; 0.025];

data = TM*[x, y, z, ones(numel(x), 1)]';
fill3(data(1, :), data(2, :), data(3, :), lightgrey)

x = [0; -0.025; -0.025; 0];
y = [-0.02; -0.02; 0.02; 0.02];
z = [0; 0; 0; 0];

data = TM*[x, y, z, ones(numel(x), 1)]';
fill3(data(1, :), data(2, :), data(3, :), lightgrey)

daspect([1 1 1])
grid on