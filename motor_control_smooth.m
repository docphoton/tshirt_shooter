void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
 

}
int val=0, count=0;
void loop() {
  // put your main code here, to run repeatedly:
  count++;
  if(count<=250){
    val--;
  }
  else if(count>=250){
    val++;
  }
  if(count>=500){
    count=0;
  }
  analogWrite(3,val);
  Serial.println(val);
}
