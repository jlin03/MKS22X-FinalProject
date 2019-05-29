public class Tile {
  public String material,shape;
  public float x,y,staticFriction,kineticFriction;
  PImage layer1;
  PImage layer2;
  public Tile(float xcor,float ycor) {
    x = xcor;
    y = ycor;
  }
  public void setMaterial (String m) {
    material = m;
    if (material.equals("road") || material.equals("road-painted")) {
      staticFriction = 1.3;
      kineticFriction = 1;
    }
    if (material.equals("grass")){
      staticFriction = 0.9;
      kineticFriction = 0.7;
    }
    if (material.equals("mud")){
      staticFriction = 10;
      kineticFriction = 10;
    }
    if (material.equals("water")){
      staticFriction = 0.5;
      kineticFriction = 0.3;
    }
    
  }
  public void setShape (String s) {
    shape = s;
  }
  public void display() {
    if (shape.equals("road")) {
      layer1 = road;
    }
    else if (shape.equals("grass")) {
      layer1 = grass;
    }
    else if (shape.equals("paint")) {
      layer1 = roadPaint[0];
    }
    rectMode(CORNER);
    noStroke();
    image(layer1,x*20,y*20,20.0,20.0);
  }
  public float getKineticFriction() {
    return kineticFriction;
  }
  public float getStaticFriction() {
    return staticFriction;
  }
}
