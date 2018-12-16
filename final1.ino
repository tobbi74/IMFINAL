
#include "pitches.h"

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  pinMode(but1, INPUT);
  pinMode(but2, INPUT);
  pinMode(but3, INPUT);
  pinMode(but4, INPUT);
  pinMode(but5, INPUT);
  pinMode(but6, INPUT);
  pinMode(but7, INPUT);
  pinMode(but8, INPUT);
  pinMode(but9, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (digitalRead(2) == HIGH) { 
    Serial.write('a');
    Serial.println('a');
    tone(13, NOTE_C4);
    delay(100);
  }
  if else (digitalRead(3) == HIGH) { 
    Serial.write('b');
    Serial.println('b');
    tone(13, NOTE_D4);
    delay(100);
  }
  if else (digitalRead(4) == HIGH) {
    Serial.write('c');
    Serial.println('c');
    tone(13, NOTE_E4);
    delay(100);
  }
  if else (digitalRead(5) == HIGH) {
    Serial.write('d');
    Serial.println('d');
    tone(13, NOTE_F4);
    delay(100);
  }
  if else (digitalRead(6) == HIGH) {
    Serial.write('e');
    Serial.println('e');
    tone(13, NOTE_G4);
    delay(100);
  }
  if else (digitalRead(7) == HIGH) {
    Serial.write('f');
    Serial.println('f');
    tone(13, NOTE_A4);
    delay(100);
  }
  if else (digitalRead(8) == HIGH) {
    Serial.write('g');
    Serial.println('g');
    tone(13, NOTE_B4);
    delay(100);
  }
  if else (digitalRead(9) == HIGH) {
    Serial.write('h');
    Serial.println('h');
    tone(13, NOTE_C5);
    delay(100);
  }
  delay(150);
}
