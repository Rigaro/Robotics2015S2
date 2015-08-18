% Reads the angles of all robot joints
function jointAngles = readRobotAngles()

loadlibrary('dynamixel','dynamixel.h');

    jointAngles = zeros([7, 1]);
    for i=1:1:7
        jointAngles(i) = getJointPosition(i);
    end
    
%Close Device
calllib('dynamixel','dxl_terminate');  
unloadlibrary('dynamixel');

end