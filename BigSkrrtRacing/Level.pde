class Level {
  Map m;
  float timer;
  int laps;
  boolean onTrack;
  Menu pause;
  Car player;
  Controls input;
  Menu winScreen;
  int animVel;
  
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
    animVel = 0;
  }
  
  void update() {
    Tile currentlyOn = m.getTile(player.pos.x,player.pos.y);
      
    timer += (float)1/60;
    input.update();
    
    
    if(input.up == false && input.down == false) {
      player.driving = false;
    }
    else {
      player.driving = true;
    }
    
    if(input.hold) {
      if(input.up) {
        player.drive(currentlyOn.getStaticFriction(),true);
      }
      if(input.down) {
        player.drive(currentlyOn.getStaticFriction(),false);
      }
      if(input.right) {
        player.turn(PI/4,true);
      }
      if(input.left) {
        player.turn(PI/4,false);
      }
    }

    if(currentlyOn.material.contains("goal-pre") && onTrack) {
      laps++;
      onTrack = false;
    }
    else if(currentlyOn.material.equals("goal") && onTrack) {
      laps--;
      onTrack = false;
    }
    else if(!(currentlyOn.material.equals("goal") || currentlyOn.material.contains("goal-pre") || currentlyOn.material.equals("grass"))) {
      onTrack = true;
    }
    else if(currentlyOn.material.equals("grass")) {
      m.update(player.pos.x,player.pos.y,(float)Math.sqrt(Math.pow(player.carLength,2)+Math.pow(player.carWidth,2)));
      initialize();
    }
    
    m.update(player.pos.x,player.pos.y,(float)Math.sqrt(Math.pow(player.carLength,2)+Math.pow(player.carWidth,2)));
    m.update(width,0,120);
    player.update(currentlyOn.getKineticFriction());
    player.display();
    
    String time = int(timer/60)+":";
    if(((int)timer%60) < 10) {
      time += "0";
    }
    time += ((int)timer%60)+":"+(int)((timer%1)*10000);
    
    textSize(20);
    textAlign(LEFT);
    text(time,width-100,20);
    text("Lap "+laps,width-50,40);
    
  }
  
  void trackComplete() {
    
  }
  
  void display() {
    m.display();
    player.display();
    text(timer,width-50,20);
    text(laps,width-50,40);
  }
  
  

  
  
}
