class Button implements Clickable {
  String name;
  String action;
  float sizeX,sizeY,x,y;
  
  public Button(String n, String a, float _x, float _y, float sX, float sY) { //initializes a button with a name that is displayed, an action value, its coordinates and size
    name = n;
    action = a;
    x = _x;
    y = _y;
    sizeX = sX;
    sizeY = sY;
  }
  
  String getAction() {                  //returns the action of the button when called
    if (action.equals("loadmap")) {
      return name;
    }
    return action;
  }
  
  boolean isMouseOver() {              //checks to see if the mouse is over the button
    return(mouseX>x-(sizeX/2) && mouseX<x+(sizeX/2) && mouseY>y-(sizeY/2) && mouseY<y+(sizeY/2));
  }
  
  void display() {                  //displays button with name over it
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
