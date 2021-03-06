class Menu {
  String type;        //the type of the menu, determines the buttons and the menu background
  String selection;   //the button selection, used to relay the button action information
  float x,y;          //position of the menu
  ArrayList<Clickable> buttons;    //arraylist of all the buttons in the menu
  float mapScale;
  
  public Menu(String t,float _x, float _y) {
    type = t;
    selection = null;
    x = _x;
    y = _y;
    buttons = new ArrayList<Clickable>();
    
    mapScale = min(height/2,width/2);
    
    float initDistX = (float)18/450*mapScale;
    float initDistY = (float)30/450*mapScale;
    float distScale = (float)75/450*mapScale;
    
    float sideLength = (float)36/450*mapScale;
    
    if(type.equals("blockSelection")) {                                  //adds all the buttons for each respective menu, all formatted to fit on the menu properly
      buttons.add(new Tile(x+initDistX,y+initDistY,sideLength,"grass"));
      buttons.add(new Tile(x+initDistX+distScale,y+initDistY,sideLength,"mud"));
      buttons.add(new Tile(x+initDistX+(distScale*2),y+initDistY,sideLength,"water"));
      buttons.add(new Tile(x+initDistX+(distScale*3),y+initDistY,sideLength,"road"));
      
      for(int i = 1; i < 5; i++) {
        buttons.add(new Tile(x+initDistX,y+initDistY+(distScale*i),sideLength,"grass-corner-"+i));
        buttons.add(new Tile(x+initDistX+distScale,y+initDistY+(distScale*i),sideLength,"mud-corner-"+i));
        buttons.add(new Tile(x+initDistX+(distScale*2),y+initDistY+(distScale*i),sideLength,"water-corner-"+i));
        buttons.add(new Tile(x+initDistX+(distScale*3),y+initDistY+(distScale*i),sideLength,"road-corner-"+i));
        buttons.add(new Tile(x+initDistX+(distScale*4),y+initDistY+(distScale*(i-1)),sideLength,"road-edge-"+i));
      }
      
      for(int i = 1; i < 3; i++) {
        buttons.add(new Tile(x+initDistX+(distScale*5),y+initDistY+(distScale*(i-1)),sideLength,"road-painted-"+i));
      }
      
      for(int i = 1; i < 5; i++) {
        buttons.add(new Tile(x+initDistX+(distScale*(i-1)),y+initDistY+(distScale*5),sideLength,"barrier-edge-"+i));
      }
      
      buttons.add(new Tile(x+initDistX+(distScale*5),y+initDistY+(distScale*2),sideLength,"goal"));
      buttons.add(new Tile(x+initDistX+(distScale*5),y+initDistY+(distScale*3),sideLength,"goal-pre"));
      
      buttons.add(new Tile(x+initDistX+(distScale*5),y+initDistY+(distScale*4),sideLength,"barrier-corner-1"));
      buttons.add(new Tile(x+initDistX+(distScale*4),y+initDistY+(distScale*4),sideLength,"barrier-corner-2"));
      buttons.add(new Tile(x+initDistX+(distScale*4),y+initDistY+(distScale*5),sideLength,"barrier-corner-3"));
      buttons.add(new Tile(x+initDistX+(distScale*5),y+initDistY+(distScale*5),sideLength,"barrier-corner-4"));
      
    }
    else if (type.equals("title")) {
      buttons.add(new Button("Play","level",width/2,height/2-100,200,150));
      buttons.add(new Button("Editor","editor",width/2,height/2+150,200,150));
    }
    else if (type.equals("saveMap")) {
      buttons.add(new Button("Save", "saveMap", 1133,866,130,56));
    }
    else if (type.equals("levelSelect")) {
      File mapBoys = new File(sketchPath());
      File[] mapFiles = mapBoys.listFiles(new FilenameFilter() {
        public boolean accept(File dir, String name) {
          return name.endsWith(".txt");
        }
      });
      int mapInd = 0;
      float yOffset = 100;
      float xOffset = 150;
      while (mapInd < mapFiles.length && yOffset < 850) {
        String name = mapFiles[mapInd].getName();
        buttons.add(new Button(name.substring(0,name.length()-4),"loadmap",xOffset,yOffset,100,50));
        if (xOffset <= 1000) {
          xOffset += 150;
        }
        else {
          xOffset = 150;
          yOffset += 100;
        }
        mapInd++;
      }
    }
    else if(type.equals("pause")) {
      buttons.add(new Button("Retry", "reload",x,y-150,300,200));
      buttons.add(new Button("Title", "back",x,y+150,300,200));
    }
  }
  
  
  String open() {                        //displays the men and checks if any of the buttons are pressed and returns the action, if not, null is returned
    display();
    for(Clickable c : buttons) {
      if(c.isMouseOver() && mousePressed) {
        selection = c.getAction();
      }
    }
    String temp = selection;
    selection = null;
    return temp;
  }
  
  void display() {                        //displays a different menu background depending on its type
    if(type.equals("blockSelection")) {
      imageMode(CORNER);
      image(blockSelection,x,y,min(height/2,width/2),min(height/2,width/2));   
    }
    else if(type.equals("currentBlock")) {
      imageMode(CORNER);
      image(currentBlock,x,y,(float)150/450*mapScale,(float)80/450*mapScale);
    }
    else if (type.equals("title")) {
      imageMode(CENTER);
      //image(pauseMenu,x,y,400,600);
    }
    else if (type.equals("saveMap")) {
      imageMode(CORNER);
      image(saveMap,x,y,(float)150/450*mapScale,(float)80/450*mapScale);
    }
    else if (type.equals("levelSelect")) {
      imageMode(CENTER);
      image(levelMenu,x,y);
    }
    else if(type.equals("pause")) {
      imageMode(CENTER);
      image(pauseMenu,x,y,400,600);
    }
    else if(type.equals("win")) {
      imageMode(CENTER);
      image(winMenu,x,y,600,450);
    }
    
    for(Clickable c : buttons) {
      c.display();
    }
  }
  
  String getSelection() {
    return selection;
  }
  
  
  
}
