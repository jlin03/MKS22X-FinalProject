class Editor {
  Map m;
  Menu blockMenu;
  boolean toggleMenu;
  String substance;
  
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
      if(substance.contains("-c") && m.getTile(mouseX,mouseY).material.split(",").length < 2) {
        setTile(mouseX,mouseY,m.getTile(mouseX,mouseY).material + "," + substance);
      }
      else if (!substance.contains("-c")){
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
  
}
  
  
  
  
  
  
 
