% Handles instructions and gripper status
% @param instruction The instruction to be handled, can be
% a status request or open/close instruction.
% -grip1Status: Gripper 1 status (open/closed).
% -prox1Sensor: Proximity sensor 1 status (far/found/inpos).
% -grip1Close: Close gripper 1.
% -grip1Open: Open gripper 1.
% -grip2Status: Gripper 2 status (open/closed).
% -prox2Sensor: Proximity sensor 2 status (far/found/inpos).
% -grip2Close: Close gripper 2.
% -grip2open: Open gripper 2.

function status = handleGripper(instruction)
    global serialObj
    if(strcmp(instruction,'grip1Status'))
        fprintf(serialObj,1);
    elseif(strcmp(instruction,'prox1Sensor'))
        fprintf(serialObj,2);
    elseif(strcmp(instruction,'grip1Close'))
        fprintf(serialObj,3);
    elseif(strcmp(instruction,'grip1Open'))
        fprintf(serialObj,4);
    elseif(strcmp(instruction,'grip2Status'))
        fprintf(serialObj,5);
    elseif(strcmp(instruction,'prox2Sensor'))
        fprintf(serialObj,6);
    elseif(strcmp(instruction,'grip2Close'))
        fprintf(serialObj,7);
    elseif(strcmp(instruction,'grip2Open'))
        fprintf(serialObj,8);
    end
    status = fscanf(serialObj);
end