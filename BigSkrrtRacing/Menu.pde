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
    
    if(type.equals("blockSelection")) {
      buttons.add(new Tile(18,30,36,"grass"));
      buttons.add(new Tile(75,30,36,"mud"));
      buttons.add(new Tile(132,30,36,"water"));
      buttons.add(new Tile(189,30,36,"road"));
      
      for(int i = 1; i < 5; i++) {
        buttons.add(new Tile(18,30+(75*i),36,"grass-corner-"+i));
        buttons.add(new Tile(75,30+(75*i),36,"mud-corner-"+i));
        buttons.add(new Tile(132,30+(75*i),36,"water-corner-"+i));
        buttons.add(new Tile(189,30+(75*i),36,"road-corner-"+i));
        buttons.add(new Tile(246,30+(75*(i-1)),36,"road-edge-"+i));
      }
      
      for(int i = 1; i < 3; i++) {
        buttons.add(new Tile(303,30+(75*(i-1)),36,"road-painted-"+i));
      }
    }
    
  }
  
  void open() {
    while(selection == null) {
      
      
      
    }
  }
  
  void display() {
    if(type.equals("blockSelection")) {
      image(blockSelection,x,y,450,450);   
    }
    
    
  }
  
  String getSelection() {
    return selection;
  }
  
  
  
}
