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
  PolarVector sum(PolarVector one, PolarVector two) {
    double sumX = one.getX()+two.getX();
    double sumY = one.getY()+two.getY():
    double hypotenuse = sqrt(Math.pow(sum,2) + Math.pow(sumY,2));
    double ang = Math.atan(sumY,sumX);
    return new PolarVector(hypotenuse,ang);
  }
    
    
  
  
  
  
}