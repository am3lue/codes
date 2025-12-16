//Atempt made by: Francis Masanja
// This is the code for Blinking of the led
// This code is made special for the Arduino UNO Arduino NANO and Arduino MEGA 
//                              So am not so sure if it works on the other boards =)

#define led 7 // Assuming you have an LED placed on the pin number 7


void setup() {
  // identifying the applience to the system
  pinMode(OUTPUT, led);

}

void loop() {
  // making the led to blink

  for(int i = 0; i < 10; i++){
    for (int j = 0; i < i; j++){
      digitalWrite(led, 1);
      delay(100 * j);
      digitalWrite(led, 0);
    } // This makes the delay time to increase with the increase in times of blinking
  }

}

// Thanks .... =)