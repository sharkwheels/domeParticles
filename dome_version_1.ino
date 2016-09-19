/*************************************************** 
Meditation Dome Prototype / Proof of Tech Concept 1.0
September 2016
Nadine L
****************************************************/
 
#include <Wire.h>
#include <SPI.h>
#include <Adafruit_CAP1188.h>

// Reset Pin is used for I2C or SPI
#define CAP1188_RESET  5
#define CAP1188_SENSITIVITY 0x1F

Adafruit_CAP1188 cap = Adafruit_CAP1188(CAP1188_RESET);

boolean wasFour = false;

void setup() {
  BeanHid.enable();
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for Leonardo/Micro only
  }
  Serial.println("CAP1188 test!");
  
  if (!cap.begin()) {
    Serial.println("CAP1188 not found");
    while (1);
  }
  Serial.println("CAP1188 found!");
  //Decrease sensitivity a little - default is 0x2F (32x) per datasheet
  cap.writeRegister(CAP1188_SENSITIVITY, 0x6F);  // the higher the hex the lower the sensitivity
  //Serial.print("Sensitivity: 0x");
  //Serial.println(cap.readRegister(CAP1188_SENSITIVITY), HEX);
}

void loop() {
  uint8_t touched = cap.touched();
  if (touched == 0) {
    // No touch detected
    sawTarget = false;
    wasFour = false;
    wasSeven = false;
    BeanHid.releaseAllKeys();
    return;
  }
  // Check each bit, each bit represents 1 sensor
  for (uint8_t i=0; i<8; i++) {        

    // w and a have to stream
    if (touched & (1 << i)) {
      //Serial.print("C"); Serial.print(i+1); Serial.print("\t");
      if(i+1 == 2){
        BeanHid.holdKey('a'); //speed
      } 

      if(i+1 == 7){
        BeanHid.holdKey('w'); // wind
      }
      
      // don't stream, send one full key press
      // this one adds particle effects.
      if(!wasFour && i+1 == 4){
        BeanHid.sendKey('s');
        wasFour = true;
      } 
    }
  }
  delay(50);
}
