function plot_motor(TM, TM2)
%Plots a motor on to current figure, given two transformation matrices -
%one for the cylinder and one for the box

%set height and diameter of cylinder
height = 0.035;
diameter = 0.0164;

%%Test code
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

% TM = [[rot, pos]; 0 0 0 1];

%generate cylinder
[cynx, cyny, cynz] = cylinder(diameter/2);

%transform cylinder to have centred origin
cynz = cynz - 0.5;
cynz = cynz*height;

%transform
points1 = TM*[cynx(1, :); cyny(1, :); cynz(1, :); ones(1, numel(cynx(1, :)))];
points2 = TM*[cynx(2, :); cyny(2, :); cynz(2, :); ones(1, numel(cynx(2, :)))];

%structure them back to be plottable
cynx = [points1(1, :);
    points2(1, :)];

cyny = [points1(2, :);
    points2(2, :)];

cynz = [points1(3, :);
    points2(3, :)];

hold on
mesh(cynx, cyny, cynz);
%fill3(cynx, cyny, cynz, 'b')
grid on
hold on
grey = [0.5 0.5 0.5];

TM = TM2;

%plot box
x = [-diameter/2; -diameter/2 - 0.024; -diameter/2 - 0.024; -diameter/2];
y = [-diameter/2; -diameter/2; diameter/2; diameter/2];
z = [height/2; height/2; height/2; height/2];
data = TM*[x, y, z, ones(numel(x), 1)]';
fill3(data(1, :), data(2, :), data(3, :), grey)
x = [-diameter/2; -diameter/2 - 0.024; -diameter/2 - 0.024; -diameter/2];
y = [-diameter/2; -diameter/2; diameter/2; diameter/2];
z = [-height/2; -height/2; -height/2; -height/2];
data = TM*[x, y, z, ones(numel(x), 1)]';
fill3(data(1, :), data(2, :), data(3, :), grey)
x = [-diameter/2 - 0.024; -diameter/2 - 0.024; -diameter/2 - 0.024; -diameter/2 - 0.024];
y = [-diameter/2; diameter/2; diameter/2; -diameter/2];
z = [-height/2; -height/2; height/2; height/2];
data = TM*[x, y, z, ones(numel(x), 1)]';
fill3(data(1, :), data(2, :), data(3, :), grey)
x = [-diameter/2; -diameter/2 - 0.024; -diameter/2 - 0.024; -diameter/2];
y = [diameter/2; diameter/2; diameter/2; diameter/2];
z = [-height/2; -height/2; height/2; height/2];
data = TM*[x, y, z, ones(numel(x), 1)]';
fill3(data(1, :), data(2, :), data(3, :), grey)
x = [-diameter/2; -diameter/2 - 0.024; -diameter/2 - 0.024; -diameter/2];
y = [-diameter/2; -diameter/2; -diameter/2; -diameter/2];
z = [-height/2; -height/2; height/2; height/2];
data = TM*[x, y, z, ones(numel(x), 1)]';
fill3(data(1, :), data(2, :), data(3, :), grey)

daspect([1 1 1])