initGripper('COM5',9600);
tic
gripperStatus = getGripperStatus('gripStatus')
toc
% gripperStatus = getGripperStatus('proxSensor')
endGripper();
