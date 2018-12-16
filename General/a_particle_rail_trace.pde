class Particle {
  float x;
  float y;
  ArrayList<PVector> history;
  float lifespan;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.history = new ArrayList<PVector>();
    lifespan = 10;
  }

  void update() {
    this.x += random(-30, 30);
    this.y += random(-30, 30);
    for (PVector v : this.history) {
      v.x += random(-2, 2);
      v.y += random(-2, 2);
    }

    PVector v = new PVector(this.x, this.y);
    this.history.add(v); 
    if (this.history.size() > 500) {
      this.history.remove(0);
    }
    lifespan -=1;
  }

  void show() {
    //Stroke(c);
    //float a = random(height);
    //float b = random(width);
    //color c = img.get(int(a), int(b));

    float r = red(video.get(int(x), int(y)));
    float g = green(video.get(int(x), int(y)));
    float b = blue(video.get(int(x), int(y)));
    // Make a new color with an alpha component
    color c = color(r, g, b, 75);

    stroke(c, 150);
    fill(c, 50);
    line(this.x, this.y, this.x, this.y);

    noFill();
    beginShape();
    for (PVector pos : history) {
      //fill(c);
      //ellipse(pos.x, pos.y, i, i);
      vertex(pos.x, pos.y);
    }
    endShape();
  }
  boolean isDead() {
    if (lifespan <0.0) {
      return true;
    } else { 
      return false;
    }
  }
}

ArrayList<Particle> particles = new ArrayList<Particle>();
