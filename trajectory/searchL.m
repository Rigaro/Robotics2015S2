% Makes a Linear movement between the current position
% and the desired position in task space while searching
% for the frame. Using the desired linear speed. Stops when
% the gripper returns a "found" status for the proximity sensor
% or when the desired location is reached. If the gripper returned
% a found instruction the function returns successfully. If the
% desired position is reached the function throws and exception.
% @param desLoc Desired location in task space.
% @param desSpeed Desired linear speed in task space (in m/s).
% @param proxSens Proximity sensor used for the search.
% 'prox1Sensor' or 'prox2Sensor'.
% @param searchCondition Condition to stop search. 'found' or 'inpos'.
% @param config the robot's configuration: 
% - 0 means the black gripper (2) is the base and the white gripper (1) 
%   is the end effector.
% - 1 means the white gripper (1) is the base and the black gripper (2) 
%   is the end effector.
function searchL(desLoc, desSpeed, proxSens, searchCondition, config)
    global updateRobotStatus
    global robotPos
    global robotOri
    global robotAngles
    global simulation
    % If no config chosen use the default (0) one.
    if (nargin < 5)
        config = 0;
    end
    desCurLoc = zeros(6,1);
    desCurSpe = zeros(6,1);
    desAngSpeed = [0;0;0;0;0;0;0];
    syncRobotSpeeds(desAngSpeed);
    % Initialize gripper comms.
    initGripper('COM5',9600);
    % Update current robot location and plot.
    %updateRobotStatus();
    if(config == 0)
        [robotPos, robotOri] = fKineEu(robotAngles);
    else
        [robotPos, robotOri] = fKineEuInv(robotAngles);
    end
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
        if(config == 0)
            desAngles = iKineEu(desCurLoc);
        else
            desAngles = iKineEuInv(desCurLoc);
        end
        % Constrained optimization iKine
%         desAngles = iKineEuOpti(desCurLoc, robotAngles);
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
        proxStatus = handleGripper(proxSens);
        n = size(proxStatus);
        % If the frame has been found, return from function successfully.
        if(strcmp(proxStatus(1:n(1,2)-2),searchCondition))
            endGripper();
            return
        end
    end
    % If the desired position is reached then it means that
    % the frame wasn't found, this is an error. Throw exception.
    endGripper();
    throw(MException('searchL:endReached','Frame was not found.'))
end