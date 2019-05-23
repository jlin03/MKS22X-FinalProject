public class Map {
  public Tile[][] tiles;
  public int rows,cols;
  
  public Map() {
    rows = height / 20;
    cols = width / 20;
    tiles = new Tile[rows][cols];
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        tiles[r][c] = new Tile(r,c);
        tiles[r][c].setShape("square");
        if (r % 2 == 1) {
          tiles[r][c].setMaterial("road");
        }
        else {
          tiles[r][c].setMaterial("grass");
        }
      }
    }
  }
  
  public void display() {
    for (Tile[] tt: tiles) {
      for(Tile t: tt) {
        t.display();
      }
    }
  }
  
}