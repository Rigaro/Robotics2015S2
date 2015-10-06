#include <Wire.h>
#include <Adafruit_MotorShield.h>
#include "utility/Adafruit_PWMServoDriver.h"

#define MIN_GRIP_FORCE_V 20    //Minimum value we need to define as gripped
#define COUNTER_FOR_UNDO 3000    //How many delay (miliseconds) we need to undo gripper
#define PROX_FOUND_VAL 500    //Proximity sensor found value.

// Communications definitions - Gripper one
#define GRIP1_STATUS 1
#define PROX1_SENSOR 2
#define CLOSE1_CMD 3
#define OPEN1_CMD 4

// Communications definitions - Gripper two
#define GRIP2_STATUS 5
#define PROX2_SENSOR 6
#define CLOSE2_CMD 7
#define OPEN2_CMD 8

// Create the motor shield object with the default I2C address
Adafruit_MotorShield AFMS = Adafruit_MotorShield(); 

// Select motor ports for gripper 1 and 2
Adafruit_DCMotor *motor1 = AFMS.getMotor(1);
Adafruit_DCMotor *motor2 = AFMS.getMotor(2);

boolean gripped1 = false;        //Lets us if gripper 1 is gripped
boolean gripped2 = false;        //Lets us if gripper 2 is gripped
int undoCounter1 = 0;         //Counter for how long we've been undoing the motor
int undoCounter2 = 0;         //Counter for how long we've been undoing the motor

// Status variables
String gripStatus[] = {"open","open"}; //Gripper status: open, closed

// Status variables - Gripper 2
//String grip2Status = "open"; //Gripper status: open, closed

// Pin allocation - Gripper 1
int analogPin1=A13;
int proxPin1=31;

// Pin allocation - Gripper 2
int analogPin2=A13;
int proxPin2=11;

// Grip variables
boolean wantToGrip[] = {false,false};
boolean wantToUngrip[] = {false,false};

// Simulation
const int buttonPin = PUSH1;     // pushbutton simulating proximity sensor status

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  establishContact(); // send a byte to establish contact until receiver responds 
  
  AFMS.begin();  // create with the default frequency 1.6KHz
  // Simulation
  pinMode(buttonPin,INPUT_PULLUP);
  pinMode(proxPin1,INPUT);
}

void loop(){
  handleSerial();
  handleGripStatus(1);
}

// Handles and updates gripper status.
void handleGripStatus(int gripperNum) {
  if(wantToGrip[gripperNum-1]&&(gripStatus[gripperNum-1].equals("open"))){      // wantToGrip is placeholder for incoming info
    if(!isSecure(gripperNum)){  // isSecure is pressure sensor function - sees if gripped hard enough
      runMotor(gripperNum,20,FORWARD);
    }else if(isSecure(gripperNum)){ // gripper has been secured
      gripStatus[gripperNum-1] = "closed";
      wantToGrip[gripperNum-1] = false;
    }
  }
  if((wantToUngrip[gripperNum-1])&&(gripStatus[gripperNum-1].equals("closed"))){      // wantToGrip is placeholder for incoming info
    runMotor(gripperNum,COUNTER_FOR_UNDO,BACKWARD);
    gripStatus[gripperNum-1] = "open";
    wantToUngrip[gripperNum-1] = false;
  }
}

//Just a convenient function to encompass everything required to run the motor for a set time
void runMotor(uint8_t motorNum, int time, int fowardBack){
  if(motorNum==1){
    motor1->run(fowardBack);
    motor1->setSpeed(100);
    delay(time);
    motor1->setSpeed(0);
    motor1->run(RELEASE);
  }else if(motorNum==2){
    motor2->run(fowardBack);
    motor2->setSpeed(100);
    delay(time);
    motor2->setSpeed(0);
    motor2->run(RELEASE);
  }else{
    return;
  }
}

// Checks if the gripper is secured by checking the pressure sensor is above
// the desired value.
// @param gripperNum the gripper number to check.
// @return true when sensor value is above desired, false otherwise.
boolean isSecure(int gripperNum){
  // Select ADC to read.
  int sensorValue;
  if(gripperNum == 1){
    sensorValue = analogRead(analogPin1);  //Get ADC value
  }else if(gripperNum == 2){
    sensorValue = analogRead(analogPin2);  //Get ADC value
  }
  if (sensorValue>=MIN_GRIP_FORCE_V){
    return true;
  }
  else{
    return false;    //May not be accurate depending on implementation
  }
}

// Handles proximity sensor status depending on the current sensor reading.
// @param gripperNum the gripper number to obtain status.
// @return String with the current sensor status. found, inpos or far.
String getProxStatus(int gripperNum){
  int sensorValue;
  // Select ADC to read.
  if(gripperNum == 1){
    sensorValue = digitalRead(proxPin1);  //Get ADC value
  }else if(gripperNum == 2){
    sensorValue = digitalRead(proxPin2);  //Get ADC value
  }
  // Sensor in "found" range.
  if (sensorValue == LOW){
    return "found";
  }
  // Sensor in "far" range.
  else{
    return "far";
  }
}

boolean buttonOn(void){
  int buttonState = digitalRead(buttonPin);
  if (buttonState==HIGH){
    return true;
  }
  else{
    return false;
  }
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
  int inByte;
  if (Serial.available() > 0) {
    // get incoming instruction:
    inByte = Serial.read();
    //Handle instruction
    if(inByte == GRIP1_STATUS) {
      // Send Gripper 1 status.
      Serial.println(gripStatus[0]);
    }else if(inByte == PROX1_SENSOR){
      // Send Proximity sensor 1 status.
      Serial.println(getProxStatus(1));
    }else if((inByte == CLOSE1_CMD)&&(gripStatus[0].equals("open"))){
      // Close Gripper 1.
      wantToGrip[0] = true;
      Serial.println("ok");
    }else if((inByte == OPEN1_CMD)&&(gripStatus[0].equals("closed"))){
      // Open Gripper 1.
      wantToUngrip[0] = true;
      Serial.println("ok");
    }else if(inByte == GRIP2_STATUS) {
      // Send Gripper 1 status.
      Serial.println(gripStatus[1]);
    }else if(inByte == PROX2_SENSOR){
      // Send Proximity sensor 1 status.
      Serial.println(getProxStatus(2));
    }else if((inByte == CLOSE2_CMD)&&(gripStatus[1].equals("open"))){
      // Close Gripper 2.
      wantToGrip[1] = true;
      Serial.println("ok");
    }else if((inByte == OPEN2_CMD)&&(gripStatus[0].equals("closed"))){
      // Open Gripper 2.
      wantToUngrip[1] = true;
      Serial.println("ok");
    }else{
      Serial.println("No!");
    }
  }
}
