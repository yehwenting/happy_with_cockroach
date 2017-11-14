class Freeze {
  int x, y, w, h;
  PImage freeze;
  int ftime, coldtime;
  int s, t;
  boolean cold, used, resetmotion;


  Freeze() {
    freeze=loadImage("img/freeze.png");
    x=floor(random(width-45));
    y=floor(random(height-50));
    w=45;
    h=50;
    ftime=0;
    coldtime=0;
    s=30;
    t=3;
    cold=false;
    used=false;
    resetmotion=false;
  }


  void display() {
    
    if (cold==true) {
      coldtime++;
      if (coldtime % 60 ==0 ) {
        t = 3 - coldtime/int(frameRate);
      }
      if (t<=2) {
        used=true;
        cold=false;
        resetmotion=true;
        coldtime=0;
        t=3;
         }
    }
  }
}