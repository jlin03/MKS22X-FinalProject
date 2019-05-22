class Car {
  float angle;
  PVector pos;
  PVector vel;
  PVector accel;
  PVector force;
  PVector driftForce;
  PVector driveForce;
  
  public Car(float a, float x, float y) {
     angle = a;
     pos = new PVector(x,y);
     vel = new PVector(0,0);
     accel = new PVector(0,0);
     force = new PVector(0,0);
     driftForce = new PVector(0,0);
     driveForce = new PVector(0,0);
  }
  
  
  
  
  
}