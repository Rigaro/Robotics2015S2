function[iAngle] = angleTo16int(angleDeg)
    if((angleDeg > 300)||(angleDeg < 0))
       disp('Angle is out of bounds. 0 <= angleDeg <= 300');
    else
       iAngle = round(angleDeg*1023/300);
    end