//CREATE TABLE SensorData (
//    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
//    sensor VARCHAR(30) NOT NULL,
//    location VARCHAR(30) NOT NULL,
//    distance VARCHAR(10),
//    reading_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
//)
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
#include <Wire.h>
#include <Ultrasonic.h>
int relayInput = 2; // the input to the relay pin
int LDR=A0;//Set A0(Analog Input) for LDR.
int value=0;
// Instantiate trig and echo pin for ultrasonic sensor
Ultrasonic ultrasonic(5, 4);//Trig Pin  D1 (GPIO 5),//Echo Pin  D2 (GPIO 4)
const char* ssid     = "Abhi";
const char* password = "12345678";
const char* serverName = "http://192.168.33.199/SocietyManagement-main/arduino/post-sensor-data.php";
String sensorName = "HC-SR04";
String sensorLocation = "Home";
  
void setup() {
  Serial.begin(115200);
  pinMode(relayInput, OUTPUT); // initialize pin as OUTPUT+
  digitalWrite(relayInput, HIGH);
  WiFi.begin(ssid, password);
  Serial.println("Connecting");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to WiFi network with IP Address: ");  
  Serial.println(WiFi.localIP());  
}

void loop() {
  long distance;
  distance = ultrasonic.read();
  Serial.println(distance);
  distance = distance - 6;
  distance = 50 - distance;
  long waterPercentage = 2*distance;
  if(waterPercentage < 0 || waterPercentage > 100) {
    waterPercentage = 90;
  }
  if(waterPercentage < 50) {
    digitalWrite(relayInput, LOW); // turn relay on
    delay(5000);
    digitalWrite(relayInput, HIGH); // turn relay on
    delay(5000);
  } else {
      digitalWrite(relayInput, HIGH);
    }
  Serial.println("Water Level: ");
  Serial.println(waterPercentage);
  
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;
    http.begin(serverName);

    http.addHeader("Content-Type", "application/x-www-form-urlencoded");

    // Prepare your HTTP POST request data
    String httpRequestData = "&sensor=" + sensorName + "&location=" + sensorLocation + "&distance=" + String(waterPercentage) + "";
    //String httpRequestData = "api_key=theiotprojects&sensor=HC-SR04&location=Home&distance=24.75";
    Serial.print("httpRequestData: ");
    Serial.println(httpRequestData);
    // Send HTTP POST request
    int httpResponseCode = http.POST(httpRequestData);

    if (httpResponseCode > 0) {
      Serial.print("HTTP Response code: ");
      Serial.println(httpResponseCode);
    }
    else {
      Serial.print("Error code: ");
      Serial.println(httpResponseCode);
    }
    // Free resources
    http.end();
  }
  else {
    Serial.println("WiFi Disconnected");
  }
  //Send an HTTP POST request every 20 seconds
  delay(5000);
}
