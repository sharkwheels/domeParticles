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

// Use I2C, no reset pin!
//Adafruit_CAP1188 cap = Adafruit_CAP1188();
// Or...Use I2C, with reset pin
Adafruit_CAP1188 cap = Adafruit_CAP1188(CAP1188_RESET);

boolean wasTwo = false;
boolean wasFour = false;
boolean wasSeven = false;

void setup() {
  BeanHid.enable();
  Serial.begin(9600);
  // Serial port is initialized automatically; we don't have to do anything
  
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

  //Serial.println(wasTwo);

  uint8_t touched = cap.touched();
  if (touched == 0) {
    // No touch detected
    wasTwo = false;
    wasFour = false;
    wasSeven = false;
    Serial.write(0);
    return;
  }
  
  for (uint8_t i=0; i<8; i++) {        // Check each bit, each bit represents 1 sensor
    
    if (touched & (1 << i)) {
      //Serial.print("C"); Serial.print(i+1); Serial.print("\t");
      if(!wasTwo && i+1 == 2){
        //Serial.write(2);
        //Serial.println("2");
        BeanHid.sendKey('a');
        wasTwo = true;
      } else if(!wasFour && i+1 == 4){
        //Serial.write(4);
        //Serial.println("4");
        BeanHid.sendKey('s');
        wasFour = true;
      } else if(!wasSeven && i+1 == 7){
        //Serial.write(7);
        //Serial.println("7");
        BeanHid.sendKey('w');
        wasSeven = true;
      }
    }
  }




  delay(50);
}

//forum shit: https://forums.adafruit.com/viewtopic.php?f=19&t=55900&p=283907&hilit=control+sensitivity+of+cap1188#p283907
