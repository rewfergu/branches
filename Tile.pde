class Tile {
  PShape s = loadShape("circles3.svg");
  PShape tile, bgCircle, pathGroup;
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
      print(tile.getChildCount());
      bgCircle = tile.getChild(0);
      pathGroup = tile.getChild(1);
      top = topVal;
      right = rightVal;
      bottom = bottomVal;
      left = leftVal;
  }
  
  void display(color bgColor, int x, int y) {
    bgCircle.disableStyle();
    noStroke();
    fill(bgColor);
    shape(bgCircle, x, y);
    shape(pathGroup, x, y);
  }
}
