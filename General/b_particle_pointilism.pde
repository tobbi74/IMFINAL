class Particle1 {
  float x;
  float y;

  Particle1(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void update() {
    this.x += random(-30, 30);
    this.y += random(-30, 30);
  }
  void show() {
    noStroke();
    
    float r = red(video.get(int(x), int(y)));
    float g = green(video.get(int(x), int(y)));
    float b = blue(video.get(int(x), int(y)));
    // Make a new color with an alpha component
    color c = color(r, g, b, 75);
    
    fill(c);
    ellipse(this.x, this.y, 10, 10);
  }
}

ArrayList<Particle1> particle1 = new ArrayList<Particle1>();
//Particle1 particle1;
