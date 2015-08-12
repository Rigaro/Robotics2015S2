function[iAngle] = angleTo16int(angleDeg)
    if((angleDeg > 360)||(angleDeg < 0))
       disp('Angle is out of bounds. 0 <= angleDeg <= 360');
    else
       iAngle = round(angleDeg*1023/360);
    end