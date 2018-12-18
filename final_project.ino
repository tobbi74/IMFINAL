const int but1 = 2;
const int but2 = 3;
const int but3 = 4;
const int but4 = 5;    //press buttons pin
const int but5 = 6;
const int but6 = 7;
const int but7 = 8;
const int but8 = 9;
const int but9 = 10;

const int led1 = 11;
const int led2 = 12;
const int led3 = 13;
const int led4 = A5;   //LEDs pin
const int led5 = A4;
const int led6 = A3;
const int led7 = A2;
const int led8 = A1;
const int led9 = A0;

int lastBut1;
int lastBut2;
int lastBut3;
int lastBut4;
int lastBut5;   //remember the last state of the 
int lastBut6;
int lastBut7;
int lastBut8;
int lastBut9;


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

  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
  pinMode(led4, OUTPUT);
  pinMode(led5, OUTPUT);
  pinMode(led6, OUTPUT);
  pinMode(led7, OUTPUT);
  pinMode(led8, OUTPUT);
  pinMode(led9, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  int reading1 = digitalRead(but1);
  int reading2 = digitalRead(but2);
  int reading3 = digitalRead(but3);
  int reading4 = digitalRead(but4);
  int reading5 = digitalRead(but5);    //reading the present button state
  int reading6 = digitalRead(but6);
  int reading7 = digitalRead(but7);
  int reading8 = digitalRead(but8);
  int reading9 = digitalRead(but9);


//check the last button state and the present state to know if the button is pressed or not
//this will prevent Arduino from misreading the state if the button is "bouncing"

//button pressed => LED on + Arduino writes value to the port
//button released => LED off + Arduino writes value to the port

  if (lastBut1 == LOW && reading1 == HIGH) { //a  
    digitalWrite(led1, HIGH);
    Serial.write('a');
  }
  
  if (lastBut1 == HIGH && reading1 == LOW) {
    digitalWrite(led1, LOW);
    Serial.write('A');
  }

  if (lastBut2 == LOW && reading2 == HIGH) { //b
    digitalWrite(led2, HIGH);
    Serial.write('b');
  }
  if (lastBut2 == HIGH && reading2 == LOW) {
    digitalWrite(led2, LOW);
    Serial.write('B');
  }

  if (lastBut3 == LOW && reading3 == HIGH) { //c
    digitalWrite(led3, HIGH);
    Serial.write('c');
  }
  if (lastBut3 == HIGH && reading3 == LOW) {
    digitalWrite(led3, LOW);
    Serial.write('C');
  }

  if (lastBut4 == LOW && reading4 == HIGH) { //d
    digitalWrite(led4, HIGH);
    Serial.write('d');
  }
  if (lastBut4 == HIGH && reading4 == LOW) {
    digitalWrite(led4, LOW);
    Serial.write('D');
  }

  if (lastBut5 == LOW && reading5 == HIGH) { //e
    digitalWrite(led5, HIGH);
    Serial.write('e');
  }
  if (lastBut5 == HIGH && reading5 == LOW) {
    digitalWrite(led5, LOW);
    Serial.write('E');
  }

  if (lastBut6 == LOW && reading6 == HIGH) { //f
    digitalWrite(led6, HIGH);
    Serial.write('f');
  }
  if (lastBut6 == HIGH && reading6 == LOW) {
    digitalWrite(led6, LOW);
    Serial.write('F');
  }

  if (lastBut7 == LOW && reading7 == HIGH) { //g
    digitalWrite(led7, HIGH);
    Serial.write('g');
  }
  if (lastBut7 == HIGH && reading7 == LOW) {
    digitalWrite(led7, LOW);
    Serial.write('G');
  }

  if (lastBut8 == LOW && reading8 == HIGH) { //h
    digitalWrite(led8, HIGH);
    Serial.write('h');
  }
  if (lastBut8 == HIGH && reading8 == LOW) {
    digitalWrite(led8, LOW);
    Serial.write('H');
  }

  if (lastBut9 == LOW && reading9 == HIGH) { //i
    digitalWrite(led9, HIGH);
    Serial.write('i');
  }
  if (lastBut9 == HIGH && reading9 == LOW) {
    digitalWrite(led9, LOW);
  }

  lastBut1 = reading1;
  lastBut2 = reading2;
  lastBut3 = reading3;
  lastBut4 = reading4; //update the last button state to the present state
  lastBut5 = reading5;
  lastBut6 = reading6;
  lastBut7 = reading7;
  lastBut8 = reading8;
  lastBut9 = reading9;

}
