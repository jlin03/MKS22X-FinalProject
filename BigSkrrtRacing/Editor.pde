class Editor {
  Map m;
  Menu blockMenu;
  boolean toggleMenu;
  String substance;
  int mapNum;
  
  public Editor(Map _m) {
    m = _m;
    blockMenu = new Menu("blockSelection",width/2-225,height/2-225);
    toggleMenu = false;
    substance = "grass";
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
    if(mousePressed && substance != null) {
      if(substance.contains("-c")) {
        if(m.getTile(mouseX,mouseY).material.split(",").length == 1) {
          setTile(mouseX,mouseY,m.getTile(mouseX,mouseY).material + "," + substance);
        }
        else {
          setTile(mouseX,mouseY,m.getTile(mouseX,mouseY).material.split(",")[0] + "," + substance);
        }
      }
      else {
        setTile(mouseX,mouseY,substance);
      }
      display();
    }
    if(keyPressed) {
      if(key == 'm' || key == 'M') {
        toggleMenu = !toggleMenu;
        display();
      }
    }
    if(toggleMenu) {
        openMenu();
        if(substance != null) {
          toggleMenu = !toggleMenu;
        }
    }
  }
  
  void display() {
    m.display();
  }
  
  void saveMap(String num) {
    FileWriter savedMap = new FileWriter("Map-"+num,true);
    String currentCol;
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
        
        
    
}
  
  
  
  
  
  
 