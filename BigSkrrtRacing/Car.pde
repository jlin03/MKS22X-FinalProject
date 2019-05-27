class Car {
  float angle;
  PVector pos;
  PVector vel;
  PVector accel;
  PVector force;
  PVector fric;
  boolean driving;

  public Car(float a, float x, float y) {
    angle = a;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    force = new PVector(0, 0.01);
    fric = new PVector(0,0);
    driving = false;
  }

  void update(float k) {
    updateVectors(k);
  }
  
  void updateVectors(float k) {
    accel.setMag(Math.max(0,(float)(accel.mag()-k)));
    accel.add(force);
    accel.limit(5);
    
    if(vel.mag() > 2*k && accel.mag() < 0.05) {
      fric.add(PVector.fromAngle(vel.heading()+PI,vel).setMag(k));
      vel.add(fric);
    }
    else {
      fric.setMag(0.01);
    }
    
    if(vel.mag() <= 2*k) {
         vel.setMag(0.01);
    }
    
    vel.add(accel);

    pos.add(vel);
  }
  
  void turn(float tireAngle, boolean right) {
    if(vel.mag() > 0.1) {
      PVector temp = PVector.fromAngle(vel.heading()-angle+HALF_PI,vel);
      if(right) {
        angle -= PI*Math.pow(temp.y / sin(180-(2*(90-tireAngle))) * sin(90-tireAngle),2)*0.01;
      }
      else {
        angle += PI*Math.pow(temp.y / sin(180-(2*(90-tireAngle))) * sin(90-tireAngle),2)*0.01;
      }
    }
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

  void display() {
    pushMatrix();
      translate(pos.x,pos.y);
      rotate(angle);
      rect(0,0,100,50);
    popMatrix();
  }







}