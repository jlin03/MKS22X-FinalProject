class Menu {
  String type;
  String selection;
  float x,y;
  ArrayList<Clickable> buttons;
  float mapScale;
  
  public Menu(String t,float _x, float _y) {
    type = t;
    selection = null;
    x = _x;
    y = _y;
    buttons = new ArrayList<Clickable>();
    
    mapScale = min(height/2,width/2);
    
    float initDistX = (float)18/450*mapScale;
    float initDistY = (float)30/450*mapScale;
    float distScale = (float)75/450*mapScale;
    
    float sideLength = (float)36/450*mapScale;
    
    if(type.equals("blockSelection")) {
      buttons.add(new Tile(x+initDistX,y+initDistY,sideLength,"grass"));
      buttons.add(new Tile(x+initDistX+distScale,y+initDistY,sideLength,"mud"));
      buttons.add(new Tile(x+initDistX+(distScale*2),y+initDistY,sideLength,"water"));
      buttons.add(new Tile(x+initDistX+(distScale*3),y+initDistY,sideLength,"road"));
      
      for(int i = 1; i < 5; i++) {
        buttons.add(new Tile(x+initDistX,y+initDistY+(distScale*i),sideLength,"grass-corner-"+i));
        buttons.add(new Tile(x+initDistX+distScale,y+initDistY+(distScale*i),sideLength,"mud-corner-"+i));
        buttons.add(new Tile(x+initDistX+(distScale*2),y+initDistY+(distScale*i),sideLength,"water-corner-"+i));
        buttons.add(new Tile(x+initDistX+(distScale*3),y+initDistY+(distScale*i),sideLength,"road-corner-"+i));
        buttons.add(new Tile(x+initDistX+(distScale*4),y+initDistY+(distScale*(i-1)),sideLength,"road-edge-"+i));
      }
      
      for(int i = 1; i < 3; i++) {
        buttons.add(new Tile(x+initDistX+(distScale*5),y+initDistY+(distScale*(i-1)),sideLength,"road-painted-"+i));
      }
      
      buttons.add(new Tile(x+initDistX+(distScale*5),y+initDistY+(distScale*(2)),sideLength,"goal"));
    }
    
  }
  
  String open() {
    display();
    for(Clickable c : buttons) {
      if(c.isMouseOver() && mousePressed) {
        selection = c.getAction();
      }
    }
    String temp = selection;
    selection = null;
    return temp;
  }
  
  void display() {
    if(type.equals("blockSelection")) {
      tint(255,255);
      image(blockSelection,x,y,min(height/2,width/2),min(height/2,width/2));   
    }
    else if(type.equals("currentBlock")) {
      image(currentBlock,x,y,(float)150/450*mapScale,(float)80/450*mapScale);
    }
    
    for(Clickable c : buttons) {
      c.display();
    }
  }
  
  String getSelection() {
    return selection;
  }
  
  
  
}
