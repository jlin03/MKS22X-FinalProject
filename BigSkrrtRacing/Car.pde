class Car {
  float angle;
  PVector pos;
  PVector vel;
  PVector accel;
  PVector force;
  PVector fric;
  boolean driving;
  boolean fwd;
  float carLength;
  float carWidth;
  float engineOutput;
  float power;

  public Car(float a, float x, float y, float l, float w, float p) {
    angle = a;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    force = new PVector(0.01, 0.01);
    fric = new PVector(0.01,0.01);
    driving = false;
    carLength = l;
    carWidth = w;
    engineOutput = 0;
    power = p;
  }

  void update(float k) {
    updateVectors(k);
    display();
  }
  
  void updateVectors(float k) {
    k *= (carLength*carWidth)/1250;
    if(driving) {
      if(engineOutput < 1) {
        engineOutput = Math.min(1,engineOutput+power);
      }
      accel.add(force);
    }
    else {
      engineOutput = Math.max(0,engineOutput-(k*200/(carLength*carWidth)));
    }
    
    accel.limit(carLength*carWidth/500);
    
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
        angle -= tireAngle*cos(tireAngle)*temp.y/100;
        //accel.add(PVector.fromAngle(angle-HALF_PI,centripetal));
      }
      else {
        angle += tireAngle*cos(tireAngle)*temp.y/100;
        //accel.add(PVector.fromAngle(angle+HALF_PI,centripetal));
      }
    }
  }

  void drive(float f, float s, boolean forwards) {
    int direction;
    if (forwards) {
      force.rotate(angle-force.heading());
      fwd = true;
      
    }
    else {
      fwd = false;
      
    }
    force.setMag(Math.max(0.01,(f-s)*engineOutput*1250/(carLength*carWidth)));
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