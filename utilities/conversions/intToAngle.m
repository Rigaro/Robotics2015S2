function[degAngle] = intToAngle(angleInt)
    if((angleInt > 1023)||(angleInt < 0))
       disp('Value is out of bounds. 0 <= angleInt <= 1023');
    else
       degAngle = round(angleInt*300/1023);
    end