public class Map {
  public Tile[][] tiles;
  public int rows,cols;
  
  public Map() {
    rows = height / 20;
    cols = width / 20;
    tiles = new Tile[cols][rows];
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        tiles[c][r] = new Tile(c,r);
        if (c > cols / 3 && c < 2 * (cols / 3)+1) {
          tiles[c][r].setMaterial("road");
          if (c == 19 || c == 21) {
            tiles[c][r].setShape("paint");
          }
          else {
            tiles[c][r].setShape("road");
          }
        }
        else {
          tiles[c][r].setMaterial("grass");
          tiles[c][r].setShape("grass");
        }
      }
    }
  }
  
  public void display() {
    for (int r = 0; r < rows; r++) {
      for(int c = 0; c < cols; c++) {
        tiles[r][c].display();
      }
    }
  }
  
  public void getKinetic (int x, int y) {
    Tile t = tiles[x][y];
  }
    
  
}