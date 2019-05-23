public class Tile {
  public String material,shape;
  public double x,y,staticFriction,kineticFriction;
  public Tile(double xcor,double ycor) {
    x = xcor;
    y = ycor;
  }
  public void setMaterial (String m) {
    material = m;
    if (material.equals("road")) {
      staticFriction = 100;
      kineticFriction = 100;
    }
    else {
      staticFriction = 0;
      kineticFriction = 0;
    }
  }
  public void setShape (String s) {
    shape = s;
  }
  public void display() {
    if (shape.equals("square")) {
      if (material.equals("road")) {
        fill(0,0,0);
        rect(x,y,20,20,20,20);
      }
    }
  }
      
}