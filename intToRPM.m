function[rpm] = intToRPM(rpmInt)
    if((rpmInt > 1023)||(rpmInt < 0))
       disp('Value is out of bounds. 0 <= rpmInt <= 1023');
    else
       rpm = round(rpmInt*114/1023);
    end