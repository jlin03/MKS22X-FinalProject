class Level {
  Map m;
  float timer;
  int laps;
  boolean onTrack;
  Car player;
  Controls input;
  Menu winScreen;
  int animVel;
  String time;
  
  public Level(Map _m) {
    m = _m;
    winScreen = new Menu("win",width/2,height/2);
    input = new Controls();
    initialize();
  }
  
  void initialize() {
    float[] startCoordinates = new float[2];
    float angle = 0;
    for(Tile[] tiles : m.tiles) {
      for(Tile t : tiles) {
        if (t.material.equals("goal-pre")) {
          startCoordinates[0] = t.x;
          startCoordinates[1] = t.y;
        }
        if (t.material.equals("goal")) {
          angle = atan(t.y-startCoordinates[1]/t.x-startCoordinates[0]);
        }
      }
    }
    
    player = new Car(angle,startCoordinates[0],startCoordinates[1],50,25,1,0.2,3);
    timer = 0;
    time = "100000";
    laps = 0;
    animVel = 0;
  }
  
  void update() {
    if(laps <= 3) {
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
      
      time = int(timer/60)+":";
      if(((int)timer%60) < 10) {
        time += "0";
      }
      time += ((int)timer%60)+":"+(int)((timer%1)*10000);
      
      textSize(20);
      textAlign(LEFT);
      text(time,width-100,20);
      text("Lap "+laps,width-50,40);
    }
    else {
      trackComplete();
    }
    
  }
  
  void trackComplete() {
    winScreen.display();
    textAlign(CENTER);
    fill(0);
    text("Congratulations! You beat the level in:\n\n            " + time,width/2,height/2-150,100);
    
  }
  
  void display() {
    m.display();
    player.display();
    text(timer,width-50,20);
    text(laps,width-50,40);
  }
  
  

  
  
}
