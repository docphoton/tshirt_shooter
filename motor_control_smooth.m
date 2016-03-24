// Smooth out the motor controller response. 
// 
// Generates a triangle wave in PWM so that when the arduino talks to the TALON motor controllers there is not this embarrasing upwind when we switch PWM values. Dr. C. thinks this is due to the fact that the freqeuncy from the arduino is mismatched to the sync capabilities of the TALON conotrollers and they are stuttering. 
//    it is akin, like a physical version of a clock domain crossing error. 

void setup()
{
  Serial.begin(9600);
}

int x = 0, count = 0, num=1;
double temp=0, dutycycle=135, val=0;
void loop()
{
  count++;
if(count<250)  {
  val=val-1; 
}
 if(count>250){ 
  val = val+1; 
} 
 if (count>=500){
     count = 0;
  } 
  analogWrite(3, val);
  delay(30); 
  Serial.println(val,5); 
}
