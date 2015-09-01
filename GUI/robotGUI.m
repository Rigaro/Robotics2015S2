function robotGUI()
global updateTimer
updateTimer = timer('BusyMode', 'drop', ...
                      'ExecutionMode', 'fixedRate', ...
                      'Name', 'updateTimer', ...
                      'Period' ,2, ...
                      'TimerFcn', {@(~,~)updateDisplay});

% Create global figure to display robot
global robotFig
robotFig = figure('CloseRequestFcn',@robotGUI_CloseRequestFcn);
set(robotFig, 'Name', 'Robot Fig');
set(robotFig, 'MenuBar', 'none');
global robotAngles
global robotPos
global robotOri
robotPos = zeros([3,1]);
robotOri = zeros([3,1]);
robotAngles = zeros([7,1]);
plotRobot(robotAngles);
% Only start timer if it is not running
if strcmp(get(updateTimer, 'Running'), 'off')
    start(updateTimer);
end

% Timer callback function that draws robot and updates status.
function updateDisplay()
global robotAngles
global dmxStatus
global robotPos
global robotOri
if (dmxStatus == 1)
    robotAngles = offsetSimJoint(readRobotAngles());
else
    robotAngles = zeros([7,1]);
end
plotRobot(robotAngles);
[robotPos, robotOri] = forward_kinematics(robotAngles); 
plotCoord();

% --- Executes when user attempts to close figure.
% Overrides figure close function to include timer stop and
% library unload.
function robotGUI_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global updateTimer
% Necessary to provide this function to prevent timer callback
% from causing an error after GUI code stops executing.
% Before exiting, if the timer is running, stop it.
timerValid = isvalid(updateTimer);
if (timerValid ~= 0)
    if strcmp(get(updateTimer, 'Running'), 'on')
        stop(updateTimer);
    end
    % Destroy timer
    delete(updateTimer);
end
%Close dynamixel library
if(libisloaded('dynamixel'))
    calllib('dynamixel','dxl_terminate');  
    unloadlibrary('dynamixel');
end
% Hint: delete(hObject) closes the figure
delete(hObject);