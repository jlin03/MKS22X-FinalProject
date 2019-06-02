class Level {
  Map m;
  float timer;
  int laps;
  Menu pause;
  Car player;
  Controls input;
  
  public Level(Map _m) {
    m = _m;
    pause = new Menu("pause",0,0);
    input = new Controls();
    initialize();
  }
  
  void initialize() {
    player = new Car(0,400,400,50,25,1,0.2,3);
    timer = 0;
    laps = 0;
  }
  
  

  
  
}
