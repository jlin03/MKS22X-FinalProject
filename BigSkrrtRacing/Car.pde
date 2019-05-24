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

  void update(float s, float k) {
    accel.add(force);
    accel.setMag(Math.max(0,(float)(accel.mag()-Math.sqrt(Math.pow(s, 2)+Math.pow(k, 2)))));
    
    vel.add(accel);
    if(vel.mag() > 0 && !driving) {
      vel.setMag(Math.max(0,(float)(vel.mag()-Math.sqrt(Math.pow(s, 2)+Math.pow(k, 2)))));
    }

    pos.add(vel);
    driving=false;
  }

void drive(float f, boolean forwards) {
  driving=true;
  if (forwards) {
    force.rotate(angle-force.heading());
  }
  else {
    force.rotate(angle-force.heading()+PI);
  }
  force.setMag(f);
}







}