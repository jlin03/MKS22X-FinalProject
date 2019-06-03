class TitleScreen {
  Menu titleMenu;
  int timer;
  String selection;
  Map m;
  float scale;
  
  public TitleScreen() {
    m = maps.get((int)random(maps.size()));
    titleMenu = new Menu("title",width/2,height/2);
    timer = 0;
    scale = 1;
  }
  
  void update() {
    selection = titleMenu.open();
    if(selection.equals("level")) {
      mode = "level";
    }
    if(selection.equals("editor")) {
      mode = "editor";
    } 
    
    timer++;
    if(timer > 30) {
      timer = 0;
      scale = 1;
      m = maps.get((int)random(maps.size()));
    }
    if(timer < 20) {
      scale += 0.01;
    }
  }
  
  void display() {
    pushMatrix();
      scale(scale);
      translate((-1*((scale-1)*width)/2),(-1*((scale-1)*height)/2));
      m.display();
    popMatrix();
      
    titleMenu.display();

  }
  
  
  
  
  
  
  
  
  
}
