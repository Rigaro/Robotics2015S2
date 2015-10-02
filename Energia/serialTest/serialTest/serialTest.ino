/*
  Serial communication test program.

*/

#define GRIP_STATUS 1
#define PROX_SENSOR 2

int gButton = 0; // push button
int pButton = 0; // push button
int inByte = 0; // incoming serial byte
String gripStatus = "open"; //Gripper status: open, closed
String proxStatus = "far"; //Proximity sensor status: far, found, inpos
// set pin numbers:
const int gStatus = PUSH2;     // pushbutton simulating gripper status
const int pStatus = PUSH1;     // pushbutton simulating proximity sensor status

void setup()
{
  // start serial port at 9600 bps and wait for port to open:
  Serial.begin(9600);

  pinMode(gStatus, INPUT_PULLUP);
  pinMode(pStatus, INPUT_PULLUP);
  establishContact(); // send a byte to establish contact until receiver responds 
}

void loop()
{
  handleSerial();
}

/* 
  Establishes serial communication with PC 
*/
void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("established"); // send an initial string
    delay(300);
  }
}
/* 
  Handles serial communication with PC.
*/
void handleSerial() {
  // If we get a valid byte, it means the robot is requesting information
  // or updating status.
  if (Serial.available() > 0) {
    // get incoming instruction:
    inByte = Serial.read();
    //Handle instruction
    if(inByte == GRIP_STATUS) {
      Serial.println(getGripStatus());
    }else if(inByte == PROX_SENSOR){
      Serial.println(getProxStatus());
    }
  }
}

/*
  Handles gripper status. Currently simulated with pushbutton.
  @return String the gripper status depending on pushbutton.
*/
String getGripStatus() {  
    // read button
    gButton = digitalRead(gStatus);
    if(gButton == HIGH) {
      // send 1:
      return "open"; 
    }else{
      return "closed"; 
    }
}

/*
  Handles proximity sensor status. Currently simulated with pushbutton.
  @return String the proximity sensor status depending on pushbutton.
*/
String getProxStatus() {  
    // read button
    pButton = digitalRead(pStatus);
    if(pButton == HIGH) {
      // send 1:
      return "far"; 
    }else{
      return "found"; 
    }
}


