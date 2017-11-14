class Boss4 {
  PImage boss;
  int x, y;         
  float xSpeed, ySpeed;
  float step;         
  float interval;     //影格切換時間間隔(milliSecond)
  int w = 300;
  int h = 300;
  boolean exist;

  Boss4(float speed) {    
    boss = loadImage("img/boss2.png");   
    x = int(random(width-w-50));
    y = int(random(height-h));
    xSpeed = speed;
    ySpeed = speed;
    exist=true;
  }

  void display() {
    image(boss, x, y, w, h);
  }  

  void move() {
    if (exist==false) {
      x=-1000;
      xSpeed=0;
      ySpeed=0;
    }
    x+=xSpeed;
    y+=ySpeed;

    if (x<0 || x>width-w) {
      xSpeed *= -1;
    }
    if (y<0|| y>height-h) {
      ySpeed *= -1;
    }
  }
}