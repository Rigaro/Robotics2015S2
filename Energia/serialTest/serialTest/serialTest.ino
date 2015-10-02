/*
  Serial communication test program.

*/

int switchVal = 0; // push button
int inByte = 0; // incoming serial byte
// set pin numbers:
const int buttonPin = PUSH2;     // the number of the pushbutton pin

void setup()
{
  // start serial port at 9600 bps and wait for port to open:
  Serial.begin(9600);

  pinMode(buttonPin, INPUT_PULLUP); // digital sensor is on digital pin 2
  establishContact(); // send a byte to establish contact until receiver responds 
}

void loop()
{
  // if we get a valid byte, read analog ins:
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
    // read switch
    switchVal = digitalRead(buttonPin);
    if(switchVal == HIGH) {
      // send 1:
      Serial.println("released"); 
    }else{
      Serial.println("pressed");
    }
  }
  //Serial.println("1"); 
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("established"); // send an initial string
    delay(300);
  }
}


