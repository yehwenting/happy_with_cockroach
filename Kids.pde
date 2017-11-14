class Kids {
  int x, y, w, h, xSpeed, ySpeed;
  PImage Ckid;

  Kids(int speed) {
    Ckid = loadImage ("img/cockroach.png") ;
    w=70;
    h=70;
    xSpeed=speed;
    ySpeed=-speed;
  }
  void display() {
    image(Ckid, x, y, w, h);
  }

  void move() {
    x+=xSpeed;
    y+=ySpeed;

    if (abs(xSpeed)< 1) {
      xSpeed=int(random(2, 10));
    }
    if (abs(ySpeed)< 1) {
      ySpeed=int(random(-2, -10));
    }

    if (x<0 || x>width-70) {
      xSpeed *= -1;
    }
    if (y<0 || y>height-70) {
      ySpeed *= -1;
    }
  }
}