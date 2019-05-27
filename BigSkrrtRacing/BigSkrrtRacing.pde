Car test;
boolean hold;
boolean up,down,left,right;

void setup() {
  size(800,800);
  background(255,255,255);
  test = new Car(0,400,400,100,50);
  hold=false;
 
  up=false;down=false;left=false;right=false;
  
}
void draw() {
  background(255,255,255);
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
        test.drive(3,1,false);
      }
      if(down) {
        test.drive(3,1,true);
      }
      if(right) {
        test.turn(PI/36,true);
      }
      if(left) {
        test.turn(PI/36,false);
      }
    }
    else {
      hold=true;
    }
    
  }
  else {
    test.drive(0.01,1,true);
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

}

void keyPressed() {
  if (keyCode == UP && up == false) {
    up = true;
  }
  if (keyCode == DOWN && down == false) {
    down = true;
  }
  if (keyCode == LEFT && left == false) {
    left = true;
  }
  if (keyCode == RIGHT && right == false) {
    right = true;
  }
}

void keyReleased() {
  if (keyCode == UP && up == true) {
    up = false;
  }
  if (keyCode == DOWN && down == true) {
    down = false;
  }
  if (keyCode == LEFT && left == true) {
    left = false;
  }
  if (keyCode == RIGHT && right == true) {
    right = false;
  }
}