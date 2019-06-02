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
    return action;
  }
  
  boolean isMouseOver() {
    return(mouseX>x-(sizeX/2) && mouseX<x+(sizeX/2) && mouseY>y-(sizeY/2) && mouseY<y+(sizeY/2));
  }
  
  void display() {
    imageMode(CENTER);
    image(button,x,y,sizeX,sizeY);
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text(name,x,y+15,sizeY);
  }
  
  
}
