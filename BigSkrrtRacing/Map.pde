public class Map {
  public Tile[][] tiles; //2d array of tiles organized CxR to be displayed in-game
  public int cols,rows; //column and row variables for array of tiles
  
  public Map() { //default map (no file provided, blank canvas for editor)
    rows = height / 20; //each tile is 20px, 45 rows of tiles (900px)
    cols = width / 20; //each tile is 20px, 60 cols of tiles (1200px)
    tiles = new Tile[cols][rows]; 
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        tiles[c][r] = new Tile(c*20,r*20,20,"grass"); // "Lawn"
      }
    }
  }
  
  public Map(String saveFile) { //streamlined load process
    rows = height / 20;
    cols = width / 20;
    tiles = new Tile[cols][rows];
    String[] colos = loadStrings(saveFile); //array of of strings for each line of savefile
    for (int c = 0; c < cols; c++) { //loop through colos
      String[]materials = colos[c].split(";"); //semicolon used as delimiter to separate tiles in same row
      for (int r = 0; r < rows; r++) {
        tiles[c][r] = new Tile(c*20,r*20,20,materials[r]); //creates tile of given material
      }
    }
      
    /*try { OLD IMPLEMENTATION
      Scanner s = new Scanner(saveFile);
      println("Map created");
      int c = 0;
      while (s.hasNextLine() && c < cols) {
        String currentCol = s.nextLine();
        String[] materials = currentCol.split(";");
        for (int r = 0; r < rows; r++) {
          tiles[c][r] = new Tile(c*20,r*20,20,materials[r]);
        }
        c++;
      }
      s.close();  
    }
    catch (FileNotFoundException e) {
      System.out.println("The file don't exist");
    }*/
  }
  
  public void display() { //displays each tile
    for (int c = 0; c < cols; c++) {
      for(int r = 0; r < rows; r++) {
        tiles[c][r].display();
      }
    }
  }
  
  void update(float x, float y, float ra) { //proper positioning of grid
    for (int r = 0; r < rows; r++) {
      for(int c = 0; c < cols; c++) {
        if(Math.pow((c*20)-x,2)+Math.pow((r*20-y),2) < Math.pow(ra,2)) { //ensures pixel perfect grid placement
          tiles[c][r].display();
        }
      }
    }
  }
  
  public Tile getTile (float x, float y) { //use x & y coordinates to get specific tile in array
    int co = (int)(x / 20); 
    int ro = (int)(y / 20);
    return tiles[co][ro];
  }
    
  
}
