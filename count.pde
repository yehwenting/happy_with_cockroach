class Count {  
  private int startMills ; 
  //private int accumulation ; 
  private boolean active = false ; 
  float totalTime ; 
  PFont font=createFont("Arial", 80);
  PImage [] images = new PImage[5];

  Count (float seconds ) {
    setTime (seconds);
    for (int i=0; i<4; i++) {
      images[i] = loadImage("img/countDown_" + (i) + ".png");
    }
  }

  void start() {
    active=true;
    startMills = millis() ;
  }

  void display(int seconds) {
    if (active==true) {
      for (int i=0; i<4; i++) {
        if (ceil(remaining())==i+seconds-3) {
          image(images[i], 0, 0);
        }
      }
      if (ceil(remaining())==seconds) {
        gameReady.play();
      }
    }
  }

  float duration () { // seconds
    return  (active ? 0 + millis() - startMills : 0 ) /1000.0 ;
  }

  void addTime (float seconds) {
    totalTime += seconds * 1000 ;
  }
  void setTime (float seconds) {
    totalTime =  seconds * 1000 ; // milliseconds
  }
  float remaining() {
    return totalTime/1000.0 - duration();
  }
}