class LevelSelect {
  Menu titleMenu;
  String selection;
  Map m;
  float scale;
  
  public LevelSelect() {
    m = maps.get((int)random(maps.size()));
    titleMenu = new Menu("title",width/2,height/2);
    scale = 1;
    selection = null;
  }
  
  void update() {
    selection = titleMenu.open();
    if(selection != null && selection.equals("level")) {
      mode = "title";
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

    titleMenu.display();

  }
  
  
  
  
  
  
  
  
  
}
