class LevelSelect {
  Map m;
  Menu selectMenu;
  String[] levels;
  String selection;
  
  LevelSelect() {
    m = maps.get((int)random(maps.size()));
    selectMenu = new Menu("levelSelect",width/2,height/2);
  }
}
