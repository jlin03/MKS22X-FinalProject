public class Tile implements Clickable{
  public String material;
  public float x,y,size,staticFriction,kineticFriction;
  PImage layer1;
  PImage layer2;
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
    material = m;
    if (material.equals("road") || material.contains("road-painted-") || material.contains("road-edge-") || material.contains("road-corner-")) {
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
    image(layer1,x,y,size,size);
    
    if(layer2 != null) {
      image(layer2,x,y,size,size);
    }
    
  } 
  
  void assignMaterial() {
    String[] parts = material.split(",");
    if (parts[0].equals("road")) {
      layer1 = road;
    }
    else if (parts[0].equals("grass")) {
      layer1 = grass;
    }
    else if (parts[0].equals("water")) {
      layer1 = water;
    }
    else if (parts[0].equals("mud")) {
      layer1 = mud;
    }
    else if (parts[0].contains("road-painted-")) {
      layer1 = roadPaint[Integer.parseInt(parts[0].substring(parts[0].length()-1))-1];
    }
    else if (parts[0].contains("road-edge-")) {
      layer1 = roadEdge[Integer.parseInt(parts[0].substring(parts[0].length()-1))-1];
    }
    else if (parts[0].contains("road-corner-")) {
      layer1 = roadCorner[Integer.parseInt(parts[1].substring(parts[1].length()-1))-1];
    }
    else if (parts[0].contains("grass-corner-")) {
      layer1 = grassCorner[Integer.parseInt(parts[1].substring(parts[1].length()-1))-1];
    }
    else if (parts[0].contains("water-corner-")) {
      layer1 = waterCorner[Integer.parseInt(parts[1].substring(parts[1].length()-1))-1];
    }
    else if (parts[0].contains("mud-corner-")) {
      layer1 = mudCorner[Integer.parseInt(parts[1].substring(parts[1].length()-1))-1];
    }
    
    if(parts.length > 1) {
      if (parts[1].contains("road-corner-")) {
        layer2 = roadCorner[Integer.parseInt(parts[1].substring(parts[1].length()-1))-1];
      }
      else if (parts[1].contains("grass-corner-")) {
        layer2 = grassCorner[Integer.parseInt(parts[1].substring(parts[1].length()-1))-1];
      }
      else if (parts[1].contains("water-corner-")) {
        layer2 = waterCorner[Integer.parseInt(parts[1].substring(parts[1].length()-1))-1];
      }
      else if (parts[1].contains("mud-corner-")) {
        layer2 = mudCorner[Integer.parseInt(parts[1].substring(parts[1].length()-1))-1];
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
