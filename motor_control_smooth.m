// Smooth out the motor controller response. 
// 
// Generates a triangle wave in PWM so that when the arduino talks to the TALON motor controllers there is not this embarrasing upwind when we switch PWM values. Dr. C. thinks this is due to the fact that the freqeuncy from the arduino is mismatched to the sync capabilities of the TALON conotrollers and they are stuttering. 
//    it is akin, like a physical version of a clock domain crossing error. 
#include <Servo.h> 
  Servo LdriveB;
  int income;
void setup()
{
  Serial.begin(9600);
LdriveB.attach(3);
income=-1;
}

int x = 0, count = 0, num=1;
double temp=0, dutycycle=135, val=0;
void loop()
{
  income = Serial.read();
  
  if(income==119){//w
   LdriveB.write(1000);
  }
  else if(income==115){//s
     LdriveB.write(2000);
  }
  else{
    LdriveB.write(1500);
  }
 
  Serial.println(income);
  delay(100);
}
