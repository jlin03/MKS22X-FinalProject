class Controls {
  boolean up,down,left,right,brake,hold;
  
  public Controls() {
    up = false;
    down = false;
    left = false;
    right = false;
    brake = false;
  }
  
  void update() {
    up = u;
    down = d;
    left = l;
    right = r;
    brake = b;

    if(keyPressed && key == CODED) {
      if(!hold) {
         hold = true;
      }
    }
    else {
      hold=false;
    }
  }
   
}
