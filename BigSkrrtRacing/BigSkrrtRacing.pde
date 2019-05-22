void setup() {
  PVector v1 = new PVector(3,0);
  PVector v2 = new PVector(-3,0);
  PVector v3 = new PVector(0,3);
  PVector v4 = new PVector(0,-3);
  println(v1.x + " " + v1.y);
  println(v2.x + " " + v2.y);
  println(v3.x + " " + v3.y);
  println(v4.x + " " + v4.y);
  
  PVector v5 = PVector.add(v1,v2);
  PVector v6 = PVector.add(v3,v4);
  PVector v7 = PVector.add(v1,v3);
  PVector v8 = PVector.add(v2,v4);
  
  println(v5.x + " " + v5.y);
  println(v6.x + " " + v6.y);
  println(v7.x + " " + v7.y);
  println(v8.x + " " + v8.y);
  
  
  
  
}
void draw() {
  
}