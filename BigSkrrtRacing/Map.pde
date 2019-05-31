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