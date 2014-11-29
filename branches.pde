//import processing.pdf.*;

int canvasWidth = 750;
int canvasHeight = 750;
int gridSize = 75;
int cols = canvasWidth / gridSize;
int rows = canvasHeight / gridSize;


Tile[] tiles = new Tile[13];
boolean[] branches = { false, false, false, false };
Tile[] tileList = new Tile[cols*rows];
int currentTile = 0;
Tile[] branchSet = new Tile[0];


void setup() {
  frameRate(4);
  size(canvasWidth, canvasHeight);
  //size(canvasWidth, canvasHeight, PDF, "output.pdf");
  colorMode(HSB, 100);

  smooth();
  fill(6, 26, 34);
  rect(0,0,width,height);
  // get tiles and branches
  tiles[0] = new Tile("one", false, false, true, true);
  tiles[1] = new Tile("two", true, false, false, true);
  tiles[2] = new Tile("three", true, true, false, false);
  tiles[3] = new Tile("four", false, true, true, false);
  tiles[4] = new Tile("five", false, true, true, true);
  tiles[5] = new Tile("six", true, true, true, false);
  tiles[6] = new Tile("seven", true, true, false, true);
  tiles[7] = new Tile("eight", true, false, true, true);
  tiles[8] = new Tile("nine", true, true, true, true);
  tiles[9] = new Tile("ten", true, true, true, true);
  tiles[10] = new Tile("eleven", true, true, true, true);
  tiles[11] = new Tile("twelve", true, true, true, true);
  tiles[12] = new Tile("thirteen", true, true, true, true);
  
 for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      println("============================================");
      println("Current Tile: " + currentTile);
      
      if (i != 0) {
        // look up and assign value to branches array
        println(currentTile-rows);
        branches[2] = tileList[currentTile-cols].bottom;
        println("Look up: " + branches[2]);
      } else {
        println("We can't look up");
      }
      
      if (j != 0) {
        // look left and assign value to branches array
        branches[3] = tileList[currentTile-1].right;
        println("Look left: " + branches[3]);
      } else  {
        println("We can't look left");
      }
      
      // create a list of tiles that will connect with the existing branch
      for (int k = 0; k < tiles.length; k++) {
        if (branches[2] == tiles[k].top && branches[3] == tiles[k].left) {
          branchSet = (Tile[]) append(branchSet, tiles[k]);
        }
      }
      
      println("We have " + branchSet.length + " options to choose from.");
      
      int tileNumber = int(random(branchSet.length));
      int x = (j*gridSize);
      int y = (i*gridSize);
      color bgColor = color(floor(random(17, 45)), 20, 57);
      
      tileList[currentTile] = branchSet[tileNumber];
      println("We picked tile " + branchSet[tileNumber].id + " at random.");
      
      tileList[currentTile].display(bgColor, x, y);
      
      currentTile++;
      
      // reset the branch set each time so we have new ones to pick from
      branchSet = new Tile[0];
    }
  }
  saveFrame("output.png");
}

