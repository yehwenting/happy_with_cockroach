class Slipper {
  int x, y, w, h;
  PImage slipper, slipper2, sponge;
  boolean attack, cleanup;


  Slipper() {
    slipper=loadImage("img/slipper.png");//80*152
    slipper2=loadImage("img/slipper2.png");//64*121
    sponge=loadImage("img/sponge.png");
    attack=false;
    cleanup=false;
    w=64;
    h=121;
  }

  void move() {
    x=mouseX-64/2;
    y=mouseY-121/2;
  }

  void display() {

    if (cleanup==false) {
      if (attack==false) {
        image(slipper, x, y, 64, 121);
      } else if (attack==true) {
        image(slipper2, x, y, 64, 121);
      }
    }

    if (cleanup==true) {
      image(sponge, mouseX-50, mouseY-50, 100, 100);
    }
  }
}