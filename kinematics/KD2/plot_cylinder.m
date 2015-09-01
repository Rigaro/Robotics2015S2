function cynplot = plot_cylinder(tm, motor_origin)
%plots a 3d cylinder onto the current figure window, given the
%transformation matrix, and the position of the motor centre within its own
%frame
%can store the output as a variable, and then use delete() to clear it from
%the figure

%set height and diameter of cylinder
height = 0.035;
diameter = 0.0164;

%generate cylinder
[cynx, cyny, cynz] = cylinder(diameter/2);

%transform cylinder to have centred origin
cynz = cynz - 0.5;
cynz = cynz*height;

%extracts rotation matrix from transformation matrix
rot = tm(1:3, 1:3);

%rotate all points 
points1 = rot*[cynx(1, :);
    cyny(1, :);
    cynz(1, :);];

points2 = rot*[cynx(2, :);
    cyny(2, :);
    cynz(2, :);];

%structure them back to be plottable
cynx = [points1(1, :);
    points2(1, :)];

cyny = [points1(2, :);
    points2(2, :)];

cynz = [points1(3, :);
    points2(3, :)];

%determine motor origin in frame 0
origin = tm*[motor_origin; 1];

%%plots the translated and rotated cylinder.
%%mesh seems to work the best. fill3 is slow
hold on
cynplot = mesh(cynx + origin(1), cyny + origin(2), cynz + origin(3));
%surf(cynx + origin(1), cyny + origin(2), cynz + origin(3))
%fill3(cynx + origin(1), cyny + origin(2), cynz + origin(3), 'b')