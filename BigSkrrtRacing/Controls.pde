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
    if(keyPressed && key == CODED) {
      if(!hold) {
         hold = true;
      }
    }
    else {
      hold=false;
    }
  }
  
  void keyPressed() {
    if (keyCode == UP && up == false) {
      up = true;
    }
    if (keyCode == DOWN && down == false) {
      down = true;
    }
    if (keyCode == LEFT && left == false) {
      left = true;
    }
    if (keyCode == RIGHT && right == false) {
      right = true;
    }
    if ((key == 'b' || key == 'B') && brake == false) {
      brake = true;
    }
  }

  void keyReleased() {
    if (keyCode == UP && up == true) {
      up = false;
    }
    if (keyCode == DOWN && down == true) {
      down = false;
    }
    if (keyCode == LEFT && left == true) {
      left = false;
    }
    if (keyCode == RIGHT && right == true) {
      right = false;
    }
    if ((key == 'b' || key == 'B') && right == true) {
      brake = false;
    }
  }
  
  
}
