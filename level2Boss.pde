class level2Boss {
  PImage img;
  int x, y, w, h;
  int small=0;
  level2Boss() {
    x=floor(random(950-w));
    y=floor(random(650-h));
    img=loadImage("img/boss2.png");
    w=img.width;
    h=img.height;
  }
  level2Boss(int a) {
    x=floor(random(950-w));
    y=floor(random(650-h));
    img=loadImage("img/boss2.png");
    w=img.width;
    h=img.height;
    small+=a;
  }
  void display() {
    tint(255, 255-small);
    image(img, x, y, 150-small, 150-small);  
    tint(255, 255);
  }

  void pressed(int a) {
    x=floor(random(950));
    y=floor(random(650));
    small+=a;
  }
}