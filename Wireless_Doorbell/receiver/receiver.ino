
#include "pitches.h" //add Equivalent frequency for musical note
#include "themes.h" //add Note vale and duration 

void Play_Pirates()
{
  for (int thisNote = 0; thisNote < (sizeof(Pirates_note) / sizeof(int)); thisNote++) {

    int noteDuration = 1000 / Pirates_duration[thisNote];//convert duration to time delay
    tone(4, Pirates_note[thisNote], noteDuration);

    int pauseBetweenNotes = noteDuration * 1.05; //Here 1.05 is tempo, increase to play it slower
    delay(pauseBetweenNotes);
    noTone(4); //stop music on pin 8
  }
}

void Play_Titanic()
{
  for (int thisNote = 0; thisNote < (sizeof(Titanic_note) / sizeof(int)); thisNote++) {

    int noteDuration = 1000 / Titanic_duration[thisNote]; //convert duration to time delay
    tone(4, Titanic_note[thisNote], noteDuration);

    int pauseBetweenNotes = noteDuration * 1.30;//Here 1.30 is tempo, decrease to play it faster
    delay(pauseBetweenNotes);
    noTone(4); //stop music on pin 8
  }
}

void Play_MarioUW()
{
  for (int thisNote = 0; thisNote < (sizeof(MarioUW_note) / sizeof(int)); thisNote++) {

    int noteDuration = 1000 / MarioUW_duration[thisNote];//convert duration to time delay
    tone(4, MarioUW_note[thisNote], noteDuration);

    int pauseBetweenNotes = noteDuration * 1.80;
    delay(pauseBetweenNotes);
    noTone(4); //stop music on pin 8
  }
}

void Play_CrazyFrog()
{
  for (int thisNote = 0; thisNote < (sizeof(CrazyFrog_note) / sizeof(int)); thisNote++) {

    int noteDuration = 1000 / CrazyFrog_duration[thisNote]; //convert duration to time delay
    tone(4, CrazyFrog_note[thisNote], noteDuration);

    int pauseBetweenNotes = noteDuration * 1.30;//Here 1.30 is tempo, decrease to play it faster
    delay(pauseBetweenNotes);
    noTone(4); //stop music on pin 8
  }
}

#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

//#define led A0
int buttonState = 1;

RF24 radio(7, 8); // CE, CSN

byte addresses[][6] = {"0"};

void (*songs[4])() {
  Play_Pirates,
  Play_Titanic,
  Play_CrazyFrog,
  Play_MarioUW
};

int song_num = 0;
int servoCommand;

void setup() {
  Serial.begin(9600);
  pinMode(4, OUTPUT);
  radio.begin();
  radio.setChannel(115);
  radio.setPALevel(RF24_PA_MAX);
  radio.setDataRate( RF24_250KBPS );

  radio.openReadingPipe(1, addresses[0]);
  radio.startListening();
}

void loop() {
  if (Serial.available() > 0) {
    int i = Serial.read();
    if (i == 4 || i == 5) {
      servoCommand = i;
    }
    else if (i == 0 || i == 1 || i == 2 || i == 3) {
      song_num = i;
    }
  }

  if ( radio.available()) {
    while (radio.available()) {
      radio.read( &buttonState, sizeof(buttonState) );
    }
  }
  //if the button is pressed
  if (buttonState == 0) {
    songs[song_num]();
  }
  delay(100);
  radio.stopListening();
  radio.openWritingPipe(addresses[0]);
  radio.write(servoCommand, sizeof(servoCommand));
  radio.openReadingPipe(1, addresses[0]);
  radio.startListening();

}
