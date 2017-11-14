class BOSS3 {
  int x, y;
  float xspeed, yspeed;
  int bosssize;
  PImage boss3;
  boolean hitC;

  BOSS3(float xspeed, float yspeed) {
    x=350;
    y=200;
    hitC=false;
    this.xspeed=xspeed;
    this.yspeed=yspeed;
    bosssize=150;
    boss3=loadImage("img/boss3.png");
  }

  void move() {
    y+=yspeed;
    x+=xspeed;
  }

  void display() {
    if (x + bosssize > mouseX - 80 && x < mouseX + 80 && y + bosssize > mouseY - 80 && y < mouseY + 80) {
      image(boss3, x, y, bosssize, bosssize);
    }
    if (bosssize<50) {
      bosssize=50;
    }
    if (x<0 || x>width-bosssize) {
      xspeed *= -1;
    }
    if (y<0 || y>height-bosssize) {
      yspeed *= -1;
    }
  }
}