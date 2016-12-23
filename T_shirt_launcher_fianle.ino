/* Circuit Birds T-Shirt Robot 2016
 *  Bluetooth Arduino Robot
 *  
 *  Left=a
 *  Forward=w
 *  Right=d
 *  Back=s
 * 
 * ID= testbot
 * Pass=1234
 * 
 */
#include <Servo.h> 
//load up servo files
  Servo Ldrive,Rdrive,Spin;
  //servo range from 1000 to 2000 with 1500 being neutrel
  int income,incomeprev;
  bool fstate,lstate,bstate,rstate,letgo,shotswitch,spincheck;
  bool dummy;
  //name for bluetooth incoming data
void setup()
{
  pinMode(9,INPUT);
   digitalWrite(9,HIGH);
  digitalWrite(7,LOW);
  Serial.begin(9600);
  //9600 mbs will conigure the serial(bluetooth) reader
  
Ldrive.attach(3);
Rdrive.attach(6);
Spin.attach(10);

//Pins must be set to servo mode as such before use

income=-1;
incomeprev=-1;
//will clear up any data thats is being sent to it on boot

fstate=0;
lstate=0;
bstate=0;
rstate=0;

letgo=0;//let go of the buttons
shotswitch=1;
spincheck=0;
}

void loop()
{
  income = Serial.read();
   //reads the incoming data sent
 if(income==incomeprev==-1){
  incomeprev=0;  
 }
 if(income!=incomeprev){
  if(income==49){//1 forward
    fstate=!fstate;
   lstate=0;
   bstate=0;
   rstate=0;
  }
  if(income==50){//2 back
    fstate=0;
   lstate=0;
   bstate=!bstate;
   rstate=0;
  }
  if(income==51){//3 left
    fstate=0;
   lstate=!lstate;
   bstate=0;
   rstate=0;
  }
  if(income==52){//4 right
    fstate=0;
   lstate=0;
   bstate=0;
   rstate=!rstate;
  }
 }
 incomeprev=income;
 

 
  if(fstate){//w forward 119
     Ldrive.write(1400);
   Rdrive.write(1600);
   /*Ldrive.write(1200);
   Rdrive.write(1800);
  */
  }
    else if(lstate){//a left 97
   Ldrive.write(1400);
   Rdrive.write(1400);
  }
  else if(bstate){//s back 115
     Ldrive.write(1600);
     Rdrive.write(1400);
  }
  else if(rstate){//d right 100
     Ldrive.write(1600);
     Rdrive.write(1600);
  }
  else{//NEUTREAL brake
    delay(10);
    Ldrive.write(1500);
    Rdrive.write(1500);
  }
  dummy=digitalRead(7);
 if(income==57&&spincheck==0){//9 Shoot X
  spincheck=1;
  digitalWrite(7,HIGH);
  delay(250);
   digitalWrite(7,LOW);
  Spin.write(1700);
  delay(1000);
  shotswitch=1;
    while(shotswitch==1){
    shotswitch=digitalRead(9);
  Serial.println(shotswitch);
    }
      delay(400);
  Spin.write(1300);
  delay(150);
  Spin.write(1500);
  digitalWrite(9,HIGH);
 spincheck=0;
 }
 dummy=digitalRead(7);
 Serial.println(dummy);
 // Serial.println(shotswitch);
  //for debugging sends to serial moniter on a pc. (may be a sepret com port open for it)
 //delay(42);
  //"the meaning of life the universe and everything." and a very nice delay.
}

