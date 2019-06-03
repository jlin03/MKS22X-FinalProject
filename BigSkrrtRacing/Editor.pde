class Editor {
  Map m;
  Menu blockMenu;
  Menu currentBlock;
  Menu saveMap;
  Tile current;
  boolean toggleMenu;
  String substance;
  int mapNum;
  
  public Editor(Map _m) {
    m = _m;
    blockMenu = new Menu("blockSelection",width/2-min(width/4,height/4),height/2-min(width/4,height/4));
    currentBlock = new Menu("currentBlock",0,height-(float)80/450*min(height/2,width/2));
    saveMap = new Menu("saveMap", 
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
    
    currentBlock.display();
    
    if(substance != null) {
      current.setMaterial(substance);
      current.display();
    }
    
    if(mousePressed && substance != null && !toggleMenu) {
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
  
  void saveMap(String num) {
    try {
      FileWriter savedMap = new FileWriter("Map-"+num,true);
      String currentCol = "";
      for (Tile[] colo: m.tiles) {
        for (Tile t: colo) {
          currentCol += t.material;
          if (t.y < colo.length-1) {
            currentCol += ";";
          }
          else {
            savedMap.write(currentCol+"\n"); //each row of txt file represents one column of map data
            currentCol = "";
          }
        }
      }
      savedMap.close();
    }
    catch (IOException e) {
      System.out.println("If you're reading this... may G-d help you");
    }
  }
        
        
    
}
  
  
  
  
  
  
 
