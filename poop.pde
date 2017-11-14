class Poop {
  int x, y, w, h;
  PImage poop, poopbgimg;
  int ptime;
  int s;
  boolean poopbg;
  int cleaning;

  Poop() {
    poop=loadImage("img/poop.png");
    poopbgimg=loadImage("img/poopbg.png");
    x=floor(random(width-poop.width));
    y=floor(random(height-poop.height));
    w=poop.width;
    h=poop.height;
    poopbg=false;
    ptime=0;
    s=2;
    cleaning=0;
  }

  void move() {
  }

  void display() {
    ptime++;
    if (ptime % 60 ==0 && ptime!=0) {
      s = 2 - ptime/int(frameRate);
    }
    if (s>0) {
      image(poop, x, y);
    }
    if (s<=0&&poopbg!=true) {
      x=floor(random(width-poop.width));
      y=floor(random(height-poop.height));
      s=3;
    }
    if (poopbg==true&&cleaning!=125) {

      tint(255, 255-cleaning);
      image(poopbgimg, 0, 0);
      cleaning+=(abs(mouseX-pmouseX))/100;
      tint(255, 255);
    }
    if (cleaning>=125) {
      tint(255, 255);
      cleaning=0;
      poopbg=false;
    }
  }

  void clean() {
  }
}