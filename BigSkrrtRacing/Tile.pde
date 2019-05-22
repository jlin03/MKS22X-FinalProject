public class Tile {
  private String material,shape;
  private double x,y,staticFriction,kineticFriction;
  public Tile(double xcor,double ycor) {
    x = xcor;
    y = ycor;
  }
  public Tile(double xcor,double ycor, String materrial, String shaape) {
    x = xcor;
    y = ycor;
    material = materrial;
    shape = shaape;
    if (material.equals("road")) {
      staticFriction = 100;
      kineticFriction = 100;
    }
    else {
      staticFriction = 0;
      kineticFriction = 0;
    }
  }
  public void setMaterial (String m) {
    material = m;
  }
  public void setShape (String s) {
    shape = s;
  }
  
  
}