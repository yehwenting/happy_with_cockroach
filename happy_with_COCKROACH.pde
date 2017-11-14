PImage  bg1, bg2, bg3, bg4, bg5, about1, about2, lose1, lose2, endStory1,endStory2;
PImage [] start = new PImage[5];
PImage [] choose = new PImage[7];
PImage [] rules = new PImage[7];
PImage [] startGame = new PImage[7];
PImage [] boss_hint = new PImage[6];
PImage [] boss_go = new PImage[6];

PImage [] win1 = new PImage[6];
PImage [] next1 = new PImage[6];
PImage [] win2 = new PImage[6];
PImage [] next2 = new PImage[6];
PImage [] win3 = new PImage[6];
PImage [] next3 = new PImage[6];
PImage [] win4 = new PImage[6];
PImage [] next4 = new PImage[6];
PImage [] win5 = new PImage[6];
PImage [] next5 = new PImage[6];


PImage [] story = new PImage[7];
PImage end1, end2, end3;



final int gameStart=0;
final int gameChoose=1;
final int gameInfo1=2;
final int gameInfo2=3;
final int gameInfo3=4;
final int gameInfo4=5;
final int gameInfo5=6;
final int gameInfo6=7;
final int level1=8;
final int level1Boss=9;
final int level2=10;
final int level2Boss=11;
final int level3=12;
final int level3Boss=13;
final int level4=14;
final int level4Boss=15;
final int level5=16;
final int level5Boss=17;
final int gameLose=18;
final int gameAbout=19;
final int gameStory0=20;
final int gameStory1=21;
final int gameStory2=22;
final int gameStory3=23;
final int gameStory4=24;
final int gameStory5=25;

final int gameStory6=26;
final int gameStory7=27;

final int gameEnd=28;

int gameState=gameStart;

import ddf.minim.*;

Cockroach [] cockroaches;
Slipper sp;
Hpbar hp;

BOSS1 boss1;
level2Boss[] boss2;
BOSS3 boss3;
Boss4 boss4;
BOSS5 boss5;
Poop poop;

Flashlight fl;
Kids [] cockroachKids;
Juice juice;
Freeze freeze;
Count timer1;
Count timer2;
Count timer3;
Count timer4;
Count timer5;
Count timer6;
Count timer7;
Count timer8;
Count timer9;
Count timer10;

Minim minim;
AudioSample click;
AudioPlayer BG1;
AudioPlayer gameReady;
AudioSample pinch;
AudioPlayer BG2;
AudioPlayer warning;
AudioPlayer boss;
AudioPlayer reward;
AudioSample poo;
AudioPlayer gameover;

int pressedTime=0;
int deadCockroach = 0;
boolean Hit;

boolean timer1Lose, timer2Lose, timer3Lose, timer4Lose, timer5Lose, timer6Lose, timer7Lose, timer8Lose, timer9Lose, timer10Lose;
boolean choose1 = false;
boolean choose2 = false;
boolean choose3 = false;
boolean choose4 = false;
boolean choose5 = false;
boolean choose6 = false;

void setup() {
  size(1000, 700);
  
  //music
  minim = new Minim(this);
  click = minim.loadSample("click.wav");
  BG1 = minim.loadFile("BG1.mp3");
  gameReady = minim.loadFile("gameReady.mp3");
  pinch = minim.loadSample("pinch.mp3");
  BG2 = minim.loadFile("BG2.mp3");
  warning = minim.loadFile("warning.wav");
  boss = minim.loadFile("10sec boss.mp3");
  reward = minim.loadFile("reward.wav");
  poo = minim.loadSample("poo.mp3");
  gameover = minim.loadFile("gameover.mp3");
  
  BG1.play();
  BG1.loop();
  
  //boss1
  boss1=new BOSS1(random(-10, 10), random(-10, 10));
  boss1=new BOSS1(10, 10);
  bg1=loadImage("img/bg1.png");
  timer1Lose = true;
  timer2Lose = true;

  //boss2
  boss2 = new level2Boss[10];
  boss2[0]=new level2Boss();
  bg2=loadImage("img/bg2.png");
  timer3Lose = true;
  timer4Lose = true;

  //boss3
  boss3=new BOSS3(20, 20);
  fl=new Flashlight();
  hp=new Hpbar();
  bg3=loadImage("img/bg3.png");
  timer5Lose = true;
  timer6Lose = true;

  //boss4
  bg4=loadImage("img/bg4.jpg");
  cockroachKids = new Kids[15];
  boss4 = new Boss4(5);
  for (int i=0; i<cockroachKids.length; i++) {
    cockroachKids[i] = new Kids(int(random(-10, 10)));
  }
  timer7Lose = true;
  timer8Lose = true;

  //boss5
  bg5=loadImage("img/bg5.jpg");
  boss5=new BOSS5(10, 10);
  poop=new Poop();
  timer9Lose = true;
  timer10Lose = true;

  //juice
  juice = new Juice();

  freeze=new Freeze();




  timer1 = new Count(19);         
  timer2 = new Count(10);          
  timer3 = new Count(19);           
  timer4 = new Count(15);            
  timer5 = new Count(19);            
  timer6 = new Count(20);            
  timer7 = new Count(19);           
  timer8 = new Count(10);          
  timer9 = new Count(19);              
  timer10 = new Count(30);      


  hp=new Hpbar();



  for (int i = 0; i < 4; i++) {
    start[i+1] = loadImage("img/start"+ (i + 1) + ".png");
  }
  for (int i = 0; i < 7; i++) {
    choose[i] = loadImage("img/character0"+ (i ) + ".png");
  }
  for (int i = 0; i < 6; i++) {
    rules[i+1] = loadImage("img/rules_0"+ (i + 1 ) + ".png");
  }
  for (int i = 0; i < 6; i++) {
    startGame[i+1] = loadImage("img/start_0"+ (i +1) + ".png");
  }

  for (int i = 0; i < 5; i++) {
    boss_hint[i] = loadImage("img/hint_beforeBoss_0"+ (i +1) + ".png");
  }

  for (int i = 0; i < 5; i++) {
    boss_go[i] = loadImage("img/hint_beforeBoss_GO_0"+ (i +1) + ".png");
  }

  for (int i = 0; i < 6; i++) {
    win1[i] = loadImage("img/WIN_0"+ (i +1)+"-01" + ".png");
  }

  for (int i = 0; i < 6; i++) {
    next1[i] = loadImage("img/NEXT_0"+ (i +1)+"-01" + ".png");
  }
  
   for (int i = 0; i < 6; i++) {
    win2[i] = loadImage("img/WIN_0"+ (i +1)+"-02" + ".png");
  }

  for (int i = 0; i < 6; i++) {
    next2[i] = loadImage("img/NEXT_0"+ (i +1)+"-02" + ".png");
  }
   for (int i = 0; i < 6; i++) {
    win3[i] = loadImage("img/WIN_0"+ (i +1)+"-03" + ".png");
  }

  for (int i = 0; i < 6; i++) {
    next3[i] = loadImage("img/NEXT_0"+ (i +1)+"-03" + ".png");
  }
  
   for (int i = 0; i < 6; i++) {
    win4[i] = loadImage("img/WIN_0"+ (i +1)+"-04" + ".png");
  }

  for (int i = 0; i < 6; i++) {
    next4[i] = loadImage("img/NEXT_0"+ (i +1)+"-04" + ".png");
  }
  
   for (int i = 0; i < 6; i++) {
    win5[i] = loadImage("img/WIN_0"+ (i +1)+"-05" + ".png");
  }

  for (int i = 0; i < 6; i++) {
    next5[i] = loadImage("img/NEXT_0"+ (i +1)+"-05" + ".png");
  }

  
   for (int i = 0; i < 6; i++) {
    story[i] = loadImage("img/Story_0"+ (i) + ".png");
  }
  
  endStory1 = loadImage ("img/end_STORY_1.png") ;
  endStory2 = loadImage ("img/end_STORY_2.png") ;
  
  end1 = loadImage ("img/end.png") ;
  end2 = loadImage ("img/end_HOME.png") ;
  end3 = loadImage ("img/end_EXIT.png") ;

  lose1 = loadImage("img/LOSE.png");
  lose2 = loadImage("img/LOSE_HOME.png");

  about1 = loadImage ("img/about1.png") ;
  about2 = loadImage ("img/about2.png") ;
  cockroaches = new Cockroach[10];
  sp = new Slipper();
  for (int i=0; i<cockroaches.length; i++) {
    cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
  }
  gameState=gameStart;
}

void resetLevel1(){
          //timer3.start();
          //gameState=level2;
          cockroaches = new Cockroach[10];
          for (int i=0; i<cockroaches.length; i++) {
            cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
          }
          hp.hp = 100;
          boss1=new BOSS1(random(-10, 10), random(-10, 10));
          boss1=new BOSS1(10, 10);
         
          
}

void resetLevel2(){
          //timer5.start();
          //gameState=level3;
          pressedTime = 0;
          cockroaches = new Cockroach[10];
          for (int i=0; i<cockroaches.length; i++) {
            cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
          }
          hp.hp = 100;
          boss2 = new level2Boss[10];
          boss2[0]=new level2Boss();
          for(int i=0;i<10;i++){
            if(boss2[i]!=null){
              boss2[i].x=floor(random(950-boss2[i].w));
              boss2[i].y=floor(random(650-boss2[i].h));
            }
          }
         
}

void resetLevel3(){
          //timer7.start();
          //gameState=level4;
          cockroaches = new Cockroach[10];
          for (int i=0; i<cockroaches.length; i++) {
            cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
          }
          hp.hp = 100;
            boss3=new BOSS3(20, 20);
            fl=new Flashlight();
            hp=new Hpbar();
            
         
}

void resetLevel4(){
          //boss4.exist=true;
          //timer9.start();
          deadCockroach = 0;
          gameState=level5;
          cockroaches = new Cockroach[10];
          for (int i=0; i<cockroaches.length; i++) {
            cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
          }
          hp.hp = 100;
         
        cockroachKids = new Kids[15];
        boss4 = new Boss4(5);
        for (int i=0; i<cockroachKids.length; i++) {
          cockroachKids[i] = new Kids(int(random(-10, 10)));
        }
       
}

void resetLevel5(){
          //gameState=gameStory6;
          cockroaches = new Cockroach[10];
          for (int i=0; i<cockroaches.length; i++) {
            cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
          }
          hp.hp = 100;
          
          boss5=new BOSS5(10, 10);
          poop=new Poop();
        
}

void draw() {
  
  switch(gameState) {
  case gameStart:
    image(start[1], 0, 0, 1000, 700) ;

    //mouse action start
    if ( mouseX > 57 && mouseX < 308 && mouseY < 535 && mouseY > 442) {
      image(start[2], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        gameState = gameChoose;
      }
    }

    //mouse action about
    if ( mouseX > 378 && mouseX < 624 && mouseY < 536 && mouseY > 443) {
      image(start[3], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        gameState = gameAbout;
      }
    }

    //mouse action exit
    if ( mouseX > 659 && mouseX < 941 && mouseY < 539 && mouseY > 444) {
      image(start[4], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        exit();
      }
    }

    break;

  case gameAbout:
    image(about1, 0, 0, 1000, 715) ;
    //mouse action1
    if ( mouseX > 731 && mouseX < 883 && mouseY < 612 && mouseY > 555) {
      image(about2, 0, 0, 1000, 715) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        gameState = gameStart;
      }
    }

    break;

  case gameLose:
    gameover.play();
    if( BG1.isPlaying() ){
      BG1.rewind();
      BG1.pause();
    }
    if( BG2.isPlaying() ){
      BG2.rewind();
      BG2.pause();
    }
    if( boss.isPlaying() ){
      boss.rewind();
      boss.pause();
    }
    if( !gameReady.isPlaying() ){
      gameReady.rewind();
      gameReady.pause();
    }
    if( !reward.isPlaying() ){
      reward.rewind();
      reward.pause();
    }
    
    image(lose1, 0, 0, 1000, 700);
    //mouse action1
    if ( mouseX > 441 && mouseX < 595 && mouseY < 469 && mouseY > 411) {
      image(lose2, 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        if( gameover.isPlaying() ){
          gameover.rewind();
          gameover.pause();
        }
          BG1.play();
          choose1 = false;
          choose2 = false;
          choose3 = false;
          choose4 = false;
          choose5 = false;
          choose6 = false;
          timer1Lose = true;
          timer2Lose = true;
          timer3Lose = true;
          timer4Lose = true;
          timer5Lose = true;
          timer6Lose = true;
          timer7Lose = true;
          timer8Lose = true;
          timer9Lose = true;
          timer10Lose = true;
          cockroaches = new Cockroach[10];
          for (int i=0; i<cockroaches.length; i++) {
            cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
          }
        gameState = gameStart;
      }
    }

    break;

  case gameChoose:
    image(choose[0], 0, 0, 1000, 700) ;
    //mouse action1
    if ( mouseX > 201 && mouseX < 320 && mouseY < 414 && mouseY > 232) {
      image(choose[1], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        gameState = gameStory0;
        choose1 = true;
      }
    }
    //mouse action2
    if ( mouseX > 435 && mouseX < 556 && mouseY < 407 && mouseY > 244) {
      image(choose[2], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        gameState = gameStory0;
        choose2 = true;
      }
    }
    //mouse action3
    if ( mouseX > 666 && mouseX < 781 && mouseY < 402 && mouseY > 242) {
      image(choose[3], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        gameState = gameStory0;
        choose3 = true;
      }
    }
    //mouse action4
    if ( mouseX > 202 && mouseX < 324 && mouseY < 664 && mouseY > 483) {
      image(choose[4], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        gameState = gameStory0;
        choose4 = true;
      }
    }
    //mouse action5
    if ( mouseX > 423 && mouseX < 555 && mouseY < 660 && mouseY > 487) {
      image(choose[5], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        gameState = gameStory0;
        choose5 = true;
      }
    }
    //mouse action6
    if ( mouseX > 671 && mouseX < 729 && mouseY < 652 && mouseY > 482) {
      image(choose[6], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        gameState = gameStory0;
        choose6 = true;
      }
    }
    break;
    
    case gameStory0:
    image(story[0], 0, 0, 1000, 700) ;
    
    //mouse action1
    if ( mouseX > 781 && mouseX < 877 && mouseY < 675 && mouseY > 634) {
      if ( mousePressed ) {
        //click
        click.trigger();
       gameState = gameStory1;
      }
    }
    
    break;
    
     case gameStory1:
    image(story[1], 0, 0, 1000, 700) ;
    
    //mouse action1
    if ( mouseX > 781 && mouseX < 877 && mouseY < 675 && mouseY > 634) {
      if ( mousePressed ) {
        //click
        click.trigger();
       gameState = gameStory2;
      }
    }
    
    break;
    
     case gameStory2:
    image(story[2], 0, 0, 1000, 700) ;
    
    //mouse action1
    if ( mouseX > 781 && mouseX < 877 && mouseY < 675 && mouseY > 634) {
      if ( mousePressed ) {
        //click
        click.trigger();
       gameState = gameStory3;
      }
    }
    
    break;
    
     case gameStory3:
    image(story[3], 0, 0, 1000, 700) ;
    
    //mouse action1
    if ( mouseX > 781 && mouseX < 877 && mouseY < 675 && mouseY > 634) {
      if ( mousePressed ) {
        //click
        click.trigger();
       gameState = gameStory4;
      }
    }
    
    break;
    
     case gameStory4:
    image(story[4], 0, 0, 1000, 700) ;
    
    //mouse action1
    if ( mouseX > 781 && mouseX < 877 && mouseY < 675 && mouseY > 634) {
      if ( mousePressed ) {
        //click
        click.trigger();
       gameState = gameStory5;
      }
    }
    
    break;
     case gameStory5:
    image(story[5], 0, 0, 1000, 700) ;
    
    //mouse action1
    if ( mouseX > 781 && mouseX < 877 && mouseY < 675 && mouseY > 634) {
      if ( mousePressed ) {
        //click
        click.trigger();
        if(choose1){ gameState = gameInfo1;}
        if(choose2){ gameState = gameInfo2;}
        if(choose3){ gameState = gameInfo3;}
        if(choose4){ gameState = gameInfo4;}
        if(choose5){ gameState = gameInfo5;}
        if(choose6){ gameState = gameInfo6;}
      }
    }
    
    break;
    
    case gameStory6:
    BG1.rewind();
    BG1.loop();
    image(endStory1, 0, 0, 1000, 700) ;
    
    //mouse action1
    if ( mouseX > 781 && mouseX < 877 && mouseY < 675 && mouseY > 634) {
      if ( mousePressed ) {
        //click
        click.trigger();
       gameState = gameStory7;
      }
    }
    
    break;
    
    case gameStory7:
    image(endStory2, 0, 0, 1000, 700) ;
    
    //mouse action1
    if ( mouseX > 781 && mouseX < 877 && mouseY < 675 && mouseY > 634) {
      if ( mousePressed ) {
        //click
        click.trigger();
       gameState = gameEnd;
      }
    }
    
    break;
    
    case gameEnd:
    image(end1, 0, 0, 1000, 700) ;
    //mouse action home
    if ( mouseX > 600 && mouseX < 791 && mouseY < 490 && mouseY > 422) {
      image(end2, 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        if( BG1.isPlaying() ){
          BG1.rewind();
          BG1.pause();
        }
        if( !reward.isPlaying() ){
          reward.rewind();
          reward.pause();
        }
          BG1.play();
          choose1 = false;
          choose2 = false;
          choose3 = false;
          choose4 = false;
          choose5 = false;
          choose6 = false;
          timer1Lose = true;
          timer2Lose = true;
          timer3Lose = true;
          timer4Lose = true;
          timer5Lose = true;
          timer6Lose = true;
          timer7Lose = true;
          timer8Lose = true;
          timer9Lose = true;
          timer10Lose = true;
          cockroaches = new Cockroach[10];
          for (int i=0; i<cockroaches.length; i++) {
            cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
          }
        gameState = gameStart;
      }
    }

    //mouse action exit
    if ( mouseX > 596 && mouseX < 798 && mouseY < 614 && mouseY > 541) {
      image(end3, 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        exit();
      }
    }

    break;


  case gameInfo1:
    image(rules[1], 0, 0, 1000, 700) ;
    //mouse action1
    if ( mouseX > 685 && mouseX < 861 && mouseY < 646 && mouseY > 574) {
      image(startGame[1], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        timer1.start();
        gameState = level1;
      }
    }

    break;

  case gameInfo2:
    image(rules[2], 0, 0, 1000, 700) ;
    //mouse action2
    if ( mouseX > 685 && mouseX < 861 && mouseY < 646 && mouseY > 574) {
      image(startGame[2], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        timer1.start();
        gameState = level1;
      }
    }

    break;

  case gameInfo3:
    image(rules[3], 0, 0, 1000, 700) ;
    //mouse action3
    if ( mouseX > 685 && mouseX < 861 && mouseY < 646 && mouseY > 574) {
      image(startGame[3], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        timer1.start();
        gameState = level1;
      }
    }

    break;

  case gameInfo4:
    image(rules[4], 0, 0, 1000, 700) ;
    //mouse action4
    if ( mouseX > 685 && mouseX < 861 && mouseY < 646 && mouseY > 574) {
      image(startGame[4], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        timer1.start();
        gameState = level1;
      }
    }

    break;

  case gameInfo5:
    image(rules[5], 0, 0, 1000, 700) ;
    //mouse action5
    if ( mouseX > 685 && mouseX < 861 && mouseY < 646 && mouseY > 574) {
      image(startGame[5], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        timer1.start();
        gameState = level1;
      }
    }

    break;

  case gameInfo6:
    image(rules[6], 0, 0, 1000, 700) ;
    //mouse action6
    if ( mouseX > 685 && mouseX < 861 && mouseY < 646 && mouseY > 574) {
      image(startGame[6], 0, 0, 1000, 700) ;
      if ( mousePressed ) {
        //click
        click.trigger();
        timer1.start();
        gameState = level1;
      }
    }

    break;

  case level1:
      if( BG1.isPlaying() ){
        BG1.rewind();
        BG1.pause();
      }
      
      if(timer1.active==true){
        image(bg1, 0, 0, 1000, 700);
        timer1.display(19);
     
        if(ceil(timer1.remaining())<=15 ){
         image(bg1, 0, 0, 1000, 700);
        if(ceil(timer1.remaining())>=0){
         fill(0);
         textFont(timer1.font,80); 
         text(ceil(timer1.remaining() ),880,100);
        }
        if(ceil(timer1.remaining())<=11&&ceil(timer1.remaining())>=8&&freeze.cold==false&&freeze.used==false){
        image(freeze.freeze,freeze.x,freeze.y,45,50);
        }
        if(ceil(timer1.remaining())<8){
            
        }

      juice.display();
      for (int i=0; i<cockroaches.length; i++) {
        cockroaches[i].move();
        cockroaches[i].display();
      }
      BG2.play();
      for (int i=0; i<cockroaches.length; i++) {
        if (sp.attack==true&&isHit(sp.x, sp.y, sp.w, sp.h, cockroaches[i].x, cockroaches[i].y, cockroaches[i].w, cockroaches[i].h)==true) {  
          pinch.trigger();
          deadCockroach++;

          juice.add(cockroaches[i].x, cockroaches[i].y);
          juice.Jappear = true;

          //image(juice, cockroaches[i].x, cockroaches[i].y, 100, 100);
          cockroaches[i].x = -1000;
          cockroaches[i].y = -1000;
          sp.attack=false;

          return;
        }
      }
       freeze.display();
      if (freeze.resetmotion==true) {
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i].xSpeed=random(-3, 3);
          cockroaches[i].ySpeed=random(10);
        }
        freeze.resetmotion=false;
        return;
      }

      if (sp.attack==true&&freeze.cold==false&&isHit(sp.x, sp.y, sp.w, sp.h, freeze.x, freeze.y, freeze.w, freeze.h)==true) {
        freeze.cold=true;
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i].xSpeed=0;
          cockroaches[i].ySpeed=0;
        }
        return;
      }


     

      sp.move();
      sp.display();

      if (deadCockroach == cockroaches.length) { //win
        timer1Lose = false;
        image(boss_hint[0], 0, 0, 1000, 700) ;
        if( BG2.isPlaying() ){
          BG2.rewind();
          BG2.pause();
        }
        warning.play();
       // warning.loop();
        //mouse action1
        if ( mouseX > 671 && mouseX < 933 && mouseY < 611 && mouseY > 528) {
          image(boss_go[0], 0, 0, 1000, 700) ;
          if ( mousePressed ) {
            //click
            click.trigger();
            if( warning.isPlaying() ){
              warning.rewind();
              warning.pause();
            }
            if( !gameReady.isPlaying() ){
              gameReady.rewind();
              gameReady.pause();
            }
            deadCockroach = 0;
            timer2.start();
            gameState = level1Boss;
            juice.juiceNum=0;
          }
        }
      }

      if (timer1Lose) {
        if (timer1.remaining()<=0) {
          gameState=gameLose;
          deadCockroach = 0;
        }
      }
        }
      }

    break;

  case level1Boss:
    freeze.x=floor(random(width-45));
    freeze.y=floor(random(height-50));
    freeze.used=false;
    freeze.cold=false;
    boss.play();
    image(bg1, 0, 0, 1000, 700);
    boss1.move();
    boss1.display();

    hp.move();
    hp.display();

    if(ceil(timer2.remaining())>=0){
    fill(0);
    textFont(timer2.font,80); 
    text(ceil(timer2.remaining() ),880,100);
    }
    if (sp.attack==true&&isHit(sp.x, sp.y, sp.w, sp.h, boss1.x, boss1.y, boss1.bosssize, boss1.bosssize)==true) {
      pinch.trigger();
      boss1.bosssize-=10;
      sp.attack = false;
      hp.hp-=10;
      return;
    }

    sp.move();
    sp.display();

    if (hp.hp == 0) { //win
      boss1.x = -1000;
      boss1.y = -1000;
      timer2Lose = false;
      reward.play();
      if( boss.isPlaying() ){
        boss.pause();
      }
      if(choose1){
        image(win1[0], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next1[0], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          click.trigger();
          timer3.start();
          gameState=level2;
        resetLevel1();
        }
      }
    }
      if(choose2){
        image(win1[1], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next1[1], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer3.start();
          gameState=level2;
          resetLevel1();
        }
      }
    }
      if(choose3){
        image(win1[2], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next1[2], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer3.start();
          gameState=level2;
          resetLevel1();
        }
      }
    }
      if(choose4){
        image(win1[3], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next1[3], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer3.start();
          gameState=level2;
          resetLevel1();
        }
      }
    }
      if(choose5){
        image(win1[4], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next1[4], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer3.start();
          gameState=level2;
          resetLevel1();
        }
      }
    }
      if(choose6){
        image(win1[5], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next1[5], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer3.start();
          gameState=level2;
          resetLevel1();
        }
      }
    }
    
      
    }

    if (timer2Lose) {
      if (timer2.remaining()<=0) {
        resetLevel1();
        gameState=gameLose;
        cockroaches = new Cockroach[10];
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
        }
        hp.hp = 100;
      }
    }

    break;

  case level2:
   
    if(timer3.active==true){
        image(bg2, 0, 0, 1000, 700);
        timer3.display(19);
        
        if(ceil(timer3.remaining())<=15){
         image(bg2, 0, 0, 1000, 700);
        if(ceil(timer3.remaining())>=0){ 
         fill(0);
         textFont(timer3.font,80); 
         text(ceil(timer3.remaining() ),880,100);
        }
        
        if(ceil(timer3.remaining())<=8&&ceil(timer3.remaining())>=5&&freeze.cold==false&&freeze.used==false){
        
          image(freeze.freeze,freeze.x,freeze.y,45,50); //<>//
        }

      juice.display();
      for (int i=0; i<cockroaches.length; i++) {
        cockroaches[i].move();
        cockroaches[i].display();
      }
      BG2.play();
      for (int i=0; i<cockroaches.length; i++) {
        if (sp.attack==true&&isHit(sp.x, sp.y, sp.w, sp.h, cockroaches[i].x, cockroaches[i].y, cockroaches[i].w, cockroaches[i].h)==true) {  
          pinch.trigger();
          deadCockroach++;

          juice.add(cockroaches[i].x, cockroaches[i].y);
          juice.Jappear = true;
          //image(juice, cockroaches[i].x, cockroaches[i].y, 100, 100);
          cockroaches[i].x = -1000;
          cockroaches[i].y = -1000;

          return;
        }
      }
      freeze.display();
      if (sp.attack==true&&freeze.cold==false&&isHit(sp.x, sp.y, sp.w, sp.h, freeze.x, freeze.y, freeze.w, freeze.h)==true) {
        freeze.cold=true;
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i].xSpeed=0;
          cockroaches[i].ySpeed=0;
        }
        return;
      }

      if (freeze.resetmotion==true) {
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i].xSpeed=random(-3, 3);
          cockroaches[i].ySpeed=random(10);
        }
        freeze.resetmotion=false;
        return;
      }

  

      sp.move();
      sp.display();



      if (deadCockroach == cockroaches.length) { //win
        timer3Lose = false;
        image(boss_hint[1], 0, 0, 1000, 700) ;
        if(BG2.isPlaying() ){
          BG2.rewind();
          BG2.pause();
        }
        warning.play();
        //warning.loop();
        //mouse action2
        if ( mouseX > 671 && mouseX < 933 && mouseY < 611 && mouseY > 528) {
          image(boss_go[1], 0, 0, 1000, 700) ;
          if ( mousePressed ) {
            //click
            click.trigger();
            if( warning.isPlaying() ){
              warning.rewind();
              warning.pause();
            }
            if( !gameReady.isPlaying() ){
              gameReady.rewind();
              gameReady.pause();
            }
            if( !reward.isPlaying() ){
              reward.rewind();
              reward.pause();
            }
            if( !boss.isPlaying() ){
              boss.rewind();
              boss.pause();
            }
            deadCockroach = 0;
            timer4.start();
            gameState = level2Boss;
            juice.juiceNum=0;
          }
        }
      }
      if (timer3Lose) {
        if (timer3.remaining()<=0) {
          gameState=gameLose;
          deadCockroach = 0;
        }
      }
    }
    }
  
    break;

  case level2Boss:
    freeze.x=floor(random(width-45));
    freeze.y=floor(random(height-50));
    freeze.used=false;
    freeze.cold=false;
    boss.play();
    if( ceil(timer4.remaining())==5 ){
      boss.pause();
      if ( !boss.isPlaying()){
        boss.rewind();
      }
    }
    image(bg2, 0, 0, 1000, 700);
    for (int i=0; i<10; i++) {
      if (boss2[i]!=null) {
        boss2[i].display();
      }
    }
    if (Hit==true && pressedTime<9 && isHit(sp.x, sp.y, sp.w, sp.h, boss2[pressedTime].x, boss2[pressedTime].y, boss2[pressedTime].w, boss2[pressedTime].h)==true) {
      pinch.trigger();
      boss2[pressedTime]=null;
      pressedTime++;
      boss2[pressedTime]= new level2Boss(15*pressedTime);
    
    }

    if(ceil(timer4.remaining())>=0){
         fill(0);
         textFont(timer4.font,80); 
         text(ceil(timer4.remaining() ),880,100);
    }

    sp.display();
    sp.move();

    if (pressedTime == 9) { //win
      // level2Boss.x = -1000;
      // level2Boss.y = -1000;
      timer4Lose = false;
      reward.play();
      if(boss.isPlaying() ){
        boss.pause();
      }
      if(choose1){
        image(win2[0], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next2[0], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          click.trigger();
          timer5.start();
          gameState=level3;
          resetLevel2();
        }
      }
    }
      if(choose2){
        image(win2[1], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next2[1], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          click.trigger();
          timer5.start();
          gameState=level3;
          resetLevel2();
        }
      }
    }
      if(choose3){
        image(win2[2], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next2[2], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          click.trigger();
          timer5.start();
          gameState=level3;
          resetLevel2();
        }
      }
    }
      if(choose4){
        image(win2[3], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next2[3], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          click.trigger(); 
          timer5.start();
          gameState=level3;
          resetLevel2();
        }
      }
    }
      if(choose5){
        image(win2[4], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next2[4], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          click.trigger();
          timer5.start();
          gameState=level3;
          resetLevel2();
        }
      }
    }
      if(choose6){
        image(win2[5], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next2[5], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          click.trigger();
          timer5.start();
          gameState=level3;
          resetLevel2();
        }
      }
    }
   
    }
    if (timer4Lose) {
      if (timer4.remaining()<=0) {
        gameState=gameLose;  
        resetLevel2();
        cockroaches = new Cockroach[10];
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
        }
      }
    }

    break;

  case level3:
    
    if(timer5.active==true){
        image(bg3, 0, 0, 1000, 700);
        timer5.display(19);
  
        if(ceil(timer5.remaining())<=15){
         image(bg3, 0, 0, 1000, 700);
        if(ceil(timer5.remaining())>=0){
         fill(0);
         textFont(timer5.font,80); 
         text(ceil(timer5.remaining() ),880,100);
        }
        if(ceil(timer5.remaining())<=8&&ceil(timer5.remaining())>=5&&freeze.cold==false&&freeze.used==false){
        image(freeze.freeze,freeze.x,freeze.y,45,50);
        }
 
      juice.display();
      for (int i=0; i<cockroaches.length; i++) {
        cockroaches[i].move();
        cockroaches[i].display();
      }
      BG2.play();
      for (int i=0; i<cockroaches.length; i++) {
        if (sp.attack==true&&isHit(sp.x, sp.y, sp.w, sp.h, cockroaches[i].x, cockroaches[i].y, cockroaches[i].w, cockroaches[i].h)==true) {  
          pinch.trigger();
          deadCockroach++;

          juice.add(cockroaches[i].x, cockroaches[i].y);
          juice.Jappear = true;
          //image(juice, cockroaches[i].x, cockroaches[i].y, 100, 100);
          cockroaches[i].x = -1000;
          cockroaches[i].y = -1000;

          return;
        }
      }
       freeze.display();
      if (sp.attack==true&&freeze.cold==false&&isHit(sp.x, sp.y, sp.w, sp.h, freeze.x, freeze.y, freeze.w, freeze.h)==true) {
        freeze.cold=true;
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i].xSpeed=0;
          cockroaches[i].ySpeed=0;
        }
        //return;
      }

      if (freeze.resetmotion==true) {
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i].xSpeed=random(-3, 3);
          cockroaches[i].ySpeed=random(10);
        }
        freeze.resetmotion=false;
        return;
      }



      sp.move();
      sp.display();



      if (deadCockroach == cockroaches.length) { //win
        timer5Lose = false;
        image(boss_hint[2], 0, 0, 1000, 700) ;
        if( BG2.isPlaying() ){
          BG2.rewind();
          BG2.pause();
        }
        warning.play();
        //warning.loop();
        //mouse action3
        if ( mouseX > 671 && mouseX < 933 && mouseY < 611 && mouseY > 528) {
          image(boss_go[2], 0, 0, 1000, 700) ;
          if ( mousePressed ) {
            //click
            click.trigger();
            if( warning.isPlaying() ){
              warning.rewind();
              warning.pause();
            }
            if( !gameReady.isPlaying() ){
              gameReady.rewind();
              gameReady.pause();
            }
            if( !reward.isPlaying() ){
              reward.rewind();
              reward.pause();
            }
            if( !boss.isPlaying() ){
              boss.rewind();
              boss.pause();
            }
            timer6.start();
            deadCockroach = 0;
            gameState = level3Boss;
            juice.juiceNum=0;
          }
        }
      }
      if (timer5Lose) {
        if (timer5.remaining()<=0) {
          gameState=gameLose;
          deadCockroach = 0;
        }
      }
    }
    }
    break;

  case level3Boss:
  freeze.x=floor(random(width-45));
  freeze.y=floor(random(height-50));
  freeze.used=false;
  freeze.cold=false;
    boss.play();
    if( ceil(timer6.remaining())==10 ){
      boss.pause();
      if ( !boss.isPlaying()){
        boss.rewind();
      }
    }
    fl.flashlightEffect();

    boss3.move();
    boss3.display();


    hp.move(); 
    hp.display();

    fl.display();
    fl.move();

    if(ceil(timer6.remaining())>=0){
         
         textFont(timer6.font,80); 
         text(ceil(timer6.remaining() ),880,100);
    }
    if (fl.attack==true&&isHit(fl.x, fl.y, fl.w, fl.h, boss3.x, boss3.y, boss3.bosssize, boss3.bosssize)==true) {
      pinch.trigger();
      boss3.bosssize-=2;
      fl.attack=false;
      hp.hp-=5;
      return;
    }


    if (hp.hp == 0) { //win
      boss3.x = -1000;
      boss3.y = -1000;
      timer6Lose = false;
      reward.play();
      if( boss.isPlaying() ){
        boss.pause();
      }
      if(choose1){
        image(win3[0], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next3[0], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer7.start();
          gameState=level4;
          resetLevel3();
        }
      }
    }
      if(choose2){
        image(win3[1], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next3[1], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer7.start();
          gameState=level4;
          resetLevel3();
        }
      }
    }
      if(choose3){
        image(win3[2], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next3[2], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer7.start();
          gameState=level4;
          resetLevel3();
        }
      }
    }
      if(choose4){
        image(win3[3], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next3[3], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer7.start();
          gameState=level4;
          resetLevel3();
        }
      }
    }
      if(choose5){
        image(win3[4], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next3[4], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer7.start();
          gameState=level4;
          resetLevel3();
        }
      }
    }
      if(choose6){
        image(win3[5], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next3[5], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          timer7.start();
          gameState=level4;
          resetLevel3();
        }
      }
    }

    }

    if (timer6Lose) {
      if (timer6.remaining()<=0) {
        gameState=gameLose;
        resetLevel3();
        cockroaches = new Cockroach[10];
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
        }
      }
    }

    break;

  case level4:
    
    if(timer7.active==true){
        image(bg4, 0, 0, 1000, 700);
        timer7.display(19);
 
        if(ceil(timer7.remaining())<=15){
         image(bg4, 0, 0, 1000, 700);
        if(ceil(timer7.remaining())>=0){
         
         textFont(timer7.font,80); 
         text(ceil(timer7.remaining()),880,100);
        }
        if(ceil(timer7.remaining())<=10&&ceil(timer7.remaining())>=7&&freeze.cold==false&&freeze.used==false){
        image(freeze.freeze,freeze.x,freeze.y,45,50);
        }

      juice.display();
      for (int i=0; i<cockroaches.length; i++) {
        cockroaches[i].move();
        cockroaches[i].display();
      }
      BG2.play();
      for (int i=0; i<cockroaches.length; i++) {
        if (sp.attack==true&&isHit(sp.x, sp.y, sp.w, sp.h, cockroaches[i].x, cockroaches[i].y, cockroaches[i].w, cockroaches[i].h)==true) {  
          pinch.trigger();
          deadCockroach++;

          juice.add(cockroaches[i].x, cockroaches[i].y);
          juice.Jappear = true;
          //image(juice, cockroaches[i].x, cockroaches[i].y, 100, 100);
          cockroaches[i].x = -1000;
          cockroaches[i].y = -1000;

          return;
        }
      }
       freeze.display();
      if (sp.attack==true&&freeze.cold==false&&isHit(sp.x, sp.y, sp.w, sp.h, freeze.x, freeze.y, freeze.w, freeze.h)==true) {
        freeze.cold=true;
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i].xSpeed=0;
          cockroaches[i].ySpeed=0;
        }
        //return;
      }

      if (freeze.resetmotion==true) {
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i].xSpeed=random(-3, 3);
          cockroaches[i].ySpeed=random(10);
        }
        freeze.resetmotion=false;
        return;
      }

      
      sp.move();
      sp.display();



      if (deadCockroach == cockroaches.length) { //win
        timer7Lose = false;
        image(boss_hint[3], 0, 0, 1000, 700) ;
        if( BG2.isPlaying() ){
          BG2.rewind();
          BG2.pause();
        }
        warning.play();
        //mouse action4
        if ( mouseX > 671 && mouseX < 933 && mouseY < 611 && mouseY > 528) {
          image(boss_go[3], 0, 0, 1000, 700) ;
          if ( mousePressed ) {
            //click
            click.trigger();
            if(warning.isPlaying() ){
              warning.rewind();
              warning.pause();
            }
            if( !gameReady.isPlaying() ){
              gameReady.rewind();
              gameReady.pause();
            }
            if( !reward.isPlaying() ){
              reward.rewind();
              reward.pause();
            }
            if( !boss.isPlaying() ){
              boss.rewind();
              boss.pause();
            }
            timer8.start();
            deadCockroach = 0;
            gameState = level4Boss;
            juice.juiceNum=0;
          }
        }
      }
      if (timer7Lose) {
        if (timer7.remaining()<=0) {
          gameState=gameLose;
          deadCockroach = 0;
        }
      }
    }
    }
    break;

  case level4Boss:
  freeze.x=floor(random(width-45));
  freeze.y=floor(random(height-50));
  freeze.used=false;
  freeze.cold=false;
    boss.play();
    image(bg4, 0, 0, 1000, 700);
    
      if(ceil(timer8.remaining())>=0){
        
        textFont(timer8.font,80); 
        text(ceil(timer8.remaining() ),880,100);
      }
    boss4.display();
    boss4.move();
    if (boss4.exist==false) {
      for (int i=0; i< cockroachKids.length; i++) {
        cockroachKids[i].display();
        cockroachKids[i].move();
      }
    }

    if (sp.attack==true && isHit(sp.x, sp.y, 64, 121, int(boss4.x), int(boss4.y), boss4.w, boss4.h)==true) {
      pinch.trigger();
      boss4.exist=false;
      for (int i=0; i< cockroachKids.length; i++) {
        cockroachKids[i].x=boss4.x+150+15*i;
        cockroachKids[i].y=boss4.y+150+10*(i-3);
      }
      return;
    }

    for (int i=0; i<cockroachKids.length; i++) {
      if (sp.attack==true&&isHit(sp.x, sp.y, sp.w, sp.h, cockroachKids[i].x, cockroachKids[i].y, cockroachKids[i].w, cockroachKids[i].h)==true) {  
        pinch.trigger();
        deadCockroach++;
        //image(juice, cockroachKids[i].x, cockroachKids[i].y, 100, 100);
        cockroachKids[i].x = -1000;
        cockroachKids[i].y = -1000;
        sp.attack=false;

        return;
      }
    }
    sp.move();
    sp.display();

    //win
    if (deadCockroach == cockroachKids.length) { //win
      boss4.x = -1000;
      boss4.y = -1000;
      timer8Lose = false;
      reward.play();
      if( boss.isPlaying() ){
        boss.rewind();
        boss.pause();
      }
      if(choose1){
        image(win4[0], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next4[0], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
           boss4.exist=true;
          timer9.start();
          resetLevel4();
        }
      }
    }
      if(choose2){
        image(win4[1], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next4[1], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
           boss4.exist=true;
          timer9.start();
          resetLevel4();
        }
      }
    }
      if(choose3){
        image(win4[2], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next4[2], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
           boss4.exist=true;
          timer9.start();
          resetLevel4();
        }
      }
    }
      if(choose4){
        image(win4[3], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next4[3], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
           boss4.exist=true;
          timer9.start();
          resetLevel4();
        }
      }
    }
      if(choose5){
        image(win4[4], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next4[4], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
           boss4.exist=true;
          timer9.start();
          resetLevel4();
        }
      }
    }
      if(choose6){
        image(win4[5], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next4[5], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
           boss4.exist=true;
          timer9.start();
          resetLevel4();
        }
      }
    }

    }

    if (timer8Lose) {
      if (timer8.remaining()<=0) {
        gameState=gameLose;
        resetLevel4();
        cockroaches = new Cockroach[10];
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
        }
      }
    }

    break;


  case level5:
    
    if(timer9.active==true){
        image(bg5, 0, 0, 1000, 700);
        timer9.display(19);
       
        if(ceil(timer9.remaining())<=15){
         image(bg5, 0, 0, 1000, 700);
         if(ceil(timer9.remaining())>=0){
         fill(0);
         textFont(timer9.font,80); 
         text(ceil(timer9.remaining() ),880,100);
         }
         if(ceil(timer9.remaining())<=12&&ceil(timer9.remaining())>=9&&freeze.cold==false&&freeze.used==false){
        image(freeze.freeze,freeze.x,freeze.y,45,50);
        }
      juice.display();
      for (int i=0; i<cockroaches.length; i++) {
        cockroaches[i].move();
        cockroaches[i].display();
      }
      BG2.play();
      for (int i=0; i<cockroaches.length; i++) {
        if (sp.attack==true&&isHit(sp.x, sp.y, sp.w, sp.h, cockroaches[i].x, cockroaches[i].y, cockroaches[i].w, cockroaches[i].h)==true) {  
          pinch.trigger();
          deadCockroach++;
          sp.attack= false;

          juice.add(cockroaches[i].x, cockroaches[i].y);
          juice.Jappear = true;
          //image(juice, cockroaches[i].x, cockroaches[i].y, 100, 100);
          cockroaches[i].x = -1000;
          cockroaches[i].y = -1000;

          return;
        }
      }
       freeze.display();
      if (sp.attack==true&&freeze.cold==false&&isHit(sp.x, sp.y, sp.w, sp.h, freeze.x, freeze.y, freeze.w, freeze.h)==true) {
        freeze.cold=true;
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i].xSpeed=0;
          cockroaches[i].ySpeed=0;
        }
        //return;
      }

      if (freeze.resetmotion==true) {
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i].xSpeed=random(-3, 3);
          cockroaches[i].ySpeed=random(10);
        }
        freeze.resetmotion=false;
        return;
      }

 

      sp.move();
      sp.display();



      if (deadCockroach == cockroaches.length) { //win
        timer9Lose = false;
        image(boss_hint[4], 0, 0, 1000, 700) ;
        if( BG2.isPlaying() ){
          BG2.rewind();
          BG2.pause();
        }
        warning.play();
        //warning.loop();
        //mouse action5
        if ( mouseX > 671 && mouseX < 933 && mouseY < 611 && mouseY > 528) {
          image(boss_go[4], 0, 0, 1000, 700) ;
          if ( mousePressed ) {
            //click
            click.trigger();
            if( warning.isPlaying() ){
              warning.rewind();
              warning.pause();
            }
            if( !gameReady.isPlaying() ){
              gameReady.rewind();
              gameReady.pause();
            }
            if( !reward.isPlaying() ){
              reward.rewind();
              reward.pause();
            }
            if( !boss.isPlaying() ){
              boss.rewind();
              boss.pause();
            }
            timer10.start();
            deadCockroach = 0;
            gameState = level5Boss;
            juice.juiceNum=0;
          }
        }
      }
      if (timer9Lose) {
        if (timer9.remaining()<=0) {
          gameState=gameLose;
          deadCockroach = 0;
        }
      }
    }
    }
    break; 

  case level5Boss:
  freeze.x=floor(random(width-45));
  freeze.y=floor(random(height-50));
  freeze.used=false;
  freeze.cold=false;
    boss.play();
    if( ceil(timer10.remaining())==20 ){
      boss.pause();
      if ( !boss.isPlaying()){
        boss.rewind();
      }
    }
    if( ceil(timer10.remaining())==10 ){
      boss.pause();
      if ( !boss.isPlaying()){
        boss.rewind();
      }
    }
    image(bg5, 0, 0, 1000, 700);
    

    boss5.move();
    boss5.display();
    
   
    poop.display();
    


    hp.move();
    hp.display();

    sp.display();
    sp.move();

     if(ceil(timer10.remaining())>=0){
        fill(0);
        textFont(timer10.font,80); 
        text(ceil(timer10.remaining() ),880,100);
     }
    if (poop.poopbg==true) {
      sp.attack=false;
    }

    if (sp.attack==true&&isHit(sp.x, sp.y, sp.w, sp.h, boss5.x, boss5.y, boss5.bosssize, boss5.bosssize)==true) {
      pinch.trigger();
      sp.attack=false;
      hp.hp-=5;
      return;
    }

    if (sp.attack==true&&isHit(sp.x, sp.y, sp.w, sp.h, poop.x, poop.y, poop.w, poop.h)==true) {
      poo.trigger();
      poop.poopbg=true;
      sp.cleanup=true;
      sp.attack=false;
    }
    if (poop.poopbg==false) {
      sp.cleanup=false; 
      
    }
    
   if (hp.hp <= 0  ) { //win
      boss5.x = -1000;
      boss5.y = -1000;
      timer10Lose = false;
      reward.play();
      boss.rewind();
      if( boss.isPlaying() ){
        boss.pause();
      }
      if(choose1){
        image(win5[0], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next5[0], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          gameState=gameStory6;
          resetLevel5();
        }
      }
    }
      if(choose2){
        image(win5[1], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next5[1], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          gameState=gameStory6;
          resetLevel5();
        }
      }
    }
      if(choose3){
        image(win5[2], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next5[2], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          gameState=gameStory6;
          resetLevel5();
        }
      }
    }
      if(choose4){
        image(win5[3], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next5[3], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          gameState=gameStory6;
          resetLevel5();
        }
      }
    }
      if(choose5){
        image(win5[4], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next5[4], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();  
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          gameState=gameStory6;
          resetLevel5();
        }
      }
    }
      if(choose6){
        image(win5[5], 0, 0, 1000, 700) ;
        if ( mouseX > 687 && mouseX < 836 && mouseY < 676 && mouseY > 621) {
        image(next5[5], 0, 0, 1000, 700) ;
        if ( mousePressed ) {
          click.trigger();
          if( !reward.isPlaying() ){
            reward.rewind();
            reward.pause();
          }
          gameState=gameStory6;
          resetLevel5();
        }
      }
    }
      
      //poop = null;
      //poop.x=-1000;
      //poop.y=-1000; //<>//
      

    }

    if (timer10Lose) {
      if (timer10.remaining()<=0) {
        gameState=gameLose;
        resetLevel5();
        cockroaches = new Cockroach[10];
        for (int i=0; i<cockroaches.length; i++) {
          cockroaches[i] = new Cockroach(int(random(10)), random(-3, 3));
        }
      }
    }

    break;
    
  }
}
boolean isHit(int ax, int ay, int aw, int ah, int bx, int by, int bw, int bh) {
  if (ax<=bx+bw && ax+aw>=bx &&ay+ah>=by && ay<=by+bh) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  sp.attack=true;
  fl.attack=true;
  Hit=true;
}
void mouseReleased() {
  Hit=false;
  sp.attack=false;
  fl.attack=false;
}