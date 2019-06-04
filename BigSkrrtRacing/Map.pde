public class Map {
  public Tile[][] tiles;
  public int rows,cols;
  
  public Map() {
    rows = height / 20;
    cols = width / 20;
    tiles = new Tile[cols][rows];
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        tiles[c][r] = new Tile(c*20,r*20,20,"grass");
      }
    }
  }
  
  public Map(File saveFile) {
    rows = height / 20;
    cols = width / 20;
    tiles = new Tile[cols][rows];
    try {
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
    }
  }
  
  public void display() {
    for (int c = 0; c < cols; c++) {
      for(int r = 0; r < rows; r++) {
        tiles[c][r].display();
      }
    }
  }
  
  void update(float x, float y, float ra) {
    for (int r = 0; r < rows; r++) {
      for(int c = 0; c < cols; c++) {
        if(Math.pow((c*20)-x,2)+Math.pow((r*20-y),2) < Math.pow(ra,2)) {
          tiles[c][r].display();
        }
      }
    }
  }
  
  public Tile getTile (float x, float y) {
    int co = (int)(x / 20);
    int ro = (int)(y / 20);
    return tiles[co][ro];
  }
    
  
}
