class Editor {
  Map m;
  Menu blockMenu;
  String substance;
  
  public Editor(Map _m) {
    m = _m;
    blockMenu = new Menu("blockSelection");
  }
  
  void setSubstance(String s) {
    substance = s;
  }
  
  void setTile(float x, float y) {
    m.getTile(x,y).setMaterial(substance);
  }
  
  void openMenu() {
    blockMenu.open(width/2,height/2);
  }
  
  
}
  
  
  
  
  
  
 
