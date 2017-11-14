class Juice {
  int jTime=0;
  int second=3;
  PImage[] juice=new PImage[51];
  int x, y;
  int juiceNum=0;
  boolean Jappear=false;
  Juice() {
    for (int i=1; i<11; i++) {
      juice[i] = loadImage ("img/juice.png") ;
    }
  }

  void display() {
    if (Jappear==true) {
      jTime++;
      if (jTime % 60 ==0 && jTime!=0) {
        second = 3 - jTime/int(frameRate);
      }
      if (second>0 && juice[juiceNum] != null) {

        image(juice[juiceNum], x, y, 100, 100);
      }
      if (second<=1) {
        Jappear=false;
        second=3;
      }
    }


    //jTime++;
    //if(jTime% 60 ==0 && jTime!=0){
    //  second = 3 - jTime/int(frameRate);  
    //}
    ////if(second <=0){
    ////  second =0;
    ////}

    //if(second==3){
    //tint(255,255);
    //image(juice[juiceNum], x, y,100,100);
    //}else if(second==2){
    //  tint(255,255-255/3);
    //  image(juice[juiceNum], x, y,100,100);
    //  tint(255,255);     
    //}else if(second==1){
    //  tint(255,255-255*2/3);
    //  image(juice[juiceNum], x, y,100,100);
    //  tint(255,255);     
    //}else if(second==0){
    //  image(juice[juiceNum],x, y,-100,-100);
    //  second=3;
    //}
    //println(second);
  }

  void add(int juiceX, int juiceY) {
    x=juiceX;
    y=juiceY;
    juiceNum++;
    //println(x,y);
  }
}