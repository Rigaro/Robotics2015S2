function plot_frame()
%plots the scaffolding and building

%top part of frame
top_rect = [0.19225 0.378375 0.36;
    -0.19225 0.378375 0.36;
    -0.19225 -0.378375 0.36;
    0.19225 -0.378375 0.36;
    0.19225 0.378375 0.36];

%bottom part of frame
bot_rect = [0.19225 0.378375 0.043875;
    -0.19225 0.378375 0.043875;
    -0.19225 -0.378375 0.043875;
    0.19225 -0.378375 0.043875;
    0.19225 0.378375 0.043875];

%frame legs
leg1 = [0.19225 0.378375 0.36;
    0.19225 0.378375 0];

leg2 = [-0.19225 0.378375 0.36;
    -0.19225 0.378375 0];

leg3 = [-0.19225 -0.378375 0.36;
    -0.19225 -0.378375 0];

leg4 = [0.19225 -0.378375 0.36;
    0.19225 -0.378375 0];

leg5 = [0.19225 0 0.36;
    0.19225 0 0];

leg6 = [-0.19225 0 0.36;
    -0.19225 0 0];

%building faces
top_face = [0.105 0.225 0.21;
    -0.105 0.225 0.21;
    -0.105 -0.225 0.21;
    0.105 -0.225 0.21;
    0.105 0.225 0.21];

east_face = [0.105 0.225 0.21;
    0.105 -0.225 0.21;
    0.105 -0.225 0;
    0.105 0.225 0;
    0.105 0.225 0.21];

west_face = [-0.105 0.225 0.21;
    -0.105 -0.225 0.21;
    -0.105 -0.225 0;
    -0.105 0.225 0;
    -0.105 0.225 0.21];

north_face = [0.105 0.225 0.21;
    -0.105 0.225 0.21;
    -0.105 0.225 0;
    0.105 0.225 0;
    0.105 0.225 0.21];

south_face = [0.105 -0.225 0.21;
    -0.105 -0.225 0.21;
    -0.105 -0.225 0;
    0.105 -0.225 0;
    0.105 -0.225 0.21];

%grasss
ground = [0.6 0.6 0;
    -0.6 0.6 0;
    -0.6 -0.6 0;
    0.6 -0.6 0;
    0.6 0.6 0];

global robotFig
figure(robotFig);
plot3(top_rect(:, 1), top_rect(:, 2), top_rect(:, 3), 'black', 'Linewidth', 3)
hold on
plot3(bot_rect(:, 1), bot_rect(:, 2), bot_rect(:, 3), 'black', 'Linewidth', 3)
plot3(leg1(:, 1), leg1(:, 2), leg1(:, 3), 'black', 'Linewidth', 3)
plot3(leg2(:, 1), leg2(:, 2), leg2(:, 3), 'black', 'Linewidth', 3)
plot3(leg3(:, 1), leg3(:, 2), leg3(:, 3), 'black', 'Linewidth', 3)
plot3(leg4(:, 1), leg4(:, 2), leg4(:, 3), 'black', 'Linewidth', 3)
plot3(leg5(:, 1), leg5(:, 2), leg5(:, 3), 'black', 'Linewidth', 3)
plot3(leg6(:, 1), leg6(:, 2), leg6(:, 3), 'black', 'Linewidth', 3)

%colours
grey = [0.7 0.7 0.7];
grass_green = [0.28 0.71 0.28];

fill3(top_face(:, 1), top_face(:, 2), top_face(:, 3), grey)
fill3(east_face(:, 1), east_face(:, 2), east_face(:, 3), grey)
fill3(west_face(:, 1), west_face(:, 2), west_face(:, 3), grey)
fill3(north_face(:, 1), north_face(:, 2), north_face(:, 3), grey)
fill3(south_face(:, 1), south_face(:, 2), south_face(:, 3), grey)

fill3(ground(:, 1), ground(:, 2), ground(:, 3), grass_green)

%%For adjusting plot (already done in demo script)
% daspect([1 1 1])
% axis([-0.6, 0.6, -0.6, 0.6, 0, 1])
%'orthogonal' view
% view(3);
