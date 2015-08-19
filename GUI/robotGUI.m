function robotGUI()
global updateTimer
updateTimer = timer('BusyMode', 'drop', ...
                      'ExecutionMode', 'fixedRate', ...
                      'Name', 'updateTimer', ...
                      'Period' ,2, ...
                      'TimerFcn', {@(~,~)updateDisplay});

global robotFig
robotFig = figure('CloseRequestFcn',@robotGUI_CloseRequestFcn);
set(robotFig, 'Name', 'Robot Fig');
plotRobot(zeros([7, 1]));
% Only start timer if it is not running
if strcmp(get(updateTimer, 'Running'), 'off')
    start(updateTimer);
end

function updateDisplay()
%robotAngles = offsetSimJoint(readRobotAngles());
robotAngles = zeros([7,1]);
plotRobot(robotAngles);

% --- Executes when user attempts to close figure.
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
%Close Device
if(libisloaded('dynamixel'))
    calllib('dynamixel','dxl_terminate');  
    unloadlibrary('dynamixel');
end
disp('robot');
% Hint: delete(hObject) closes the figure
delete(hObject);