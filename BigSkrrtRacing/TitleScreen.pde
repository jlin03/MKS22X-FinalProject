class TitleScreen {
  Menu titleMenu;
  int timer;
  String selection;
  Map m;
  float scale;
  float logoH;
  float speed;
  
  public TitleScreen() {
    m = maps.get((int)random(maps.size()));
    titleMenu = new Menu("title",width/2,height/2);
    timer = 0;
    scale = 1;
    logoH = 5;
    speed = 0;
    selection = null;
  }
  
  void update() {
    selection = titleMenu.open();
    if(selection != null && selection.equals("level")) {
      mode = "levelSelect";
    }
    if(selection != null && selection.equals("editor")) {
      mode = "editor";
    } 
    
    timer++;
    if(timer > 30) {
      timer = 0;
      scale = 1;
      m = maps.get((int)random(maps.size()));
    }
    if(timer < 20) {
      scale += 0.005;
    }
    
    if(logoH-speed > 1) {
      speed += 0.05;
      logoH -= speed;
    }
    else {
      logoH = 1;
    }
    
  }
  
  void display() {
    pushMatrix();
      scale(scale);
      translate((-1*((scale-1)*width)/2),(-1*((scale-1)*height)/2));
      m.display();
    popMatrix();
    imageMode(CENTER);

    titleMenu.display();
    image(logo,width/2,height/2-320,450*logoH,240*logoH);

  }
  
  
  
  
  
  
  
  
  
}
