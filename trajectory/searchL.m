% Makes a Linear movement between the current position
% and the desired position in task space while searching
% for the frame. Using the desired linear speed. Stops when
% the gripper returns a "found" status for the proximity sensor
% or when the desired location is reached. If the gripper returned
% a found instruction the function returns successfully. If the
% desired position is reached the function throws and exception.
% @param desLoc Desired location in task space.
% @param desSpeed Desired linear speed in task space (in m/s).
function searchL(desLoc, desSpeed)
    global updateRobotStatus
    global robotPos
    global robotOri
    global robotAngles
    global simulation
    desCurLoc = zeros(6,1);
    desCurSpe = zeros(6,1);
    desAngSpeed = [0;0;0;0;0;0;0];
    syncRobotSpeeds(desAngSpeed);
    % Initialize gripper comms.
    initGripper('COM5',9600);
    % Update current robot location and plot.
    %updateRobotStatus();
    [robotPos, robotOri] = fKineEu(robotAngles);
    curLoc = [robotPos; robotOri];
    %curLoc = desCurLoc;
    % Obtain coefficients of cubic equations.
    [aCoef, finalTime] = cubicParameters(curLoc, desLoc, desSpeed);
    % Start timer
    tic;
    % Repeat until final time is reached.
    while( toc < finalTime )        
        % Update Timer
        curTime = toc;
        % Get the current desired location and speed
        for i=1:6
            desCurLoc(i) = aCoef(i,1) + aCoef(i,2)*curTime + ...
                           aCoef(i,3)*curTime^2 + aCoef(i,4)*curTime^3;
            desCurSpe(i) = aCoef(i,2) + aCoef(i,3)*curTime + ...
                           aCoef(i,4)*curTime^2;
        end
        % Inverse kinematics and inverse differential kinematics
        desAngles = iKineEu(desCurLoc);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%% Not required anymore %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         desAngSpeed = abs(60*(diffIKine(desCurSpe,desAngles)/(2*pi)));
%         % Saturate speed
%         desAngSpeed(desAngSpeed>100)=100;
%         desAngSpeed(desAngSpeed<1)=1;
%         desAngSpeed
        %desAngSpeed = [0;0;0;0;0;0;0];
        % Change desired angles to real motor angles
        motAngles = offsetMotorJoint(desAngles);
        % Update speed and angles when no simulation selected.
        % Chaned so the actual location is not read from motors.
        if (simulation == 0)
            %syncRobotSpeeds(desAngSpeed);
            syncRobotAngles(motAngles);
            robotAngles = desAngles;
        else
            robotAngles = desAngles;
            updateRobotStatus();
        end    
        % Get gripper proximity sensor status
        proxStatus = getGripperStatus('proxSensor');
        % If the frame has been found, return from function successfully.
        if(strcmp(proxStatus,'found'))
            return
        end
    end
    % If the desired position is reached then it means that
    % the frame wasn't found, this is an error. Throw exception.
    throw(MException('searchL:endReached','Frame was not found.'))
end