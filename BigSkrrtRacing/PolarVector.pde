static class PolarVector {
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
  
  double getMagnitude() {
     return magnitude; 
  }
  
  double getAngle() {
     return angle; 
  }
}
  
static class PolarOperations {
  
  static PolarVector sum(PolarVector one, PolarVector two) {
    double sumX = one.getX()+two.getX();
    double sumY = one.getY()+two.getY();
    double mag = Math.sqrt(Math.pow(sumX,2) + Math.pow(sumY,2));
    double ang = Math.atan(sumY/sumX);
    PolarVector resultant = new PolarVector(mag,ang);
    return resultant;
  }
  
  static PolarVector coordToPolar(double x, double y) {
    return new PolarVector(Math.sqrt(Math.pow(x,2) + Math.pow(y,2)),Math.atan(y/x));
  }
  
}
    
    
  
  
  