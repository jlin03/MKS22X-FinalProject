Car test;

void setup() {
  size(800,800);
  background(255,255,255);
  test = new Car(0,0,0);
  
  
}
void draw() {
  background(255,255,255);
  //if(keyPressed && key == UP) {
    test.drive(30);
  //}
  
  test.update(0,0);
  
  //vel lines
  line(200,200,200+test.vel.x,200+test.vel.y);
  line(200,200,200+test.vel.x,200);
  line(200,200,200,200+test.vel.y);
  
  //accel lines
  line(600,200,600+test.accel.x,200+test.accel.y);
  line(600,200,600+test.accel.x,200);
  line(600,200,600,200+test.accel.y);
  
  //force lines
  line(400,400,400+test.driftForce.x,400+test.driveForce.y);
  line(400,400,400+test.driftForce.x,400);
  line(400,400,400,400+test.driveForce.y);
  
}