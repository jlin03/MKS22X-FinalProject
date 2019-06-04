class LevelSelect {
  Menu levelSelect;
  String selection;
  boolean willEditMap;
  Map m;
  float scale;
  
  public LevelSelect(boolean edit) {
    willEditMap = edit;
    m = maps.get((int)random(maps.size()));
    levelSelect = new Menu("levelSelect",width/2,height/2);
    scale = 1;
    selection = null;
    println(willEditMap);
  }
  
  void update() {
    selection = levelSelect.open();
    if(selection != null && !willEditMap) {
      println(sketchPath()+"\\"+selection+".txt");
      File nextMap = new File(sketchPath()+selection+".txt");
      Map newMap = new Map(nextMap);
      maps.add(newMap);
      m = newMap;
      mode = "level";
    }
    if(selection != null && willEditMap) {
      File nextMap = new File(sketchPath()+selection+".txt");
      Map newMap = new Map(nextMap);
      maps.add(newMap);
      m = newMap;
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
