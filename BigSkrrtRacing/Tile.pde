public class Tile implements Clickable{
  public String material;
  public float x,y,size,staticFriction,kineticFriction;
  ArrayList<PImage> layers;
  public Tile(float xcor,float ycor, float s) {
    x = xcor;
    y = ycor;
    size = s;
  }
  public Tile(float xcor,float ycor, float s, String m) {
    x = xcor;
    y = ycor;
    size = s;
    setMaterial(m);
  }
  
  public void setMaterial (String m) {
    layers = new ArrayList<PImage>();
    material = m;
    if (material.equals("road") || material.contains("road-painted-") || material.contains("road-edge-") || material.contains("road-corner-") || material.equals("goal") || material.equals("goal-pre")) {
      staticFriction = 1.3;
      kineticFriction = 1;
    }
    if (material.equals("grass") || material.contains("grass-corner-")){
      staticFriction = 0.9;
      kineticFriction = 0.7;
    }
    if (material.equals("mud") || material.contains("mud-corner-")){
      staticFriction = 10;
      kineticFriction = 10;
    }
    if (material.equals("water") || material.contains("water-corner-")){
      staticFriction = 0.5;
      kineticFriction = 0.3;
    }
    assignMaterial();
    
  }
  public void display() {
    imageMode(CORNER);
    for(PImage layer : layers) {
      image(layer,x,y,size,size);
    }
  } 
  
  void assignMaterial() {
    String[] parts = material.split(",");
    for(String mat : parts) {
      if (mat.equals("road")) {
        layers.add(road);
      }
      else if (mat.equals("grass")) {
        layers.add(grass);
      }
      else if (mat.equals("water")) {
        layers.add(water);
      }
      else if (mat.equals("mud")) {
        layers.add(mud);
      }
      else if (mat.equals("goal")) {
        layers.add(goal);
      }
      else if (mat.equals("goal-pre")) {
        layers.add(preGoal);
      }
      else if (mat.contains("road-painted-")) {
        layers.add(roadPaint[Integer.parseInt(mat.substring(mat.length()-1))-1]);
      }
      else if (mat.contains("road-edge-")) {
        layers.add(roadEdge[Integer.parseInt(mat.substring(mat.length()-1))-1]);
      }
      else if (mat.contains("road-corner-")) {
        layers.add(roadCorner[Integer.parseInt(mat.substring(mat.length()-1))-1]);
      }
      else if (mat.contains("grass-corner-")) {
        layers.add(grassCorner[Integer.parseInt(mat.substring(mat.length()-1))-1]);
      }
      else if (mat.contains("water-corner-")) {
        layers.add(waterCorner[Integer.parseInt(mat.substring(mat.length()-1))-1]);
      }
      else if (mat.contains("mud-corner-")) {
        layers.add(mudCorner[Integer.parseInt(mat.substring(mat.length()-1))-1]);
      }
      else if (mat.contains("barrier-corner-")) {
        layers.add(barrierCorner[Integer.parseInt(mat.substring(mat.length()-1))-1]);
      }
      else if (mat.contains("barrier-edge-")) {
        layers.add(barrierEdge[Integer.parseInt(mat.substring(mat.length()-1))-1]);
      }

    }
    
  }
  
  boolean isMouseOver() {
    return(mouseX>x && mouseX<x+size && mouseY>y && mouseY<y+size);
  }
  
  String getAction() {
    return material;
  }
  
  public float getKineticFriction() {
    return kineticFriction;
  }
  public float getStaticFriction() {
    return staticFriction;
  }
}
