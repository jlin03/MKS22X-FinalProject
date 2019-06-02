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
  
  void update() {
    timer += 1/60;
    timer = Math.round(timer * 100)/100.0;
    input.update();
    
    if(input.up == false && input.down == false) {
      player.driving = false;
    }
    else {
      player.driving = true;
    }
    
    if(input.hold) {
      if(input.up) {
        player.drive(1.3,true);
      }
      if(input.down) {
        player.drive(1.3,false);
      }
      if(input.right) {
        player.turn(PI/4,true);
      }
      if(input.left) {
        player.turn(PI/4,false);
      }
    }
    
    
  }
  
  

  
  
}
