
void paintStroke(float strokeLength, color strokeColor, int strokeThickness) {
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
  curve(tangent1, -stepLength*2, 0, -stepLength, 0, stepLength, tangent2, stepLength*2);

  int z = 1;

  // Draw stroke's details
  for (int num = strokeThickness; num > 0; num --) {
    float offset = random(-50, 25);
    color newColor = color(red(strokeColor)+offset, green(strokeColor)+offset, blue(strokeColor)+offset, random(100, 255));

    stroke(newColor);
    strokeWeight((int)random(0, 3));
    curve(tangent1, -stepLength*2, z-strokeThickness/2, -stepLength*random(0.9, 1.1), z-strokeThickness/2, stepLength*random(0.9, 1.1), tangent2, stepLength*2);

    z += 1;
  }
}

void display() {
  translate(width/2, height/2);

  int index=0;
  for (int y = 0; y < video.height; y+=1) {
    for (int x = 0; x < video.width; x+=1) {
      int odds = (int)random(20000);

      if (odds < 1) {
        color pixelColor = video.pixels[index];
        pixelColor = color(red(pixelColor), green(pixelColor), blue(pixelColor), 100);

        pushMatrix();
        translate(x-video.width/2, y-video.height/2);
        rotate(radians(random(-90, 90)));

        // Paint by layers from rough strokes to finer details
        if (mouseClick < 50) {
          // Big rough strokes
          paintStroke(random(150, 250), pixelColor, (int)random(20, 40));
        } else if (mouseClick < 100) {
          // Thick strokes
          paintStroke(random(75, 125), pixelColor, (int)random(8, 12));
        } else if (mouseClick < 200) {
          // Small strokes
          paintStroke(random(30, 60), pixelColor, (int)random(1, 4));
        } else if (mouseClick < 300) {
          // Big dots
          paintStroke(random(5, 20), pixelColor, (int)random(5, 15));
        } else {
          // Small dots
          paintStroke(random(1, 10), pixelColor, (int)random(1, 7));
        }

        popMatrix();
      }

      index += 1;
    }
  }
}
