class Menu {
  String type;
  String selection;
  float x,y;
  ArrayList<Clickable> buttons;
  
  public Menu(String t,float _x, float _y) {
    type = t;
    selection = null;
    x = _x;
    y = _y;
    buttons = new ArrayList<Clickable>();
    
    if(type.equals("blockSelection")) {
      buttons.add(new Tile(x+18,y+30,36,"grass"));
      buttons.add(new Tile(x+75,y+30,36,"mud"));
      buttons.add(new Tile(x+132,y+30,36,"water"));
      buttons.add(new Tile(x+189,y+30,36,"road"));
      
      for(int i = 1; i < 5; i++) {
        buttons.add(new Tile(x+18,y+30+(75*i),36,"grass-corner-"+i));
        buttons.add(new Tile(x+75,y+30+(75*i),36,"mud-corner-"+i));
        buttons.add(new Tile(x+132,y+30+(75*i),36,"water-corner-"+i));
        buttons.add(new Tile(x+189,y+30+(75*i),36,"road-corner-"+i));
        buttons.add(new Tile(x+246,y+30+(75*(i-1)),36,"road-edge-"+i));
      }
      
      for(int i = 1; i < 3; i++) {
        buttons.add(new Tile(x+303,y+30+(75*(i-1)),36,"road-painted-"+i));
      }
    }
    
  }
  
  String open() {
    while(selection == null) {
      display();
      for(Clickable c : buttons) {
        if(c.isMouseOver() && mousePressed) {
          selection = c.getAction();
        }
      }
    }
    String temp = selection;
    selection = null;
    return temp;
  }
  
  void display() {
    if(type.equals("blockSelection")) {
      image(blockSelection,x,y,450,450);   
    }
    
    for(Clickable c : buttons) {
      c.display();
    }
  }
  
  String getSelection() {
    return selection;
  }
  
  
  
}
