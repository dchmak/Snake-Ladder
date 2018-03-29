import mouse.transformed2D.*;
MouseTransformed mouse = new MouseTransformed(this); 

// Snake & Ladder
// Version 0.1
// Daniel Mak

int currentFrame = 0; // controls the frame shown on screen

boolean mouseClicked = false; // detect mouse action for Hitbox to work 

Tile[] board;  // store the data of the board
Player player;  // store the data of the character
Boss boss;

// settings() initialize the screen size.
void settings() {
  size(SCREEN_WIDTH, SCREEN_LENGTH);
}

// setup() initialize the data.
void setup() {
  reset();
}

// draw() draw the frame on screen according to currentFrame.
void draw() {
  switch(currentFrame) {
  case MAIN: 
    mainFrame();
    break;
  case CHAR_SEL:
    charSelFrame();
    break;
  case GAME:
    gameFrame();
    break;
  case FINAL:
    finalFrame();
    break;
  }

  // framerate display
  fill(YELLOW);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(str(frameRate), 0, 0, 50, 50);
}

// reset() initialize the data.
// effects: mutate board, player, selecting and showMap
//          read external file
void reset() {
  // initialize the board
  board = new Tile[BOARD_SIZE];
  for (int i = 0; i < BOARD_SIZE; i++) {
    board[i] = new Tile();
  }

  JSONArray boardJSON = loadJSONArray("board.json");

  for (int i = 0; i < boardJSON.size(); i++) {
    JSONObject tileJSON = boardJSON.getJSONObject(i);

    //println(tileJSON.getInt("id"));
    //println(tileJSON.getString("event"));
    //println(tileJSON.getInt("target"));
    //println();

    board[tileJSON.getInt("id")].event = tileJSON.getString("event");
    board[tileJSON.getInt("id")].target = tileJSON.getInt("target");
  }

  //board[0].debug();

  // initialize the character
  player = new Player();
  //player.hand.append(0);
  //player.hand.append(1);
  //player.hand.append(2);
  //player.hand.append(3);
  //player.hand.append(4);
  //player.hand.append(5);
  //player.hand.append(6);
  //println(player.hand);

  // initialize the character selection
  selecting = -1;

  // set does not show map as default
  showMap = false;
  
  boss = new Boss();
}


// keyPressed() detect keyboard action.
// effects: export files,
//          mutate showMap
void keyPressed() {
  // take screenshots
  if (key == 'p' || key == 'P') {
    saveFrame("Data/screenshot_######.png");
  }

  // keyboard shortcut for toggling map
  if (currentFrame == GAME) {
    if (key == 'm' || key == 'M') {
      showMap = !showMap;
      //loop();
    }
  }
}

// mouseReleased() detect mouse action.
// effect: mutate mouseClicked
void mouseReleased() {
  //println("released");
  mouseClicked = false;
}

// mouseReleased() detect mouse action.
// effect: mutate mouseClicked
void mousePressed() {
  //println("clicked");
  mouseClicked = true;
}
