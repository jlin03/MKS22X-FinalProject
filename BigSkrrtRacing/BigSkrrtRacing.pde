Car test;
boolean hold;

void setup() {
  size(800,800);
  background(255,255,255);
  test = new Car(HALF_PI,0,0);
  hold=false;
  
  
}
void draw() {
  background(255,255,255);
  if(keyPressed && key == CODED) {
    if(hold) {
      if(keyCode == UP) {
        test.drive(20,false);
      }
      if(keyCode == DOWN) {
        test.drive(20,true);
      }
    }
    else {
      hold=true;
    }
    
  }
  else {
    test.drive(0.01,true);
    hold=false;
  }
  
  test.update(10,10);
  
  //vel lines
  line(200,200,200+test.vel.x,200+test.vel.y);
  line(200,200,200+test.vel.x,200);
  line(200,200,200,200+test.vel.y);
  
  //accel lines
  line(600,200,600+test.accel.x,200+test.accel.y);
  line(600,200,600+test.accel.x,200);
  line(600,200,600,200+test.accel.y);
  
  //force lines
  line(400,400,400+test.force.x,400+test.force.y);
  line(400,400,400+test.force.x,400);
  line(400,400,400,400+test.force.y);
}