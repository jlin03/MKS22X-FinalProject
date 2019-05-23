Car test;

void setup() {
  size(800,800);
  test = new Car(0,0,0);
  
  
}
void draw() {
  if(keyPressed && key == UP) {
    test.drive(30);
  }
  
  test.update(20,20);
  
  //vel lines
  line(200,200,200+test.vel.x,200+test.vel.y);
  line(200,200,200+test.vel.x,200);
  line(200,200,200,200+test.vel.y);
  
  //accel lines
  line(600,200,600+test.accel.x,200+test.accel.y);
  line(600,200,600+test.accel.x,200);
  line(600,200,600,200+test.accel.y);
  
  //force lines
  line(400,400,600+test.driftForce.x,200+test.driveForce.y);
  line(400,400,600+test.driftForce.x,200);
  line(400,400,600,200+test.driveForce.y);
  
}