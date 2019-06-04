import java.io.*;
import java.util.Scanner;

PFont comic_sans;

PImage blockSelection;
PImage currentBlock;
PImage saveMap;
PImage pauseMenu;
PImage winMenu;
PImage button;
PImage logo;

PImage grass,mud,water,road,goal,preGoal;

PImage[] grassCorner = new PImage[4];
PImage[] mudCorner = new PImage[4];
PImage[] waterCorner = new PImage[4];
PImage[] roadCorner = new PImage[4];

PImage[] roadEdge = new PImage[4];
PImage[] roadPaint = new PImage[2];

PImage[] barrierCorner = new PImage[4];
PImage[] barrierEdge = new PImage[4];

ArrayList<Map> maps;

boolean u,d,r,l,b;
String mode;
float mX,mY;

Car test;
Map m;

Editor e;
Level _l;
TitleScreen t;

void setup() {
  size(1200,900);
  
  maps = new ArrayList<Map>();
  
  comic_sans = createFont("comic.ttf",20,true);
  
  blockSelection = loadImage("blockmenu.png");
  currentBlock = loadImage("currentBlock.png");
  saveMap = loadImage("saveMap.png");
  pauseMenu = loadImage("pauseMenu.png");
  winMenu = loadImage("winMenu.png");
  button = loadImage("button.png");
  logo = loadImage("logo.png");
  
  grass = loadImage("grass.png");
  mud = loadImage("mud.png");
  water = loadImage("water.png");
  road = loadImage("road.png");
  goal = loadImage("goal.png");
  preGoal = loadImage("goal-pre.png");
  
  for(int i = 0; i < 4;i++) {
    grassCorner[i] = loadImage("grass-c" +(i+1)+".png");
    mudCorner[i] = loadImage("mud-c" +(i+1)+".png");
    waterCorner[i] = loadImage("water-c" +(i+1)+".png");
    roadCorner[i] = loadImage("road-c" +(i+1)+".png");
    roadEdge[i] = loadImage("road-e" +(i+1)+".png");
    barrierCorner[i] = loadImage("barrier-c" +(i+1)+".png");
    barrierEdge[i] = loadImage("barrier-e" +(i+1)+".png");
  }
  for(int i = 0; i < 2;i++) {
    roadPaint[i] = loadImage("road-p" +(i+1)+".png");
  }
  
  textFont(comic_sans);
  m = new Map();
  m.display();
  
  maps.add(m);
  File f = new File("C:\\Users\\Ben\\MKS22X-FinalProject\\BigSkrrtRacing\\Map-2.txt");
  Map m2 = new Map(f);
  maps.add(m2);
  e = new Editor(m);
  e.display();
  
  _l = new Level(m);
  _l.display();
  
  t = new TitleScreen();
  t.display();
  
  mode = "title";
}
void draw() {
  mX = constrain(mouseX,10,width-10);
  mY = constrain(mouseY,10,height-10);
  
  if(mode.equals("editor")) {
    e.update();
  }
  if(mode.equals("level")) {
    _l.update();
  }
  if(mode.equals("title")) {
    t.update();
    t.display();
  }
  
  
  /*m.update(test.pos.x,test.pos.y,(float)Math.sqrt(Math.pow(test.carLength,2)+Math.pow(test.carWidth,2)));
  fill(0);
  if(up == false && down == false) {
    test.driving = false;
  }
  if(up == true || down == true) {
    test.driving = true;
  }
 
  if(keyPressed && key == CODED) {
    if(hold) {
      if(up) {
        test.drive(1.3,true);
      }
      if(down) {
        test.drive(1.3,false);
      }
      if(right) {
        test.turn(PI/4,true);
      }
      if(left) {
        test.turn(PI/4,false);
      }
    }
    else {
      hold=true;
    }
    
  }
  else {
    test.drive(1,true);
    hold=false;
  }
  
  test.update(1);
  
  //vel lines
  line(200,200,200+test.vel.x,200+test.vel.y);
  line(200,200,200+test.vel.x,200);
  line(200,200,200,200+test.vel.y);
  text(test.vel.x + "," + test.vel.y,200,200);
  
  //accel lines
  line(600,200,600+test.accel.x,200+test.accel.y);
  line(600,200,600+test.accel.x,200);
  line(600,200,600,200+test.accel.y);
  text(test.accel.x + "," + test.accel.y,600,200);
  
  //force lines
  line(400,400,400+test.force.x,400+test.force.y);
  line(400,400,400+test.force.x,400);
  line(400,400,400,400+test.force.y);
  text(test.force.x + "," + test.force.y,400,400);
  
  text(test.driving + "",600,600);
  
  */

}

void keyPressed() {
    if (keyCode == UP && u == false) {
      u = true;
    }
    if (keyCode == DOWN && d == false) {
      d = true;
    }
    if (keyCode == LEFT && l == false) {
      l = true;
    }
    if (keyCode == RIGHT && r == false) {
      r = true;
    }
    if ((key == 'b' || key == 'B') && b == false) {
      b = true;
    }
    if (key == 'e') {
      mode = "editor";
    }
    if (key == 'l') {
      mode = "level";
    }
    if (key == 't') {
      mode = "title";
    }
  }

  void keyReleased() {
    if (keyCode == UP && u == true) {
      u = false;
    }
    if (keyCode == DOWN && d == true) {
      d = false;
    }
    if (keyCode == LEFT && l == true) {
      l = false;
    }
    if (keyCode == RIGHT && r == true) {
      r = false;
    }
    if ((key == 'b' || key == 'B') && r == true) {
      b = false;
    }
  }
