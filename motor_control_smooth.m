//drives via putty wasd on computer
#include <Servo.h> 
  Servo Ldrive,Rdrive;
  int income;
void setup()
{
  Serial.begin(9600);
Ldrive.attach(3);
Rdrive.attach(6);
income=-1;
}

int x = 0, count = 0, num=1;
double temp=0, dutycycle=135, val=0;
void loop()
{
  income = Serial.read();
  
  if(income==119){//w forward
   Ldrive.write(1200);
   Rdrive.write(1800);
  }
    else if(income==97){//a left
   Ldrive.write(1200);
   Rdrive.write(1200);
  }
  else if(income==115){//s back
     Ldrive.write(1800);
     Rdrive.write(1200);
  }
  else if(income==100){//d right
     Ldrive.write(1800);
     Rdrive.write(1800);
  }
  else{
    Ldrive.write(1500);
    Rdrive.write(1500);
  }
 
  Serial.println(income);
  delay(42);
}
