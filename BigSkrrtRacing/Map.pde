public class Map {
  public Tile[][] tiles;
  public int rows,cols;
  public Map() {
    rows = height / 20;
    cols = width / 20;
    double xcor = 0;
    double ycor = 0;
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        
}