class LevelSelect {
  Menu levelSelect;
  String selection;
  Map m;
  float scale;
  
  public LevelSelect() {
    m = maps.get((int)random(maps.size()));
    levelSelect = new Menu("levelSelect",width/2,height/2);
    scale = 1;
    selection = null;
  }
  
  void update() {
    selection = levelSelect.open();
    if(selection != null && selection.equals("level")) {
      mode = "levelSelect";
    }
    if(selection != null && selection.equals("editor")) {
      mode = "editor";
    } 
    
  }
  
  void display() {
    pushMatrix();
      scale(scale);
      translate((-1*((scale-1)*width)/2),(-1*((scale-1)*height)/2));
      m.display();
    popMatrix();
    imageMode(CENTER);

    levelSelect.display();

  }
  
  
  
  
  
  
  
  
  
}
