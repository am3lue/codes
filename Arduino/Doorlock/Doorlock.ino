#include <WiFi.h>
#include <WebServer.h>
#include <Servo.h>

// ==== WiFi Credentials ====
const char* ssid = "AG HOMES second FLOOR ";
const char* password = "Agpg@1984s";

// ==== Servo Config ====
Servo doorServo;
const int servoPin = 13;
const int openAngle = 40;
const int closeAngle = 120;

// ==== Web Server ====
WebServer server(80);

void handleRoot() {
  String html = "<html>\
  <head>\
  <title>ESP32 Door Control</title>\
  <style>\
  body{background-color:#0f172a;color:white;text-align:center;font-family:Arial;margin-top:100px;}\
  button{background-color:#38bdf8;border:none;padding:20px 40px;margin:20px;font-size:20px;color:white;border-radius:15px;cursor:pointer;}\
  button:hover{background-color:#0284c7;}\
  </style>\
  </head>\
  <body>\
  <h1> ESP32 WiFi Door Control</h1>\
  <button onclick=\"location.href='/open'\">Open Door</button>\
  <button onclick=\"location.href='/close'\">Close Door</button>\
  </body>\
  </html>";
  server.send(200, "text/html", html);
}

void handleOpen() {
  doorServo.write(openAngle);
  server.send(200, "text/html", "<html><body><h2>Door Opened </h2><a href='/'>Back</a></body></html>");
}

void handleClose() {
  doorServo.write(closeAngle);
  server.send(200, "text/html", "<html><body><h2>Door Closed </h2><a href='/'>Back</a></body></html>");
}

void setup() {
  Serial.begin(115200);
  doorServo.attach(servoPin);
  doorServo.write(closeAngle); // Start closed

  Serial.println("Connecting to WiFi...");
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("\nWiFi connected!");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  // Setup routes
  server.on("/", handleRoot);
  server.on("/open", handleOpen);
  server.on("/close", handleClose);

  server.begin();
  Serial.println("HTTP server started");
}

void loop() {
  server.handleClient();
}
