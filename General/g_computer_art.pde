void computerArt() {
  noStroke();
  for (int yy = 0; yy<height; yy+=3) {
    fill(video.get(mouseX, yy));  
    color pixelColor = video.get(mouseX, yy);
    pixelColor = color(red(pixelColor), green(pixelColor), blue(pixelColor), 100);

    int randShape = (int)random(3.5);
    if (randShape == 1)  ellipse(mouseX, yy, random(1, 20), random(1, 20));

    if (randShape == 2) { 
      pushMatrix();     // correct way to rotate
      translate(mouseX, yy);
      int randRotate = (int)random(180);
      rotate(radians(randRotate));
      rect(0, 0, random(1, 15), random(1, 20)); 
      popMatrix();
    }
    if (randShape == 3) { 
      pushMatrix();
      translate(mouseX, yy);
      int randRotate = (int)random(180);
      rotate(radians(random(-90, 90)));
      paintStroke1(random(5, 10), pixelColor, (int)random(20, 40));
      popMatrix();
    }
  }
}


void paintStroke1(float strokeLength, color strokeColor, int strokeThickness) {
  float stepLength = strokeLength/4.0;

  // Determines if the stroke is curved. A straight line is 0.
  float tangent1 = 0;
  float tangent2 = 0;

  float odds = random(1.0);

  if (odds < 0.7) {
    tangent1 = random(-strokeLength, strokeLength);
    tangent2 = random(-strokeLength, strokeLength);
  } 

  // Draw a big stroke
  noFill();
  stroke(strokeColor);
  strokeWeight(strokeThickness);

  int z = 1;

  // Draw stroke's details
  for (int num = strokeThickness; num > 0; num --) {
    float offset = random(-20, 15);
    color newColor = color(red(strokeColor)+offset, green(strokeColor)+offset, blue(strokeColor)+offset, random(100, 255));

    stroke(newColor);
    strokeWeight((int)random(0, 3));
    curve(tangent1, -stepLength*2, z-strokeThickness/2, -stepLength*random(0.9, 1.1), z-strokeThickness/2, stepLength*random(0.9, 1.1), tangent2, stepLength*2);

    z += 1;
  }
}
