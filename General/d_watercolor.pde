class Brush {
  float angle;
  int components[];
  float x, y;
  color clr;

  Brush() {
    angle = random(TWO_PI);
    x = random(width);
    y = random(height);

    components = new int[2];
    for (int i = 0; i < 2; i++) {
      components[i] = int(random(1, 5));
    }
  }

  void paint() {
    float a = 0;
    float r = 0;
    float x1 = x;
    float y1 = y;
    float u = random(0.5, 1);

    //new add-in for video
    float r1 = red(video.get(int(x), int(y)));
    float g = green(video.get(int(x), int(y)));
    float b = blue(video.get(int(x), int(y)));
    // Make a new color with an alpha component
    color c = color(r1, g, b, 75);

    //color c = video.get(int(x), int(y));
    fill(c, 50);
    noStroke();    

    beginShape();
    while (a < TWO_PI) {
      vertex(x1, y1); 
      float v = random(0.85, 1);
      x1 = x + r * cos(angle + a) * u * v;
      y1 = y + r * sin(angle + a) * u * v;
      a += PI / 180;
      for (int i = 0; i < 2; i++) {
        r += sin(a * components[i]);
      }
    }
    endShape(CLOSE);

    if (x < 0 || x > width ||y < 0 || y > height) {
      angle += HALF_PI;
    }

    x += 2 * cos(angle);
    y += 2 * sin(angle); 
    angle += random(-0.15, 0.15);
  }
}

ArrayList<Brush> brushes = new ArrayList<Brush>();
