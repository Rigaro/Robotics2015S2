/* 
This is a test sketch for the Adafruit assembled Motor Shield for Arduino v2
It won't work with v1.x motor shields! Only for the v2's with built in PWM
control

For use with the Adafruit Motor Shield v2 
---->	http://www.adafruit.com/products/1438
*/

#include <Wire.h>
#include <Adafruit_MotorShield.h>
#include "utility/Adafruit_PWMServoDriver.h"

// Create the motor shield object with the default I2C address
Adafruit_MotorShield AFMS = Adafruit_MotorShield(); 
// Or, create it with a different I2C address (say for stacking)
// Adafruit_MotorShield AFMS = Adafruit_MotorShield(0x61); 

// Select which 'port' M1, M2, M3 or M4. In this case, M1
Adafruit_DCMotor *motor1 = AFMS.getMotor(1);
// You can also make another motor on port M2
Adafruit_DCMotor *motor2 = AFMS.getMotor(2);

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Adafruit Motorshield v2 - DC Motor test!");

  AFMS.begin();  // create with the default frequency 1.6KHz
  //AFMS.begin(1000);  // OR with a different frequency, say 1KHz
  
  // Set the speed to start, from 0 (off) to 255 (max speed)
  motor1->setSpeed(150);
  motor1->run(FORWARD);
  // turn on motor
  motor1->run(RELEASE);
  motor2->setSpeed(150);
  motor2->run(FORWARD);
  // turn on motor
  motor2->run(RELEASE);
}

void loop() {
  uint8_t i;
  
  Serial.print("tick");

  motor1->run(FORWARD);
  motor2->run(FORWARD);
  //for (i=0; i<255; i++) {
    motor1->setSpeed(255); 
    motor2->setSpeed(255);  
    delay(5000);
  //}
  //for (i=255; i!=0; i--) {
    motor1->setSpeed(0); 
    motor2->setSpeed(0);  
    delay(1000);
  //}
  
  Serial.print("tock");

  motor1->run(BACKWARD);
  motor2->run(BACKWARD);
  //for (i=0; i<255; i++) {
    motor1->setSpeed(255); 
    motor2->setSpeed(255); 
    delay(5000);
  //}
  //for (i=255; i!=0; i--) {
    motor1->setSpeed(0); 
    motor2->setSpeed(0);  
    delay(1000);
  //}

  Serial.print("tech");
  motor1->run(RELEASE);
  motor2->run(RELEASE);
  delay(1000);
}
