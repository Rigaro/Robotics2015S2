% Functions to create the robot's window.
function robotGUI()
% Create global hangle for figure, allowing it to be changed
% in other funtions.
global robotFig
robotFig = figure('CloseRequestFcn',@robotGUI_CloseRequestFcn);
set(robotFig, 'Name', 'Robot Fig');
%set(robotFig, 'MenuBar', 'none');
% Create global variables for robot coordinates and angles.
global robotAngles
global robotPos
global robotOri
robotPos = zeros([3,1]);
robotOri = zeros([3,1]);
robotAngles = zeros([7,1]);
plotRobot(robotAngles);

% Create handle for GUI update function that includes angle
% read and forward kinematics.
global updateRobotStatus
updateRobotStatus = @updateRobotGUI;
end

% Function that draws robot and updates status.
function updateRobotGUI()
global robotAngles
global simulation
global robotPos
global robotOri
if (simulation == 0)
    robotAngles = offsetSimJoint(readRobotAngles());
end
plotRobot(robotAngles);
[robotPos, robotOri] = forward_kinematics(robotAngles); 
plotCoord();
end

% --- Executes when user attempts to close figure.
% Overrides figure close function to include library unload.
function robotGUI_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Close dynamixel library
if(libisloaded('dynamixel'))
    calllib('dynamixel','dxl_terminate');  
    unloadlibrary('dynamixel');
end
% Hint: delete(hObject) closes the figure
delete(hObject);
end