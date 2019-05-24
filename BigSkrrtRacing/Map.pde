public class Map {
  public Tile[][] tiles;
  public int rows,cols;
  
  public Map() {
    rows = width / 20;
    cols = height / 20;
    tiles = new Tile[rows][cols];
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        tiles[r][c] = new Tile(r,c);
        if (r > cols / 3 && r < 2 * (cols / 3)+1) {
          tiles[r][c].setMaterial("road");
          if (r == 19 || r == 21) {
            tiles[r][c].setShape("paint");
          }
          else {
            tiles[r][c].setShape("road");
          }
        }
        else {
          tiles[r][c].setMaterial("grass");
          tiles[r][c].setShape("grass");
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
  
}