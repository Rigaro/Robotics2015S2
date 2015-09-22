% Reads the angles of all robot joints
function jointAngles = readRobotAngles()
%Check if library is not loaded, and load if not.
if(~libisloaded('dynamixel'))
    loadlibrary('dynamixel','dynamixel.h');
end

    global robotAngles
    jointAngles = robotAngles;
    % Read all motor angles.
    for i=1:7
        jointAngles(i) = getJointPosition(i);
    end
    
%Close Device if library is loaded.
if(libisloaded('dynamixel'))
    calllib('dynamixel','dxl_terminate');  
    unloadlibrary('dynamixel');
end

end