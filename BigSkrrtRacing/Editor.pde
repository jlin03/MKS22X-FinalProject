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
  
  public Editor(Map _m) {      //creates the editor under a certain map, and creates a blockMenu to select tiles to build the map, a currentBlock menu to see the current block being used, and a saveMap menu to save the map.
    m = _m;
    blockMenu = new Menu("blockSelection",width/2-min(width/4,height/4),height/2-min(width/4,height/4));
    currentBlock = new Menu("currentBlock",0,height-(float)80/450*min(height/2,width/2));
    saveMap = new Menu("saveMap",1050,height-(float)80/450*min(height/2,width/2)); 
    toggleMenu = false;
    substance = "grass";      //starts off with the default material of grass
    current = new Tile((float)80/450*min(height/2,width/2),height-(float)58/450*min(height/2,width/2),(float)40/450*min(height/2,width/2));  //tile to be used to display the currentBlock
    stroke(0);
    textSize(20);
  }
  
  void setSubstance(String s) {
    substance = s;
  }
  
  void setTile(float x, float y, String mat) {    //set a tile to be a certain material
    m.getTile(x,y).setMaterial(mat);
  }
  
  void openMenu() {          //opens the tile selection menu
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
    
    action = saveMap.open();                                //keeps the save map menu open and executes a map save if pressed
    if(action != null && action.equals("saveMap")) {
      saveMap(Integer.toString(maps.size()-2));
      textAlign(CENTER,CENTER);
      String saveMessage = "Saving...";
      text(saveMessage,50,50);
      delay(1000);
      saveMessage = "";
      println("saved");
    }
    
    if(mousePressed && substance != null && !toggleMenu && !saveMap.buttons.get(0).isMouseOver()) {          //if the mouse is pressed and the tile selection menu is not open, and the mouse is not clicking on save
      Tile selected = m.getTile(mX,mY);
      String[] layers = selected.material.split(",");
      if((substance.contains("-c") || substance.contains("r-e")) && !layers[layers.length-1].equals(substance)) {  //if the substance a corner/railing and not a base building block, stack it ontop of the tile being edited
        setTile(mX,mY,m.getTile(mX,mY).material + "," + substance);
      }
      else if(!(substance.contains("-c") || substance.contains("r-e")) && substance != null && !toggleMenu){   // if the subtance is a base block, replace the tile selected with that block completely
        setTile(mX,mY,substance);
      }
      display();
    }
    if(keyPressed) {                        //toggles the block selection menu with the 'm' key
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
  
  void display() {      //displays the map
    m.display();
  }
  
  void preLoadMap(String path) {
     Map newMap = new Map(path);
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
      preLoadMap(sketchPath() + "\\" + filename);
    //}
   // catch (IOException e) {
   //   System.out.println("If you're reading this... may G-d help you");
   // }
  }
        
        
    
}
  
  
  
  
  
  
 
