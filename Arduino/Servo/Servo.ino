//This is for the Trials of Servor motors

//Including the libraries
#include "Servo.h"

#define servo_pin 4

Servo servo;


void setup() {
  Serial.begin(115200);
  servo.attach(servo_pin); // attaching the pin to the object
  servo.write(0); 
  delay(2000);

}

void loop() {
  
  // for(int p = 0; p < 180; p+=45){
  //   servo.write(p);
  //   Serial.print("Position : ");
  //   Serial.println(p);
  //   delay(1000);
  // }

  // for(int p = 180; p > 0; p-=45){
  //   servo.write(p);
  //   Serial.print("Positon : ");
  //   Serial.println(p);
  //   delay(1000);
  // }

  servo.write(0);
  delay(3000);

  servo.write(180);
  delay(3000);

  Serial.println("AM Done rotating");
  delay(1000);

}
