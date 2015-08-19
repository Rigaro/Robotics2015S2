function setJointSpeed(desiredSpeed, motorID)

global ERRBIT_VOLTAGE
ERRBIT_VOLTAGE     = 1;
global ERRBIT_ANGLE 
ERRBIT_ANGLE       = 2;
global ERRBIT_OVERHEAT
ERRBIT_OVERHEAT    = 4;
global ERRBIT_RANGE
ERRBIT_RANGE       = 8;
global ERRBIT_CHECKSUM
ERRBIT_CHECKSUM    = 16;
global ERRBIT_OVERLOAD
ERRBIT_OVERLOAD    = 32;
global ERRBIT_INSTRUCTION
ERRBIT_INSTRUCTION = 64;

global COMM_TXSUCCESS
COMM_TXSUCCESS     = 0;
global COMM_RXSUCCESS
COMM_RXSUCCESS     = 1;
global COMM_TXFAIL
COMM_TXFAIL        = 2;
global COMM_RXFAIL
COMM_RXFAIL        = 3;
global COMM_TXERROR
COMM_TXERROR       = 4;
global COMM_RXWAITING
COMM_RXWAITING     = 5;
global COMM_RXTIMEOUT
COMM_RXTIMEOUT     = 6;
global COMM_RXCORRUPT
COMM_RXCORRUPT     = 7;

%Check if library is not loaded, and load if not.
if(~libisloaded('dynamixel'))
    loadlibrary('dynamixel','dynamixel.h');
end

%Instruction data constants
P_GOAL_SPEED = 32;
DEFAULT_PORTNUM = 3; % com3
DEFAULT_BAUDNUM = 1; % 1mbps

%Variables
int32 angleInt;
rpmInt = rpmTo16int(desiredSpeed);
int32 PresentPos;
int32 CommStatus;

%open device
res = calllib('dynamixel','dxl_initialize',DEFAULT_PORTNUM,DEFAULT_BAUDNUM);
if res == 1
    %Write motor speed
    disp(['Setting speed for Joint: ' num2str(motorID) '. to: ' num2str(desiredSpeed) ' RPM.']);
    calllib('dynamixel','dxl_write_word',motorID,P_GOAL_SPEED,rpmInt);  
    %Get motor status
    CommStatus = int32(calllib('dynamixel','dxl_get_result'));
    if CommStatus == COMM_RXSUCCESS
        PrintErrorCode();
    else
        PrintCommStatus(CommStatus);
    end    
else
    disp('Failed to open USB2Dynamixel!');
end
disp('Success');
%Close Device if library is loaded.
if(libisloaded('dynamixel'))
    calllib('dynamixel','dxl_terminate');  
    unloadlibrary('dynamixel');
end


%Print commuication result
function [] = PrintErrorCode()
global ERRBIT_VOLTAGE
global ERRBIT_ANGLE 
global ERRBIT_OVERHEAT
global ERRBIT_RANGE
global ERRBIT_CHECKSUM
global ERRBIT_OVERLOAD
global ERRBIT_INSTRUCTION


 if int32(calllib('dynamixel','dxl_get_rxpacket_error', ERRBIT_VOLTAGE))==1
     disp('Input Voltage Error!');
 elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_ANGLE))==1
     disp('Angle limit error!');
 elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_OVERHEAT))==1
     disp('Overheat error!');
 elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_RANGE))==1
     disp('Out of range error!');
 elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_CHECKSUM))==1
     disp('Checksum error!');
 elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_OVERLOAD))==1
     disp('Overload error!');
 elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_INSTRUCTION))==1
     disp('Instruction code error!');
 end
     
 % Print error bit of status packet
 function [] = PrintCommStatus( CommStatus )

global COMM_TXFAIL
global COMM_RXFAIL
global COMM_TXERROR
global COMM_RXWAITING
global COMM_RXTIMEOUT
global COMM_RXCORRUPT

switch(CommStatus)
    case COMM_TXFAIL
        disp('COMM_TXFAIL : Failed transmit instruction packet!');
    case COMM_TXERROR
        disp('COMM_TXERROR: Incorrect instruction packet!');
    case COMM_RXFAIL
        disp('COMM_RXFAIL: Failed get status packet from device!');
    case COMM_RXWAITING
        disp('COMM_RXWAITING: Now recieving status packet!');
    case COMM_RXTIMEOUT
        disp('COMM_RXTIMEOUT: There is no status packet!');
    case COMM_RXCORRUPT
        disp('COMM_RXCORRUPT: Incorrect status packet!');
    otherwise
        disp('This is unknown error code!');
  
end


     

