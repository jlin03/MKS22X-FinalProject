class Car {
  float angle;
  PVector pos;
  PVector vel;
  PVector accel;
  PVector force;
  boolean driving;

  public Car(float a, float x, float y) {
    angle = a;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    force = new PVector(0, 0.01);
    driving = false;
  }

  void update(float k) {
    accel.setMag(Math.max(0,(float)(accel.mag()-k)));
    accel.add(force);
    
    if(vel.mag() > 0 && accel.mag() < 0.05) {
      vel.add(PVector.fromAngle(vel.heading()+PI,vel).setMag(k));
    }
    vel.add(accel);

    pos.add(vel);
  }

void drive(float f, float s, boolean forwards) {
  if (forwards) {
    force.rotate(angle-force.heading());
  }
  else {
    force.rotate(angle-force.heading()+PI);
  }
  force.setMag(Math.max(0.01,f-s));
}







}