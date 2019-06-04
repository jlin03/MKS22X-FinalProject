class Car {
  float angle;
  PVector pos;
  PVector vel;
  PVector force;
  PVector momentum;
  boolean driving;
  boolean fwd;
  float carLength;
  float carWidth;
  float mass;
  float engineOutput;
  float power;
  float max_force;

  public Car(float a, float x, float y, float l, float w, float m, float p, float f) { //initializes a car at a set angle and position with a set size, mass, power, and max force capability
    angle = a;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    force = new PVector(0.01, 0.01);
    momentum = new PVector(0.01,0.01);
    driving = false;
    carLength = l;
    carWidth = w;
    engineOutput = 0;
    power = p;
    mass = m;
    max_force = f;
  }

  void update(float k) {    //update the car position/angle and then display it
    updateVectors(k);
    display();
  }
  
  void updateVectors(float k) {
    angle %= TWO_PI;            // keep the angle under 2PI
    k *= mass;                  //multiply friction by the mass of the car
    if(driving) {                      //if the car is driving, then slowly increase the engineOutput in a respective direction by a certain power constant for a smooth force transition
      if(fwd) {
        engineOutput = Math.min(1,engineOutput+power);
      }
      else {
        engineOutput = Math.max(-1,engineOutput-power);
      }
      
      momentum.add(force);      //add the driving force to momentum
    }
    else {                             //if the car is not driving, then slowly bring the engineOutput to 0 using friction multiplied by some constants
      if(engineOutput < 0) {
        engineOutput = Math.min(0,engineOutput+(k*200/(carLength*carWidth)));
      }
      else {
        engineOutput = Math.max(0,engineOutput-(k*200/(carLength*carWidth)));
      }
    }
   
    vel = momentum.copy().setMag(momentum.mag()/mass);    //copy the momentum vector and divide it by the car's mass. Then, assign it to be velocity
    vel.limit(mass*10);                                   //limit the magnitude of velocity

    pos.add(vel);
    
    momentum.setMag(Math.max(0,(float)(momentum.mag()-(k*mass*1.5))));      //decrease momentum based on friction multipled by some constants
    
    if(vel.mag() <= 2*k && force.mag() < 0.05) {                 //keep vel from drifting back and forth by making it 0 if it is miniscule
       vel.setMag(0.01);
    }
    
    if(pos.y >= height || pos.y <= 0) {                       //weave the car's position to be constrained in the map
      pos.y = Math.min(height-1,Math.abs(height-pos.y));
    }
    if(pos.x >= width || pos.x <= 0) {
      pos.x = Math.min(width-1,Math.abs(width-pos.x));
    }
  }
  
  void brake() {                //decrease the engineOutput quickly
    engineOutput /= 2;
  }
  
  void turn(float tireAngle, boolean right) {        //turn the car angle based on it's length, tireAngle, and magnitude of velocity
    if(vel.mag() > 0.1) {
      PVector temp = PVector.fromAngle(vel.heading()-angle+HALF_PI);
      temp.setMag(vel.mag());
      float rad = tan(90-tireAngle) * carLength;
      if(right) {
        angle += cos(tireAngle)*temp.y*3/rad;
      }
      else {
        angle -= cos(tireAngle)*temp.y*3/rad;
      }
    }
  }

  void drive(float s, boolean forwards) {          //set the car's force to be in the direction of driving, and to the magnitude of its max power * the engine output
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

  void display() {                          //draw the car based on its position and angle
    pushMatrix();
      imageMode(CENTER);
      fill(255,0,0);
      translate(pos.x,pos.y);
      rotate(angle);
      image(car,0,0,carLength,carWidth);
    popMatrix();
    fill(0);
    point(pos.x,pos.y);
  }







}
