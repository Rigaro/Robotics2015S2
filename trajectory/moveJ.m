% Makes a Joint movement between the current position
% and the desired position in task space. Using the desired
% joint speed.
% @param desLoc Desired location in task space.
% @param desSpeed Desired joint speed in joint space (1 to 100%).
function moveJ(desLoc, desSpeed)
    global updateRobotStatus
    global robotAngles
    global simulation
    %Fast iKine
    desAngles = iKineEu(desLoc)
    %Change desired angles to real motor angles
    motAngles = offsetMotorJoint(desAngles)
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