function[iRPM] = rpmTo16int(jointRPM)
    if((jointRPM > 114)||(jointRPM < 0))
       disp('jointRPM is out of bounds. 0 <= angleDeg <= 114');
    else
       iRPM = round(jointRPM*1023/114);
    end