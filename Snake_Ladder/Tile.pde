class Tile {
  String event = null;
  int target = -1;
  int id, x, y; 
  color c;

  Tile() {
  }

  void display() {
    fill(c);
    noStroke();
    //println(x, y);
    rect(x, y, TILE_WIDTH, TILE_LENGTH);

    //stroke(BLACK);
    //fill(BLACK);
    //textAlign(CENTER, CENTER);
    //textSize(40);
    //text(str(id), x, y, TILE_WIDTH, TILE_LENGTH);
  }

  void legends() {
    stroke(BLACK);
    fill(BLACK);
    textAlign(CENTER, CENTER);
    textSize(20);
    if (event != null) {
      if (event.equals("teleport")) {
        //println("T");
        //text("T", x, y, TILE_WIDTH, TILE_LENGTH);

        if (id < target) {
          stroke(GREEN);
        } else {
          stroke(YELLOW);
        }
        strokeWeight(4);
        line(x + TILE_WIDTH/2, y + TILE_LENGTH/2, 
          board[target].x + TILE_WIDTH/2, board[target].y + TILE_LENGTH/2);
      }

      if (event.equals("mystery")) {
        //println("?");
        text("?", x, y, TILE_WIDTH, TILE_LENGTH);
        //debug();
      }
    }
    
    strokeWeight(1);
  }

  void debug() {
    print("event: " + event);
    print(" target: " + target);
    print(" id: " + id);
    print(" x, y: " + x, y);
    println();
  }
}
