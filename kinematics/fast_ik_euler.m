function jd = fast_ik_euler(pose, eu)
%implements fast inverse kinematics
%default is elbow up (eu is -1), otherwise set eu to 1
%
%returns a joint displacement vector (in degrees) given a desired pose
%[r_pos; r_ori] where r_pos = [x; y; z] is the desired position and
%r_ori = [alpha; beta; gamma] is the euler angles for desired rotation
%given by ROE = RotX(alpha)*RotY(beta)*RotZ(gamma)
%accepts matrix 6 by n and returns matrix 7 by n
%will cause error if in unreachable pose

if (nargin < 2)
    eu = -1;
end

%initialise parameters
[design_params, motor_origins, e_eff] = init();

%distance between wrist and end effector
dE = e_eff + motor_origins(7);

%distance between origin and elbow
d3 = design_params(3, 3);
%distance between elbow and wrist
d5 = design_params(5, 3);

n = size(pose, 2);
jd = zeros(7, n);

for i = 1:n
    %create reference position
    rOE = pose(1:3, i);
    alph = pose(4, i);
    bet = pose(5, i);
    gam = pose(6, i);
    %create reference orientation
    RotX = [1    0         0;
          0 cos(alph) -sin(alph);
          0 sin(alph)  cos(alph)];
      
    RotY =  [cos(bet) 0 sin(bet);
            0       1     0;
          -sin(bet) 0 cos(bet)];
      
    RotZ = [cos(gam)  -sin(gam)  0;
           sin(gam)  cos(gam)   0;
              0           0         1];
 
    ROE = RotX*RotY*RotZ;
    
    %transformation between origin and end-effector
    TOE = [ROE, rOE;
        [0 0 0 1]];
    
    %find vector from origin to wrist
    rOW = rOE - ROE*[0; 0; dE];
    
    %find inner elbow angle using cos rule
    gamma = acos(-(norm(rOW)^2 - d3^2 - d5^2)/(2*d3*d5));
    
    %change between negative for "elbow up" and positive for "elbow down"
    q4 = eu*(pi - gamma);
    if(q4 > pi)
        q4 = q4-(2*pi);
    elseif(q4 < -pi)
        q4 = q4+(2*pi);
    end
    
    %compute q2
    q2 = 2*atan2(-d5*sin(q4) - sqrt((d3+d5*cos(q4))^2 + (-d5*sin(q4))^2 - rOW(3)^2), d3 + d5*cos(q4) + rOW(3));
    if(q2 > pi)
        q2 = q2-(2*pi);
    elseif(q2 < -pi)
        q2 = q2+(2*pi);
    end
    %compute q1. should possibly have positive arguments, but for some reason
    %putting them negative makes it work. still not well understood. results
    %can vary between MATLAB versions
    q1 = atan2(-rOW(2), -rOW(1));
    if(q1 > pi)
        q1 = q1-(2*pi);
    elseif(q1 < -pi)
        q1 = q1+(2*pi);
    end
    %numerical transformation matrix between origin and elbow
    T04 = [[ cos(q1)*cos(q2)*cos(q4) - cos(q1)*sin(q2)*sin(q4), - cos(q1)*cos(q2)*sin(q4) - cos(q1)*cos(q4)*sin(q2), -sin(q1), 0.102*cos(q1)*sin(q2)];
        [ cos(q2)*cos(q4)*sin(q1) - sin(q1)*sin(q2)*sin(q4), - cos(q2)*sin(q1)*sin(q4) - cos(q4)*sin(q1)*sin(q2),  cos(q1), 0.102*sin(q1)*sin(q2)];
        [               - cos(q2)*sin(q4) - cos(q4)*sin(q2),                   sin(q2)*sin(q4) - cos(q2)*cos(q4),        0,         0.102*cos(q2)];
        [                                                 0,                                                   0,        0,                        1]];
    %numerical transformation between elbow and end effector
    T4E_n = T04\TOE;
    
    %compute q6, q7, q5    
    flippedq5 = 0;
    q5 = atan2(T4E_n(3, 3), T4E_n(1, 3));
    if(q5 > pi)
        q5 = q5-(2*pi);
    elseif(q5 < -pi)
        q5 = q5+(2*pi);
    elseif((q5 == pi)||(q5 == -pi))
        q5 = 0;
        flippedq5 = 1;
    end
    q6 = acos(-T4E_n(2, 3));
    if(q6 > pi)
        q6 = q6-(2*pi);
    elseif(q6 < -pi)
        q6 = q6+(2*pi);
    end
    if (flippedq5 == 1)
        q6 = -q6;
    end
    q7 = atan2(-T4E_n(2, 2), T4E_n(2, 1));
    if(q7 > pi)
        q7 = q7-(2*pi);
    elseif(q7 < -pi)
        q7 = q7+(2*pi);
    end
    %set q3 = 0 (redundant manipulator)
    q3 = 0;
    
    %convert to degrees and make between -180 and 180 before output
    jd(:, i) = rad2deg([q1; q2; q3; q4; q5; q6; q7]);
    
end