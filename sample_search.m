%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% DO NOT RUN
%%%%% ONLY FOR DEMONSTRATION PURPOSES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
moveJ([0.0384;0.1646;-0.0478;94.5957;0.5711;-179.8079],10);
searchL([0.0484;0.1646;-0.0478;94.5957;0.5711;-179.8079],0.01,'prox1Sensor','found');
searchOfstL([0;0;0.1],0.01,'prox1Sensor','inpos');
% Close gripper
initGripper('COM5',9600);
handleGripper('grip1Close')
endGripper();
% Wait for gripper closed
% Get gripper status
gripStatus = handleGripper('grip1Status');
n = size(gripStatus);
% Loop until gripper is closed
while(strcmp(gripStatus(1:n(1,2)-2),'open'))
gripStatus = handleGripper('grip1Status');
n = size(gripStatus);
end
% moveJ([0.0384;0.1646;-0.0478;94.5957;0.5711;-179.8079],10);
% moveOfstL([0.05;0;0],0.01);