#include <WiFi.h>
#include <WebServer.h>
#include <WiFiUdp.h>
//#include <OSCMessage.h>


const int Kick = 34;      // select the pin for the LED
const int Scrib = 35;
const int Butt = 13;


int valKick = 0;  // variable to store the value coming from the sensor
int valScrib = 0;
int valButt = 0;

/* Put your SSID & Password */
const char* ssid = "Jordan32";  // Enter SSID here
const char* password = "Jordan32";  //Enter Password here

/* Put IP Address details */
IPAddress local_ip(192,168,1,1);
IPAddress gateway(192,168,1,1);
IPAddress subnet(255,255,255,0);

WebServer server(80);

WiFiUDP udp;

void setup() {
  Serial.begin(115200);

  WiFi.softAP(ssid, password);
  WiFi.softAPConfig(local_ip, gateway, subnet);
  server.begin();
}

void loop(){

  valKick= digitalRead(Kick);
  valButt = digitalRead(Butt);
  valScrib= analogRead(Scrib);
    
    udp.beginPacket("192.168.1.2",60001);
    udp.print(valKick);
    udp.endPacket();  

    udp.beginPacket("192.168.1.2", 60002);
    udp.print(valButt);
    udp.endPacket();

    udp.beginPacket("192.168.1.2", 60003);
    udp.print(valScrib);
    udp.endPacket();

    
  //Wait for 1 second
  delay(150);

}
