
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
#include <Servo.h>

int servoPin = 9;
Servo myDoor;

#define buttonPin 4
int buttonState;
int servoCommand;
int servoPos = 10;

RF24 radio(7, 8); // CE, CSN
byte addresses[][6] = {"0"};

void setup() {
  Serial.begin(9600);
  pinMode(buttonPin, INPUT_PULLUP);
  radio.begin();
  radio.setChannel(115);
  radio.setPALevel(RF24_PA_MAX);
  radio.setDataRate( RF24_250KBPS );

  radio.openReadingPipe(1, addresses[0]);
  radio.startListening();

  myDoor.attach(servoPin);
  myDoor.write(servoPos);
}

void loop() {
  if ( radio.available()) {
    while (radio.available()) {
      radio.read( &servoCommand, sizeof(servoCommand) );
      //Serial.println(servoCommand);
    }
  }

  if (servoCommand < 0) {
    myDoor.write(90);
  }
  else if (servoCommand > 0) {
    myDoor.write(10);
  }

  buttonState = digitalRead(buttonPin);
  if (buttonState == 1) {
    buttonState = 1;
  }
  else if (buttonState == 0) {
    buttonState = 0;
  }
  delay(100);
  radio.stopListening();
  radio.openWritingPipe(addresses[0]);
  radio.write(&buttonState, sizeof(buttonState));
  radio.openReadingPipe(1, addresses[0]);
  radio.startListening();
}
