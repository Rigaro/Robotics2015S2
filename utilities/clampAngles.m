function clampedAngles = clampAngles(desAngles)
    clampedAngles = zeros([7,1]);
    if(desAngles(1)<-150)
        clampedAngles(1)=-150;
    elseif(desAngles(1)>150)
        clampedAngles(1)=150;
    elseif(desAngles(2)<-100)
        clampedAngles(2)=-100;
    elseif(desAngles(2)>100)
        clampedAngles(2)=100;
    elseif(desAngles(3)<-150)
        clampedAngles(3)=-150;
    elseif(desAngles(3)>150)
        clampedAngles(3)=150;
    elseif(desAngles(4)<-100)
        clampedAngles(4)=-100;
    elseif(desAngles(4)>100)
        clampedAngles(4)=100;
    elseif(desAngles(5)<-150)
        clampedAngles(5)=-150;
    elseif(desAngles(5)>150)
        clampedAngles(5)=150;
    elseif(desAngles(6)<-100)
        clampedAngles(6)=-100;
    elseif(desAngles(6)>100)
        clampedAngles(6)=100;
    elseif(desAngles(7)<-150)
        clampedAngles(7)=-150;
    elseif(desAngles(7)>150)
        clampedAngles(7)=150;
    end
end