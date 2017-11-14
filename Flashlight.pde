class Flashlight {
  int x, y, w, h;
  PImage flashlight, flashlight2;
  PImage bg3;
  boolean attack;

  Flashlight() {
    flashlight=loadImage("img/flashlight_1.png");//80*152
    flashlight2=loadImage("img/flashlight_2.png");//64*121
    attack=false;
    w=flashlight.width;
    h=flashlight.height;
  }

  void move() {
    x=mouseX-flashlight.width/2;
    y=mouseY-flashlight.height/2;
  }

  void display() {
    if (attack==false) {
      image(flashlight, x, y);
    } else if (attack==true) {
      image(flashlight2, x, y);
    }
  }

  void flashlightEffect() {
    bg3=loadImage("img/bg3.png");
    loadPixels();
    for (int x = 0; x < bg3.width; x++ ) {
      for (int y = 0; y < bg3.height; y++ ) {
        int loc = x + y*bg3.width;
        float r = red (bg3.pixels[loc]);
        float g = green (bg3.pixels[loc]);
        float b = blue (bg3.pixels[loc]);
        float distance = dist(x, y, mouseX, mouseY);
        float adjustBrightness = map(distance, 0, 200, 1, 0);
        r *= adjustBrightness;
        g *= adjustBrightness;
        b *= adjustBrightness;

        r = constrain(r, 0, 255);
        g = constrain(g, 0, 255);
        b = constrain(b, 0, 255);

        color c = color(r, g, b);
        pixels[loc] = c;
      }
    }  
    updatePixels();
  }
}