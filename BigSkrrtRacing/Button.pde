class Button implements Clickable {
  String name;
  String action;
  float sizeX,sizeY,x,y;
  
  public Button(String n, String a, float _x, float _y, float sX, float sY) {
    name = n;
    action = a;
    x = _x;
    y = _y;
    sizeX = sX;
    sizeY = sY;
  }
  
  String getAction() {
    if (action.equals("loadmap")) {
      return name;
    }
    return action;
  }
  
  boolean isMouseOver() {
    return(mouseX>x-(sizeX/2) && mouseX<x+(sizeX/2) && mouseY>y-(sizeY/2) && mouseY<y+(sizeY/2));
  }
  
  void display() {
    imageMode(CENTER);
    
    textAlign(CENTER);
    if (action.equals("loadmap")) {
      image(levelButton,x,y,sizeX,sizeY);
      textSize(30);
    }
    else {
      textSize(50);
      image(button,x,y,sizeX,sizeY);
    }
    fill(255);
    text(name,x,y+15,sizeY);
  }
  
  
}
