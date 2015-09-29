% Plots cartesian coordinates on base frame
% in robotGUI.
function plotCoord()
global robotFig
global robotPos
global robotOri
%figure(robotFig);
% Delete old coordinate box.
delete(findall(gcf,'Tag','robotFigCoord'));
set(groot,'CurrentFigure',robotFig);
str = {strcat('x: ', num2str(robotPos(1)));
       strcat('y: ', num2str(robotPos(2)));
       strcat('z: ', num2str(robotPos(3)));
       strcat('a: ', num2str(robotOri(1)));
       strcat('b: ', num2str(robotOri(2)));
       strcat('c: ', num2str(robotOri(3)));
       };
annotation('textbox', [0.02,0.02,0.15,0.26], ...
            'String', str, ...
            'Tag', 'robotFigCoord');
end