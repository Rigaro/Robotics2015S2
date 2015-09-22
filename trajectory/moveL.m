% Makes a Linear movement between the current position
% and the desired position in task space. Using the desired
% linear speed.
% @param desLoc Desired location in task space.
% @param desSpeed Desired linear speed in task space (in m/s).
function moveL(desLoc, desSpeed)
    global updateRobotStatus
    global robotPos
    global robotOri
    global robotAngles
    global simulation
    desCurLoc = zeros(6,1);
    desCurSpe = zeros(6,1);
    % Update current robot location and plot.
    updateRobotStatus();
    curLoc = [robotPos; robotOri];
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
        %%%%%%%% TO BE IMPLEMENTED %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        desAngSpeed = abs(60*(diffIKine(desCurSpe,desAngles)/(2*pi)));
        % Saturate speed
        desAngSpeed(desAngSpeed>5)=5;
        desAngSpeed(desAngSpeed<1)=1;
        desAngSpeed
        % desAngSpeed = [1;1;3;3;3;1;1];
        % Change desired angles to real motor angles
        motAngles = offsetMotorJoint(desAngles);
        % Update speed and angles when no simulation selected.
        % Chaned so the actual location is not read from motors.
        if (simulation == 0)
            syncRobotSpeeds(desAngSpeed);
            syncRobotAngles(motAngles);
            robotAngles = desAngles;
        else
            robotAngles = desAngles;
        end    
        updateRobotStatus();
    end
    % Repeat for finalTime to get desired location
    % Get the current desired location and speed
    for i=1:6
        desCurLoc(i) = aCoef(i,1) + aCoef(i,2)*finalTime + ...
                       aCoef(i,3)*finalTime^2 + aCoef(i,4)*finalTime^3;
        desCurSpe(i) = aCoef(i,2) + aCoef(i,3)*finalTime + ...
                       aCoef(i,4)*finalTime^2;
    end
    %desCurLoc
    % Inverse kinematics and inverse differential kinematics
    desAngles = iKineEu(desCurLoc);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%% TO BE IMPLEMENTED %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % desAngSpeed = diffInvKine(desCurSpe);

    % Change desired angles to real motor angles
    motAngles = offsetMotorJoint(desAngles);
    % Update speed and angles when no simulation selected.
    if (simulation == 0)
        syncRobotSpeeds(desAngSpeed);
        syncRobotAngles(motAngles);
    else
        robotAngles = desAngles;
    end        
    updateRobotStatus();
    % Location reached
    %disp('Location reached');
end