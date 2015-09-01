function runRobot()
%load libraries
loadlibrary('dynamixel','dynamixel.h');
%USB2Dynamixel settings
DEFAULT_PORTNUM = 3; % com3
DEFAULT_BAUDNUM = 1; % 1mbps
%Initialize dynamixel
res = calllib('dynamixel','dxl_initialize',DEFAULT_PORTNUM,DEFAULT_BAUDNUM);
%Connection status
global dmxStatus
if(res == 1)
    dmxStatus = 1;
else
    dmxStatus = 0;
end
%start gui
menuGUI();
robotGUI();
end