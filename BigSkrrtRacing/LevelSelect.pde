class LevelSelect {
  Menu levelSelector;
  String selection;
  Map m;
  
  public LevelSelect() {
    m = maps.get((int)random(maps.size()));
    levelSelector = new Menu("levelSelector",width/2-min(width/4,height/4),height/2-min(width/4,height/4));
  }
  
  void display() {
    m.display();
    levelSelector.open();
  }
}
