class Hpbar {
  PImage hpbar;
  int x, y, hp;


  Hpbar() {
    x=5;
    y=5;
    hp=100;//attack*20=hp-0
    hpbar=loadImage("img/hp.png");
  }

  void move() {
    fill(#f00003); 
    noStroke();
    rect(10, 10, 2*hp, 20);
  }

  void display() {
    image(hpbar, x, y);
    if (hp<=0) {
      hp=0;
    }
  }
}