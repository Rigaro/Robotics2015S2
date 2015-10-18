% Makes a Joint movement between the current position
% and the desired position in task space. Using the desired
% joint speed.
% @param desLoc Desired location in task space.
% @param desSpeed Desired joint speed in joint space (1 to 100%).
% @param config the robot's configuration: 
% - 0 means the black gripper (2) is the base and the white gripper (1) 
%   is the end effector.
% - 1 means the white gripper (1) is the base and the black gripper (2) 
%   is the end effector.
function moveJ(desLoc, desSpeed, config)
    global updateRobotStatus
    global robotAngles
    global simulation
    % If no config chosen use the default (0) one.
    if (nargin < 3)
        config = 0;
    end
    desSpeed = [desSpeed;desSpeed;desSpeed;desSpeed;desSpeed;desSpeed;desSpeed];
    %Fast iKine
    if(config == 0)
        desAngles = iKineEu(desLoc);
        % Constrained optimization iKine
%     desAngles = iKineEuOpti(desLoc, robotAngles);
    else
        desAngles = iKineEuInv(desLoc);
        % Constrained optimization iKine
%     desAngles = iKineEuOpti(desLoc, robotAngles, config);
    end
    %Change desired angles to real motor angles
    motAngles = offsetMotorJoint(desAngles);
    % Update speed and angles when no simulation selected.
    if (simulation == 0)
        syncRobotSpeeds(desSpeed);
        syncRobotAngles(motAngles);
        robotAngles = desAngles;
    else
        robotAngles = desAngles;
    end        
    updateRobotStatus();
end