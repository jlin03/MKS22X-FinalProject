class LevelSelect {
  Menu levelSelector;
  String selection;
  Map m;
  
  public LevelSelect() {
    m = maps.get((int)random(maps.size()));
    levelSelector = new Menu("levelSelector",0,0);
  }
  
  void display() {
    m.display();
    levelSelector.open();
  }
}
