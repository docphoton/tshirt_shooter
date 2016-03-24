#include <Servo.h> 

Servo drive;
double reader;

void setup() 
{ 
  drive.attach(9);
  drive.write(90);  // set servo to off 0-180 foward is 0 back is 180 90 is no movement
Serial.begin(9600);
} 

void loop() {
   drive.write(0);
   digitalWrite(13,1);
     reader=drive.read();
    Serial.println(reader);
   delay(1000);
   drive.write(90);
   digitalWrite(13,0);
     reader=drive.read();
   Serial.println(reader);
    delay(1000);
  } 
