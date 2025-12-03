#include <Servo.h>
#include <Keypad.h>
#include <Password.h>
#include <LiquidCrystal_I2C.h>

// ------------------ OBJECTS ------------------
LiquidCrystal_I2C lcd(0x27, 16, 2);
Servo servo;

// ------------------ PINS ------------------
const int buzzer = 12;
const int servoPin = 10;

// ------------------ PASSWORD SETTINGS ------------------
Password password = Password("123456");
byte maxPasswordLength = 6;
byte currentPasswordLength = 0;

// ------------------ KEYPAD SETUP ------------------
const byte ROWS = 4;
const byte COLS = 4;

char keys[ROWS][COLS] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}
};

byte rowPins[ROWS] = {2, 3, 4, 5};
byte colPins[COLS] = {6, 7, 8, 9};

Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);

// ------------------ OTHER VARIABLES ------------------
byte a = 5;
bool doorState = false;   // false = locked, true = open

// ------------------ SETUP ------------------
void setup() {
  Serial.begin(9600);
  pinMode(buzzer, OUTPUT);

  servo.attach(servoPin);
  servo.write(90);   // LOCKED position

  lcd.init();
  lcd.backlight();
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("DOOR LOCK SYSTEM");
  delay(3000);
  lcd.clear();
}

// ------------------ MAIN LOOP ------------------
void loop() {
  lcd.setCursor(0, 0);
  lcd.print("ENTER PASSWORD");

  char key = keypad.getKey();

  if (key != NO_KEY) {
    delay(50);

    if (key == 'C') {
      resetPassword();
    }
    else if (key == 'D') {
      verifyPassword();
    }
    else {
      processNumberKey(key);
    }
  }
}

// ------------------ PASSWORD INPUT ------------------
void processNumberKey(char key) {
  lcd.setCursor(a, 1);
  lcd.print("*");
  a++;

  if (a > 15) a = 5;

  currentPasswordLength++;
  password.append(key);

  if (currentPasswordLength >= maxPasswordLength) {
    verifyPassword();
  }
}

// ------------------ VERIFY PASSWORD ------------------
void verifyPassword() {
  if (password.evaluate()) {
    digitalWrite(buzzer, 0);
    doorOpen();          // Open only on correct password
    delay(2000);         // Door stays open for 5 seconds
    doorLock();          // Auto lock after delay
  } 
  else {
    wrongPassword();    // Wrong password behavior
  }

  resetPassword();      // Always reset after attempt
}


// ------------------ DOOR OPEN ------------------
void doorOpen() {
  doorState = true;
  servo.write(180);

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("CORRECT PASSWORD");
  lcd.setCursor(0, 1);
  lcd.print("DOOR OPENED");

  delay(2000);
  lcd.clear();
}

// ------------------ DOOR LOCK ------------------
void doorLock() {
  doorState = false;
  servo.write(90);

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("CORRECT PASSWORD");
  lcd.setCursor(1, 1);
  lcd.print("DOOR LOCKED");

  delay(2000);
  lcd.clear();
}

// ------------------ WRONG PASSWORD ------------------
void wrongPassword() {
  digitalWrite(buzzer, 1);

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("WRONG PASSWORD");
  lcd.setCursor(0, 1);
  lcd.print("TRY AGAIN");

  delay(2000);
  digitalWrite(buzzer, 0);
  lcd.clear();
}

// ------------------ RESET PASSWORD ------------------
void resetPassword() {
  password.reset();
  currentPasswordLength = 0;
  a = 5;
  lcd.clear();
}
