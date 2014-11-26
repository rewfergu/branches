class Tile {
  PShape s = loadShape("circles3.svg");
  PShape tile;
  boolean top, right, bottom, left;
  String id;
  // constructor
  Tile(
  String graphic, 
  boolean topVal, 
  boolean rightVal, 
  boolean bottomVal, 
  boolean leftVal) {
      id = graphic;
      tile = s.getChild(id);
      top = topVal;
      right = rightVal;
      bottom = bottomVal;
      left = leftVal;
  }
  
  void display(int x, int y) {
    shape(tile, x, y);
  }
}
