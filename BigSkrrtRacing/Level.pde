class Level {
  Map m;
  float timer; //timer that holds a number
  String time; //convert timer from seconds to a mm:ss:ms format
  int laps;
  boolean onTrack;  //checks if car is on the track
  Car player;
  Controls input;
  Menu winScreen;
  
  float dangerTimer;  //counts how long the player has been on grass
  float goalTimer;    //counts how long since the player has touched the goal
  
  public Level(Map _m) {
    m = _m;
    winScreen = new Menu("win",width/2,height/2);
    input = new Controls();
    initialize();
  }
  
  void initialize() {                      //starts the map and places the car on a pre goal, facing towards a goal
    float[] startCoordinates = new float[2];
    float angle = 0;
    int count = 0;
    int countG = 0;
    for(Tile[] tiles : m.tiles) {
      for(Tile t : tiles) {
        if (t.material.equals("goal-pre")) {
          if(count == 3) {
            startCoordinates[0] = t.x;
            startCoordinates[1] = t.y;
          }
          count++;
        }
        if (t.material.equals("goal")) {
          if(countG == 3) {
            angle = atan((t.y-startCoordinates[1])/(t.x-startCoordinates[0])+0.01)+PI;
          }
          countG++;
        }
      }
    }
    
    player = new Car(angle,startCoordinates[0],startCoordinates[1],50,25,1,0.2,3);
    timer = 0;
    time = "100000";
    laps = 1;
    dangerTimer = 0;
    display();
  }
  
  void update() {
    if(laps <= 3) {        //run the game if the course hasn't been completed three times yet
      Tile currentlyOn = m.getTile(player.pos.x,player.pos.y);      //get the current tile the car is on
        
      timer += (float)1/60;                  //add to the timer
      input.update();                  //update the controls
      
      
      if(input.up == false && input.down == false) {
        player.driving = false;
      }
      else {
        player.driving = true;
      }
      
      if(input.hold) {                //drive/turn based on player inputs
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
  
      if(currentlyOn.material.contains("goal-pre") && onTrack && goalTimer < 0.1) {          //getting onto the pre goal increases laps
        laps++;
        onTrack = false;
        goalTimer = 1;
      }
      else if(currentlyOn.material.equals("goal") && onTrack) {                            //going backwards into the goal decreases laps(to prevent cheating)
        laps--;
        onTrack = false;
        goalTimer = 1;
      }
      else if(!(currentlyOn.material.equals("goal") || currentlyOn.material.contains("goal-pre") || currentlyOn.material.equals("grass"))) { //checks if the player is not on grass or a goal, if so, they are on the track
        onTrack = true;
        dangerTimer = 0;
        goalTimer -= 1.0/60;
      }
      else if(currentlyOn.material.equals("grass")) {              //if the player is on grass, they have a split second grace period to get off or the level is restarted
        m.update(player.pos.x,player.pos.y,(float)Math.sqrt(Math.pow(player.carLength,2)+Math.pow(player.carWidth,2)));
        dangerTimer += 1.0/60;
        if(dangerTimer > 0.1 || goalTimer > 0.8) {
          initialize();
        }
      }
      if(laps<1) {      //prevent negative laps
        initialize();
      }
      
      m.update(player.pos.x,player.pos.y,(float)Math.sqrt(Math.pow(player.carLength,2)+Math.pow(player.carWidth,2))); //update a regin of the map based on the player and scoreboard position
      m.update(width,0,120);
      player.update(currentlyOn.getKineticFriction());
      player.display();
      
      time = int(timer/60)+":";       //converts the timer to a more recognizable format
      if(((int)timer%60) < 10) {
        time += "0";
      }
      time += ((int)timer%60)+":"+(int)((timer%1)*10000);
      
      textSize(20);                      //displays the time and laps
      textAlign(LEFT);
      text(time,width-100,20);
      text("Lap "+laps,width-50,40);
    }
    else {
      trackComplete();
    }
    
  }
  
  void trackComplete() {          //displays the winscreen menu and shows the player's time to complete the track
    winScreen.display();
    textAlign(CENTER);
    textSize(20);
    fill(0);
    text("Congratulations! Press pause(~) to go back. You beat the level in:\n\n            " + time,width/2,height/2-150,100);
    
  }
  
  void display() {
    m.display();
    player.display();
    text(timer,width-50,20);
    text(laps,width-50,40);
  }
  
  

  
  
}
