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
global simulation
global robotAngles
robotAngles = zeros([7,1]);
if(res == 1)
    % Connection established
    disp('Established connection with Dynamixel.');
    dmxStatus = 1;
    simulation = 0;
else
    % Connection failed, force simulation
    disp('Could not connect with Dynamixel, starting in simulation mode.');
    dmxStatus = 0;
    simulation = 1;
end
%start gui
menuGUI();
robotGUI();
end