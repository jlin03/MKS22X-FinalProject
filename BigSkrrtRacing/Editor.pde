class Editor {
  Map m;
  Menu blockMenu;
  String substance;
  
  public Editor(Map _m) {
    m = _m;
    blockMenu = new Menu("blockSelection",width/2-225,height/2-225);
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
    }
    if(keyPressed && keyCode == 'm') {
      openMenu();
    }
    display();
  }
  
  void display() {
    m.display();
  }
  
}
  
  
  
  
  
  
 
