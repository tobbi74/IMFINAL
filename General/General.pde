import processing.video.*;
import processing.serial.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;  //importing library's
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;

Serial myPort; 
int val;                                 // Data received from the serial port

Capture video;

void captureEvent(Capture video) {
  video.read();
}

int randCase;
int mouseClick;//c


AudioPlayer player_1;
AudioPlayer player_2;
AudioPlayer player_3;
AudioPlayer player_4;  // declare objects
AudioPlayer player_5;
AudioPlayer player_6;
AudioPlayer player_7;
AudioPlayer player_8;

void setup() {
  size(1920, 1080);
  //size(1440, 900);
  background(0);
  noStroke();
  frameRate(30);

  println(Serial.list());
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);

  colorMode(RGB, 255, 255, 255, 100);
  video = new Capture(this, "name=HD Pro Webcam C920,size=1920x1080,fps=30");
  //video = new Capture(this, "name=HD Pro Webcam C920,size=1440x900,fps=30");
  video.start();

  minim = new Minim(this);

  player_1 = minim.loadFile("c60.mp3");
  player_2 = minim.loadFile("d62.mp3");
  player_3 = minim.loadFile("e64.mp3");
  player_4 = minim.loadFile("f65.mp3");
  player_5 = minim.loadFile("g67.mp3");
  player_6 = minim.loadFile("a69.mp3");
  player_7 = minim.loadFile("b71.mp3");
  player_8 = minim.loadFile("c72.mp3");

  //String[] cameras = Capture.list();
  //if (cameras.length == 0) {
  //  println("There are no cameras available for capture.");
  //  exit();
  //} else {
  //  println("Available cameras:");
  //  for (int i = 0; i < cameras.length; i++) {
  //    println(cameras[i]);
  //  }

  // The camera can be initialized directly using an 
  // element from the array returned by list():
  //video = new Capture(this, 1440, 900, cameras[0]);
  //video.start();
}



void keyPressed() {
  background(0);
  for (int i=particles.size(); i-- != 0; particles.remove(i)); //a
  for (int i= particle1.size(); i-- != 0; particle1.remove(i)); //b
  for (int i= brushes.size(); i-- != 0; brushes.remove(i)); //d

  randCase = (int) random(0, 7);
  mouseClick=0; //c
  noStroke();

  diam = startDiam;
}


void draw() {
  if (myPort.available() > 0) {
    serial();
    val = myPort.read();
    println(val);

    if (val == 'a') {
      player_1.cue(0);                    
      player_1.play();
      mousePressed = true;
    }  
    if (val=='A') {
      mousePressed = false;
    }  
    if (val == 'b') {
      player_2.cue(0);                    
      player_2.play();
      mousePressed = true;
    }  
    if (val=='B') {
      mousePressed = false;
    }  
    if (val == 'c') {
      player_3.cue(0);                    
      player_3.play();
      mousePressed = true;
    }  
    if (val=='C') {
      mousePressed = false;
    }  
    if (val == 'd') {
      player_4.cue(0);                    
      player_4.play();
      mousePressed = true;
    }  
    if (val=='D') {
      mousePressed = false;
    }  
    if (val == 'e') {
      player_5.cue(0);                    
      player_5.play();
      mousePressed = true;
    }  
    if (val=='E') {
      mousePressed = false;
    }  
    if (val == 'f') {
      player_6.cue(0);                    
      player_6.play();
      mousePressed = true;
    }  
    if (val=='F') {
      mousePressed = false;
    }  
    if (val == 'g') {
      player_7.cue(0);                    
      player_7.play();
      mousePressed = true;
    }  
    if (val=='G') {
      mousePressed = false;
    }  
    if (val == 'h') {
      player_8.cue(0);                    
      player_8.play();
      mousePressed = true;
    }  
    if (val=='H') {
      mousePressed = false;
    }  
    if (val == 'i') {
      keyPressed();
    }
  }
  paint();
}


void serial() {
  mouseX = (int) random(width);
  mouseY = (int) random(height);

  // a. abstract rail trace
  particles.add(new Particle(mouseX, mouseY));

  //b. pointilism
  particle1.add(new Particle1(mouseX, mouseY));
}

void paint() {
  if (randCase == 0) {
    println("case 0");
    if (mousePressed == true) {
      for (Particle p : particles) {
        p.update();
        p.show();
      }
    }
  } else if (randCase == 1) { 
    println("case 1");
    if (mousePressed==true) { 
      for (Particle1 p : particle1) {
        p.update();
        p.show();
      }
    }
  } else if (randCase == 2) {
    println("case 2");
    if (mousePressed == true) {
      mouseClick+=1;
      display();
    }
  } else if (randCase == 3) { 
    println("case 3");
    if (mousePressed==true) {
      for (int i = 0; i < 50; i++) {
        brushes.add(new Brush());
      }
      for (Brush brush : brushes) {
        brush.paint();
      }
    }
  } else if (randCase == 4) { 
    println("case 4");
    if (mousePressed == true) {
      arcCircle();
    }
  } else if (randCase == 5) {
    println("case 5");
    if (mousePressed == true) {
      triangles();
    }
  } else if (randCase == 6) {//need fix
    println("case 6");
    if (mousePressed == true) {
      computerArt();
    }
  }
}

void stop() {
  // always close Minim audio classes when you are done with them
  player_1.close();
  player_2.close();
  player_3.close();
  player_4.close();
  player_5.close();
  player_6.close();
  player_7.close();
  player_8.close();

  minim.stop();

  super.stop();
}
