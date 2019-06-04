import java.io.*;
import java.util.Scanner;

PFont comic_sans;

PImage blockSelection;
PImage currentBlock;
PImage levelMenu;
PImage levelButton;
PImage saveMap;
PImage pauseMenu;
PImage winMenu;
PImage button;
PImage logo;

PImage car;

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

boolean u,d,r,l,b,toggleESC;
String mode,selectedLevel;
float mX,mY;

Car test;
Map m;

Editor e;
Level _l;
TitleScreen t;
LevelSelect ls;
Menu esc;

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
  car = loadImage("car.png");
  
  grass = loadImage("grass.png");
  mud = loadImage("mud.png");
  water = loadImage("water.png");
  road = loadImage("road.png");
  goal = loadImage("goal.png");
  preGoal = loadImage("goal-pre.png");
  levelMenu = loadImage("levelMenu.png");
  levelButton = loadImage("levelButton.png");
  
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
  m = new Map("Lawn.txt");
  m.display();
  
  File mapBoys = new File(sketchPath());
      File[] mapFiles = mapBoys.listFiles(new FilenameFilter() {
        public boolean accept(File dir, String name) {
          return name.endsWith(".txt");
        }
      });
  for (File f: mapFiles) {
    maps.add(new Map(f.getName()));
  }
  
  maps.add(m);
  e = new Editor(m);
  
  _l = new Level(m);
  
  t = new TitleScreen();
  
  ls = new LevelSelect(false);
  ls.display();
 
  esc = new Menu("pause",width/2,height/2);
  
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
  if (mode.equals("levelSelect")) {
    ls.display();  
    ls.update();
  }
  
  if(toggleESC) {
    String selection = esc.open();
    if(selection != null) {
      if(selection.equals("back")) {
        mode = "title";
      }
      if(selection.equals("reload")) {
        if(mode.equals("level")) {
          _l.initialize();
        }
        if(mode.equals("editor")) {
          mode = "levelSelect";
        }
        toggleESC = !toggleESC;
        
      }
    }
    
  }

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
    if (key == '`') {
      toggleESC = !toggleESC;
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
