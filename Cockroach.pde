class Cockroach {
  PImage cockroach;
  int cockroach_W = 70;
  int cockroach_H = 70;
  int x;
  int y;
  int w, h;
  float xSpeed;
  float ySpeed;
  int size;
  boolean hitB;

  Cockroach(int size, float xSpeed) {
    cockroach = loadImage ("img/cockroach.png") ;
    x = int(random(width-70));
    y = int(random(height-70));
    w = 70;
    h = 70;
    this.xSpeed = xSpeed;
    this.ySpeed = size;
    this.size = size;
    hitB=false;
  }

  void display() {
    image(cockroach, x, y, cockroach_W, cockroach_H) ;
  }

  void move() {
    x+=xSpeed;
    y+=ySpeed;

    if (x< 0|| x>width-70) {
      xSpeed *= -1;
    }
    if (y<0 || y>height-70) {
      ySpeed *= -1;
    }
  }
}