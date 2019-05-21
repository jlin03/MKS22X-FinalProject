class PolarVector {
  double magnitude;
  double angle;
  
  public PolarVector(double m, double a) {
      magnitude = m;
      angle = a;
  }
  
  double getX() {
      return magnitude*Math.cos(angle);
  }
  
  double getY() {
      return magnitude*Math.sin(angle);
  }
  
  
  
  
}