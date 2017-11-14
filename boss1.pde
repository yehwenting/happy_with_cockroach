class BOSS1 {
  int x, y;
  float xspeed, yspeed;
  int bosssize;
  PImage boss1;
  boolean hitC;

  BOSS1(float xspeed, float yspeed) {
    x=425;
    y=275;
    hitC=false;
    this.xspeed=xspeed;
    this.yspeed=yspeed;
    bosssize=150;
    boss1=loadImage("img/boss2.png");
  }

  void move() {
    y+=yspeed;
    x+=xspeed;
    if (x<0 || x>width-bosssize) {
      xspeed *= -1;
    }
    if (y<0 || y>height-bosssize) {
      yspeed *= -1;
    }
  }

  void display() {
    image(boss1, x, y, bosssize, bosssize);
    if (bosssize<50) {
      bosssize=50;
    }
  }
}