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
    display();
  }
  
  void updateVectors(float k) {
    k *= (carLength*carWidth)/1250;
    if(driving) {
      accel.add(force);
    }
    accel.limit(2);
    
    vel.add(accel);
    vel.limit(carLength*carWidth/100);

    pos.add(vel);
    
    accel.setMag(Math.max(0,(float)(accel.mag()-k)));
    
    if(vel.mag() > 2*k && accel.mag() < 0.05) {
      fric.setMag(fric.mag()+k);
      PVector temp = new PVector(0.01,0.01);
      temp.setMag(fric.mag());
      vel.add(PVector.fromAngle(vel.heading()+PI,temp));
    }
    
    if(vel.mag() <= 2*k && accel.mag() < 0.05) {
         vel.setMag(0.01);
         fric.setMag(0.01);
    }
  }
  
  void turn(float tireAngle, boolean right) {
    if(vel.mag() > 0.1 && driving) {
      PVector temp = PVector.fromAngle(vel.heading()-angle+HALF_PI);
      temp.setMag(vel.mag());
      PVector centripetal = new PVector(0.01,0.01);
      float rad = tan(90-tireAngle) * carLength;
      centripetal.setMag((float)(Math.pow(temp.y,2)/rad)*0.05);
      if(right) {
        angle -= tireAngle*cos(tireAngle)*temp.y/80;
        accel.add(PVector.fromAngle(angle-HALF_PI,centripetal));
      }
      else {
        angle += tireAngle*cos(tireAngle)*temp.y/80;
        accel.add(PVector.fromAngle(angle+HALF_PI,centripetal));
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