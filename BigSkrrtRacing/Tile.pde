public class Tile {
  public String material,shape;
  public float x,y,staticFriction,kineticFriction;
  public Tile(float xcor,float ycor) {
    x = xcor;
    y = ycor;
  }
  public void setMaterial (String m) {
    material = m;
    if (material.equals("road")) {
      staticFriction = 1;
      kineticFriction = 1;
    }
    else {
      staticFriction = 10;
      kineticFriction = 10;
    }
  }
  public void setShape (String s) {
    shape = s;
  }
  public void display() {
    if (shape.equals("road")) {
      fill(0,0,0);
    }
    else if (shape.equals("grass")) {
      fill(0,255,0);
    }
    else if (shape.equals("paint")) {
      fill(255,255,9);
    }
    rect(x*20,y*20,20.0,20.0);
  }
  public float getKineticFriction() {
    return kineticFriction;
  }
}
