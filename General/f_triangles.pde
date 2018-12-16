void triangles() {
  for (int i = 0; i < 30; i++) {
    float x = random(width);
    float y = random(height);

    float r = red(video.get(int(x), int(y)));
    float g = green(video.get(int(x), int(y)));
    float b = blue(video.get(int(x), int(y)));
    // Make a new color with an alpha component
    color c = color(r, g, b, 75);
    
    
    //color c = img.get(int(x), int(y));
    fill(c);
    noStroke();
    triangle(x, y, x-8, y+12, x+8, y+12);
  }
}
