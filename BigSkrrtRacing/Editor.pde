class Editor {
  Map m;
  Menu blockMenu;
  Menu currentBlock;
  Menu saveMap;
  Tile current;
  boolean toggleMenu;
  String substance;
  String action;
  int mapNum;
  PrintWriter savedMap;
  
  public Editor(Map _m) {
    m = _m;
    blockMenu = new Menu("blockSelection",width/2-min(width/4,height/4),height/2-min(width/4,height/4));
    currentBlock = new Menu("currentBlock",0,height-(float)80/450*min(height/2,width/2));
    saveMap = new Menu("saveMap",1050,height-(float)80/450*min(height/2,width/2)); 
    toggleMenu = false;
    substance = "grass";
    current = new Tile((float)80/450*min(height/2,width/2),height-(float)58/450*min(height/2,width/2),(float)40/450*min(height/2,width/2));
    stroke(0);
    textSize(20);
  }
  
  void setSubstance(String s) {
    substance = s;
  }
  
  void setTile(float x, float y, String mat) {
    m.getTile(x,y).setMaterial(mat);
  }
  
  void openMenu() {
    substance = blockMenu.open();
  }
  
  void update() {
    textSize(20);
    textAlign(LEFT);
    text("Press 'm' to open the block selection menu.",0,20);
    text("Press 's' to open the level select menu. Current level selected: " + selectedLevel,0,40);
    
    currentBlock.display();
    
    if(substance != null) {
      current.setMaterial(substance);
      current.display();
    }
    
    action = saveMap.open();
    if(action != null && action.equals("saveMap")) {
      saveMap(Integer.toString(maps.size()));
      textAlign(CENTER,CENTER);
      String saveMessage = "Saving...";
      text(saveMessage,50,50);
      delay(1000);
      saveMessage = "";
      println("saved");
    }
    
    if(mousePressed && substance != null && !toggleMenu && !saveMap.buttons.get(0).isMouseOver()) {
      Tile selected = m.getTile(mX,mY);
      String[] layers = selected.material.split(",");
      if((substance.contains("-c") || substance.contains("r-e")) && !layers[layers.length-1].equals(substance)) {
        setTile(mX,mY,m.getTile(mX,mY).material + "," + substance);
      }
      else if(!(substance.contains("-c") || substance.contains("r-e")) && substance != null && !toggleMenu){
        setTile(mX,mY,substance);
      }
      display();
    }
    if(keyPressed) {
      if(key == 'm' || key == 'M') {
        toggleMenu = !toggleMenu;
        display();
        delay(100);
      }
    }
    if(toggleMenu) {
        openMenu();
        if(substance != null) {
          toggleMenu = !toggleMenu;
          display();
          delay(100);
        }
    }
  }
  
  void display() {
    m.display();
  }
  
  void preLoadMap(File saveFile) {
     Map newMap = new Map(saveFile);
     maps.add(newMap);
  }
  
  void saveMap(String num) {
    //try {
      String filename = "Map-"+num+".txt";
      savedMap = createWriter(filename);
      String currentCol = "";
      for (Tile[] colo: m.tiles) {
        for (Tile t: colo) {
          currentCol += t.material;
          if ((t.y)/20 < colo.length-1) {
            currentCol += ";";
          }
          else {
            savedMap.println(currentCol); //each row of txt file represents one column of map data
            currentCol = "";
          }
        }
      }
      savedMap.flush();
      savedMap.close();
      File savedMapFile = new File(filename);
      preLoadMap(savedMapFile);
    //}
   // catch (IOException e) {
   //   System.out.println("If you're reading this... may G-d help you");
   // }
  }
        
        
    
}
  
  
  
  
  
  
 
