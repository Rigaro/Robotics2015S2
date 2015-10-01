#include <Wire.h>
#include <Adafruit_MotorShield.h>
#include "utility/Adafruit_PWMServoDriver.h"

#define MIN_GRIP_FORCE_V 20    //Minimum voltage we need to define as gripped
#define COUNTER_FOR_UNDO 1000    //How many delay seconds we need to undo gripper

// Create the motor shield object with the default I2C address
Adafruit_MotorShield AFMS = Adafruit_MotorShield(); 
// Or, create it with a different I2C address (say for stacking)
// Adafruit_MotorShield AFMS = Adafruit_MotorShield(0x61); 

// Select which 'port' M1, M2, M3 or M4. In this case, M1
Adafruit_DCMotor *motor1 = AFMS.getMotor(1);

// You can also make another motor on port M2
Adafruit_DCMotor *motor2 = AFMS.getMotor(2);

boolean gripped1=false;        //Lets us if gripper is gripped
boolean gripped2=false;        //Lets us if gripper is gripped
int undoCounter1=0;         //Counter for how long we've been undoing the motor
int undoCounter2=0;         //Counter for how long we've been undoing the motor

int analogPin1=A13;

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Adafruit Motorshield v2 - DC Motor test!");
  
  AFMS.begin();  // create with the default frequency 1.6KHz
  
  motor1->setSpeed(150);
  motor1->run(FORWARD);
  motor1->run(RELEASE);
  motor2->setSpeed(150);
  motor2->run(FORWARD);
  motor2->run(RELEASE);
  gripped1=isSecure();
}

void loop() {
  // Will assume bar is in gripper zone
  if(gripped1==TRUE){
    runMotor(1,COUNTER_FOR_UNDO,BACKWARD);
  }
    
  //Updating gripped status
  gripped1=isSecure();
  
  //Let's leave it gripped for a little while for demonstration
  if(gripped1==TRUE){
    //delay(1000);
  }
}

//Just a convenient function to encompass everything required to run the motor for a set time
void runMotor(uint8_t motorNum, int time, int fowardBack){
  if(motorNum==1){
    motor1->run(fowardBack);
    motor1->setSpeed(255);
    delay(time);
    motor1->setSpeed(0);
    motor1->run(RELEASE);
  }else if(motorNum==2){
    motor2->run(fowardBack);
    motor2->setSpeed(255);
    delay(time);
    motor2->setSpeed(0);
    motor2->run(RELEASE);
  }else{
    Serial.println("Invalid motorNum sent to runMotor()");
    return;
  }
}

//Returns true if the force resistor tells us we have contact
boolean isSecure(void){
  int sensorValue = analogRead(analogPin1);  //Gives voltage value
  Serial.println(sensorValue);
  return (sensorValue>=MIN_GRIP_FORCE_V);     //May not be accurate depending on implementation
}
