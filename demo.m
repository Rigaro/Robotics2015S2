%% Draw on face 1
moveJ([0.0148;-0.1135;-0.0454;-176.9345;-81.7883;-4.6216],5);

moveOfstL([0;0;-0.01],0.01);
moveOfstL([0.03;0;0],0.05);
moveOfstL([0;0.03;0],0.05);
moveOfstL([-0.03;0;0],0.05);
moveOfstL([0;-0.03;0],0.05);

moveJ([0.0148;-0.1135;-0.0454;-176.9345;-81.7883;-4.6216],5);
moveOfstL([0.04;0;0],0.05);
moveJ([-0.0792;-0.1121;0.0065;26.0189;-42.5101;111.7084],5);
moveJ([-0.2477;0.0104;0.0085;77.2821;4.7684;-145.1780],5);

moveJ([-0.1603;0.0369;0.0183;-106.4134;-25.1399;154.6736],5);
pause(5);
syncRobotAngles([90;141;173;250;143;81;148]);
pause(5);
moveJ([-0.0004;0.1249;-0.0323;1.2829;-1.1705;-176.9979],5);
pause(5);
moveJ([0.0196;0.1938;-0.0327;86.6907;-16.2485;-177.4947],5);

%%
searchOfstL([0.1;0;0],0.01,'prox1Sensor','found');
searchOfstL([0;0;0.1],0.01,'prox1Sensor','inpos');
% Close gripper 1
initGripper('COM5',9600);
handleGripper('grip1Close')
% Wait for gripper closed
% Get gripper status
gripStatus = handleGripper('grip1Status');
n = size(gripStatus);
% Loop until gripper is closed
while(strcmp(gripStatus(1:n(1,2)-2),'open'))
gripStatus = handleGripper('grip1Status');
n = size(gripStatus);
end
endGripper();
%% Release gripper 2
% Open gripper 2
initGripper('COM5',9600);
handleGripper('grip2Open')
% Wait for gripper closed
% Get gripper status
gripStatus = handleGripper('grip2Status');
n = size(gripStatus);
% Loop until gripper is closed
while(strcmp(gripStatus(1:n(1,2)-2),'closed'))
gripStatus = handleGripper('grip2Status');
n = size(gripStatus);
end
endGripper();
%
moveOfstL([0;0;-0.06],0.05,1);
% moveJ([-0.1424;0.1328;0.04;110;-90;160],10);
% moveJ([-0.1642;-0.1733; -0.0368;-101.0466;-6.2667;102.7264],10,1);
% moveJ([-0.1720;-0.1637;-0.0479;-98.6918;-5.3754;85.1248],10,1);

%% Draw on front of box
moveJ([-0.2202;0.0170;0.0776;-92.3993;-0.6621;121.8304],1,1);
pause(5);
moveJ([-0.1989;-0.0939;0.0666;-78.7014;-17.5616;51.0823],5,1);
pause(5);
moveJ([-0.1681;-0.1605;-0.0083;-98.6918;-5.3754;85.1248],5,1);
pause(5);
moveOfstL([-0.01;0;0.07],0.05,1);
moveOfstL([0;-0.03;0],0.05,1);
moveOfstL([0;0.04;-0.05],0.05,1);
% moveOfstL([0;0;-0.03],0.01,1);

%% Draw on top of box
% moveJ([-0.1727;-0.0612;0.0493;-19.4641;44.7056;169.4889],10,1);
moveJ([-0.1448;-0.1439;0.0312;18.2812;40.0240;-167.4913],10,1);
moveOfstL([0;0;0.01],0.01,1);
moveOfstL([0;0.03;0],0.01,1);

%Move gripper 2 to frame

%move forward
%  moveJ([-0.1424;0.1328;0.08;110;-90;160],3);
%  moveJ([-0.1424;0.1028;0.08;110;-90;160],3);
%  moveJ([-0.1424;0.1328;0.04;110;-90;160],3);
%  %move to draw on top of box
%  moveJ([0.2227;0.0765;-0.1216;5.0372;-49.2927;170.1211],3);
%  moveJ([0.2227;0.0765;-0.1216;5.0372;-49.2927;170.1211],3);
 
 