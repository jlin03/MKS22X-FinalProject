void setup() {
  PolarVector v1 = new PolarVector(3,PI/2);
  PolarVector v2 = new PolarVector(3,3*PI/2);
  PolarVector v3 = new PolarVector(3,0);
  PolarVector v4 = new PolarVector(3,PI);
  println(v1.getX() + " " + v1.getY());
  println(v2.getX() + " " + v2.getY());
  println(v3.getX() + " " + v3.getY());
  println(v4.getX() + " " + v4.getY());
  
  PolarVector v5 = PolarOperations.sum(v1,v2);
  PolarVector v6 = PolarOperations.sum(v3,v4);
  PolarVector v7 = PolarOperations.sum(v1,v3);
  PolarVector v8 = PolarOperations.sum(v2,v4);
  
  println(v5.getX() + " " + v5.getY());
  println(v6.getX() + " " + v6.getY());
  println(v7.getX() + " " + v7.getY());
  println(v8.getX() + " " + v8.getY());
  
  
  
  
}
void draw() {
  
}