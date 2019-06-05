class LevelSelect { //level select screen
  Menu levelSelect; //menu to be displayed on screen
  String selection; //choice of map
  boolean willEditMap; //determines whether map is imported into editor or level mode
  Map m; //the map to be displayed in the background behind the menu
  float scale; //for map display
  
  public LevelSelect(boolean edit) { //creates a new levelselect screen and determines editor vs level
    willEditMap = edit; //editor or level
    m = maps.get((int)random(maps.size())); //takes a random map 
    levelSelect = new Menu("levelSelect",width/2,height/2); //makes levelSelect menu
    scale = 1; 
    selection = null;
  }
  
  void update() {
    selection = levelSelect.open();
    if(selection != null && !selection.equals("Lawn") && !willEditMap) {
      delay(300); //QoL improvement
      println(sketchPath()+"\\"+selection+".txt"); //prints file path, useful for debugging
      Map newMap = new Map(sketchPath()+"\\"+selection+".txt"); //gets map from file
      maps.add(newMap); //adds to game array of maps
      m = newMap; //sets current map to selected map
      mode = "level"; //!willEditMap
      _l = new Level(m); //creates new level with map
    }
    if(selection != null && willEditMap) {
      delay(300);
      println(sketchPath()+"\\"+selection+".txt");
      Map newMap = new Map(sketchPath()+"\\"+selection+".txt");
      maps.add(newMap);
      m = newMap;
      mode = "editor"; //willEditmap
      e = new Editor(m); //creates new editor with map
      e.display();
    } 
    
  }
  
  void display() { //for map, just a zoom
    pushMatrix();
      scale(scale);
      translate((-1*((scale-1)*width)/2),(-1*((scale-1)*height)/2));
      m.display();
    popMatrix();
    imageMode(CENTER);
    levelSelect.display();
  }
  
  
  
  
  
  
  
  
  
}
