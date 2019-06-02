import java.io.FileWriter;
PImage blockSelection;
PImage currentBlock;

PImage grass,mud,water,road,goal,preGoal;

PImage[] grassCorner = new PImage[4];
PImage[] mudCorner = new PImage[4];
PImage[] waterCorner = new PImage[4];
PImage[] roadCorner = new PImage[4];

PImage[] roadEdge = new PImage[4];
PImage[] roadPaint = new PImage[2];

PImage[] barrierCorner = new PImage[4];
PImage[] barrierEdge = new PImage[4];

Car test;
Map m;
boolean hold;
boolean up,down,left,right;

Editor e;

void setup() {
  size(1200,900);
  
  blockSelection = loadImage("blockmenu.png");
  currentBlock = loadImage("currentBlock.png");
  
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
  
  m = new Map();
  m.display();
  
  test = new Car(0,400,400,50,25,1,0.2,3);
  hold=false;

  up=false;down=false;left=false;right=false;
  
  e = new Editor(m);
  e.display();
  
}
void draw() {
  e.update();
  
  
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
