% Function to obtain parameters for cubic trajectory equation.
% Uses start and end position, assumes start and end velocity
% equal to 0, and takes a speed for calculating time required
% to perform movement.
% @param startLoc End effector start location. 6D vector.
% @param finalLoc End effector final location. 6D vector.
% @param speed End effectr speed in m/s
% @return A matrix with the a parameters for the cubic
%         equation for each of the task space coordinates.
function [aParam, finalTime] = cubicParameters(startLoc, finalLoc, speed)
    % Initialize variables
    startSpeed = 0;
    finalSpeed = 0;
    aParam = zeros(6,4);
    % Calculate distance that will be travelled.
    xDist = finalLoc(1) - startLoc(1);
    yDist = finalLoc(2) - startLoc(2);
    zDist = finalLoc(3) - startLoc(3);
    dist = sqrt(xDist^2 + yDist^2 + zDist^2);
    % Calculate the time taken using the desired speed.
    finalTime = dist/speed;
    % Compute A matrix from system of equations.
    A = [[1         0               0               0        ];
         [0         1               0               0        ];
         [1     finalTime       finalTime^2     finalTime^2  ];
         [0         1           2*finalTime     3*finalTime^2]];
    % For all coordinates in task space.
    for i=1:1:6
        % Create b matrix from equations.
        b = [startLoc(i); startSpeed; finalLoc(i); finalSpeed];
        % Calculate a parameters.
        aParam(i,:)=inv(A)*b;        
    end    
end