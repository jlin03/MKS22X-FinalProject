public class Tile {
  private String material,shape;
  private double x,y,staticFriction,kineticFriction;
  public Tile(double xcor,double ycor) {
    x = xcor;
    y = ycor;
  }
  public Tile(double xcor,double ycor, double sF, double kF, String materrial, String shaape) {
    x = xcor;
    y = ycor;
    staticFriction = sF;
    kineticFriction = kF;
    material = materrial;
    shape = shaape;
  }
  
}