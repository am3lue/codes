// this code is made by: Francis Masanja
//this code is for Trafic Signal Project
//This code is made for the following Boards Arduino UNO Arduino MEGA and Arduino NANO
                                          //So am not so sure if it can work on other platforms


//defining the pins 
#define red 6
#define yellow 7
#define green 8

bool green_state = 0;
bool red_state = 0;
bool yellow_state = 1;

void setup() {
  // initializing the things in the system
  pinMode(red, OUTPUT);
  pinMode(yellow, OUTPUT);
  pintMode(green, OUTPUT)

}

void loop() {
  // Looping the things

  light_control();

}

void light_control(){
  //here am controling the lighting system
  if (yellow_state == 1){
    for(int = 8; i > 0; i--){
      digitalWrite(yellow, 1);
      delay(100 * i);
      digitalWrite(yellow, 0);
    }
    red_state = 1;
  } 
  if(red_state == 1){
    digitalWrite(red, 1);
    delay(3000);
    digitalWrite(red, 0);
    yellow_state = 1
  }
 if(green_state == 1){
    digitalWrite(green, 1);
    delay(3000);
    digitalWrite(green, 0);
    yellow_state = 1;
  }
}

// Thanks... =)