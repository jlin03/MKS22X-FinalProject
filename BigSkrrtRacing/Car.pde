class Car {
  float angle;
  PVector pos;
  PVector vel;
  PVector accel;
  PVector driftForce;
  PVector driveForce;
  
  public Car(float a, float x, float y) {
     angle = a;
     pos = new PVector(x,y);
     vel = new PVector(0,0);
     accel = new PVector(0,0);
     driftForce = new PVector(0,0);
     driveForce = new PVector(0,0);
  }
  
  void update(float s, float k) {
    driftForce.setMag(driftForce.mag()-k);    // kinetic friction for drifting
    driveForce.setMag(driveForce.mag()-s);    // static friction for driving
    
    accel.add(driftForce);
    accel.add(driveForce);
    
    vel.add(accel);
    
    pos.add(vel);
    
  }
  
  void drive(float f) {
     driveForce.setMag(driveForce.mag()+f);
  }
  
  
  
  
  
  
  
}