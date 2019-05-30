class Menu {
  String type;
  String selection;
  
  public Menu(String t) {
    type = t;
    selection = null;
    if(type.equals("blockSelection")) {
      
    }
  }
  
  void open(float x, float y) {
    while(selection == null) {
      
      
      
    }
  }
  
  void display(float x, float y) {
    if(type.equals("blockSelection")) {
      image(blockSelection,x,y,450,450);
      
    }
    
  }
  
  String getSelection() {
    return selection;
  }
  
  
  
}
