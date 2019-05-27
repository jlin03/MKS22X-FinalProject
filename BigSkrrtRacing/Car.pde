class Car {
  float angle;
  PVector pos;
  PVector vel;
  PVector accel;
  PVector force;
  PVector fric;
  boolean driving;
  float carLength;
  float carWidth;

  public Car(float a, float x, float y, float l, float w) {
    angle = a;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    force = new PVector(0.01, 0.01);
    fric = new PVector(0.01,0.01);
    driving = false;
    carLength = l;
    carWidth = w;
  }

  void update(float k) {
    updateVectors(k);
  }
  
  void updateVectors(float k) {
    accel.setMag(Math.max(0,(float)(accel.mag()-k)));
    accel.add(force);
    accel.limit(2);
    
    if(vel.mag() > 2*k && accel.mag() < 0.05) {
      fric.setMag(k);
      vel.add(PVector.fromAngle(vel.heading()+PI,fric));
    }
    
    if(vel.mag() <= 2*k) {
         vel.setMag(0.01);
    }
    
    vel.add(accel);
    vel.limit(10);

    pos.add(vel);
  }
  
  void turn(float tireAngle, boolean right) {
    if(vel.mag() > 0.1) {
      PVector temp = PVector.fromAngle(vel.heading()-angle+HALF_PI);
      temp.setMag(vel.mag());
      PVector centripetal = new PVector(0.01,0.01);
      centripetal.setMag((float)(Math.pow(temp.y,2)/tan(90-tireAngle) * carLength));
      if(right) {
        angle -= tireAngle*temp.y*0.1;
        vel.add(PVector.fromAngle(angle-HALF_PI,centripetal));
      }
      else {
        angle += tireAngle*temp.y*0.1;
        vel.add(PVector.fromAngle(angle+HALF_PI,centripetal));
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
      rectMode(CENTER);
      fill(255,0,0);
      translate(pos.x,pos.y);
      rotate(angle);
      rect(0,0,carLength,carWidth);
    popMatrix();
    fill(0);
    point(pos.x,pos.y);
  }







}