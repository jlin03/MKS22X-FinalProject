class Car {
  float angle;
  PVector pos;
  PVector vel;
  PVector accel;
  PVector force;
  PVector fric;
  PVector momentum;
  boolean driving;
  boolean fwd;
  float carLength;
  float carWidth;
  float mass;
  float engineOutput;
  float power;
  float max_force;

  public Car(float a, float x, float y, float l, float w, float m, float p, float f) {
    angle = a;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    force = new PVector(0.01, 0.01);
    fric = new PVector(0.01,0.01);
    momentum = new PVector(0.01,0.01);
    driving = false;
    carLength = l;
    carWidth = w;
    engineOutput = 0;
    power = p;
    mass = m;
    max_force = f;
  }

  void update(float k) {
    updateVectors(k);
    display();
  }
  
  void updateVectors(float k) {
    k *= mass;
    fric.setMag(k*(float)Math.pow(vel.mag()/2,2));
    if(driving) {
      if(fwd) {
        engineOutput = Math.min(1,engineOutput+power);
      }
      else {
        engineOutput = Math.max(-1,engineOutput-power);
      }
      
      momentum.add(force);
    }
    else {
      if(engineOutput < 0) {
        engineOutput = Math.min(0,engineOutput+(k*200/(carLength*carWidth)));
      }
      else {
        engineOutput = Math.max(0,engineOutput-(k*200/(carLength*carWidth)));
      }
    }
   
    vel = momentum.copy().setMag(momentum.mag()/mass);
    //vel.limit(mass*7);

    pos.add(vel);
    
    momentum.setMag(Math.max(0,(float)(momentum.mag()-(k*mass))));
    
    //if(vel.mag() > 2*k && force.mag() < 0.05) {
    //  momentum.add(PVector.fromAngle(vel.heading()+PI,fric.copy()));
    //}
    
    if(vel.mag() <= 2*k && force.mag() < 0.05) {
       vel.setMag(0.01);
    }
    
    if(pos.y >= height || pos.y <= 0) {
      pos.y = Math.min(height-1,Math.abs(height-pos.y));
    }
    if(pos.x >= width || pos.x <= 0) {
      pos.x = Math.min(width-1,Math.abs(width-pos.x));
    }
  }
  
  void brake() {
    engineOutput /= 2;
  }
  
  void turn(float tireAngle, boolean right) {
    if(vel.mag() > 0.1) {
      PVector temp = PVector.fromAngle(vel.heading()-angle+HALF_PI);
      temp.setMag(vel.mag());
      float rad = tan(90-tireAngle) * carLength;
      if(right) {
        angle += cos(tireAngle)*temp.y/rad;
      }
      else {
        angle -= cos(tireAngle)*temp.y/rad;
      }
    }
  }

  void drive(float s, boolean forwards) {
    s *= mass;
    force.rotate(angle-force.heading());
    if (forwards) {
      fwd = true;
    }
    else {
      fwd = false;
    }
    if(engineOutput < 0) {
      force.setMag(Math.max(0.01,(max_force-s)*-1*engineOutput*mass));
      force.rotate(PI);
    }
    else {
      force.setMag(Math.max(0.01,(max_force-s)*engineOutput*mass));
    }
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
