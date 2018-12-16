int startDiam = 3;
int diam = startDiam;
int arcStep = 1;
int speedGrow = 1;
int maxAngle = 360;
int cx = mouseX;
int cy = mouseY;
color [] arcClr = new color[maxAngle]; 

//void arcCircle() {
void arcCircle() {
  int diamRaduis = diam+=speedGrow;
  int cirlX = mouseX;
  int cirlY = mouseY;

  int angle = 0;
  int speed = arcStep;
  int arcRadius = diamRaduis/2;
  int x, y;

  noStroke();
  fill(255);

  while (angle< maxAngle) {
    x = int(cirlX + cos(radians(angle)) * arcRadius);
    y = int(cirlY + sin(radians(angle)) * arcRadius);

    if ( cx != cirlX || cy != cirlY) {
      x = min(max(x, 1), video.width-1);    
      y = min(max(y, 1), video.height-1);
      color clr = video.get(x, y);
      arcClr[angle] = clr;
    } else if (!(   x < 1 || y < 1 || y < 1 || x < 1 
      || x > video.width-1  || x > video.width-1 
      || y > video.height-1 || y > video.height-1 ))
    {
      x = min(max(x, 1), video.width-1);    
      y = min(max(y, 1), video.height-1); 
      color clr = video.get(x, y);
      arcClr[angle] = clr;
    }

    fill(arcClr[angle]);
    float radSrt = radians(angle);
    float radEnd = radians(angle+arcStep);
    arc(cirlX, cirlY, diamRaduis, diamRaduis, radSrt, radEnd);
    arc(cirlX, cirlY, diamRaduis, diamRaduis, radSrt, radEnd);
    angle += speed;
  }
}
