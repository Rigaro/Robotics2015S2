
function status = getGripperStatus(statusReq)
    global serialObj
    if(strcmp(statusReq,'gripStatus'))
        fprintf(serialObj,1);
    elseif(strcmp(statusReq,'proxSensor'))
        fprintf(serialObj,2);
    end
    status = fscanf(serialObj);
end