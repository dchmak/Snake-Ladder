// Player create the player (duh)
class Player {
  int pos, hp, maxHp, armor, type;
  IntList deck, drawPile, hand, discardPile;
  PImage img;

  // constructor
  Player() {
    pos = 0;
    hp = INIT_MAX_HP;
    maxHp = INIT_MAX_HP;
    armor = 0;
    deck = A_STARTING_DECK;
    drawPile = A_STARTING_DECK;
    hand = new IntList();
    discardPile = new IntList();
    
    switch (type) {
      case TYPE_A:
        img = loadImage("A.png");
        break;
      default:
        println("unknown type");
        exit();
    }
  }

  // show information when map is on
  void mapDisplay() {
    fill(BLUE);
    noStroke();
    ellipse(board[pos].x + TILE_WIDTH/2, board[pos].y + TILE_LENGTH/2, 
      PLAYER_ICON_RADIUS, PLAYER_ICON_RADIUS);
  }

  // show information when map is off
  void display() {
    image(img, PLAYER_IMAGE_X, PLAYER_IMAGE_Y, PLAYER_IMAGE_WIDTH, PLAYER_IMAGE_HEIGHT);

    // display hp
    fill(DARKGREY);
    rect(HP_ATT[0], HP_ATT[1], HP_ATT[2], HP_ATT[3]);
    fill(RED);
    rect(HP_ATT[0], HP_ATT[1], map(hp, 0, maxHp, 0, HP_ATT[2]), HP_ATT[3]);
    fill(BLACK);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("HP: " + hp + " / " + maxHp, HP_ATT[0], HP_ATT[1], HP_ATT[2], HP_ATT[3]);

    // display armor
    fill(BLUE);
    textAlign(LEFT, CENTER);
    textSize(20);
    text("Armor: " + armor, ARMOR_ATT[0], ARMOR_ATT[1], ARMOR_ATT[2], ARMOR_ATT[3]);
  }

  // move(i) moves the character i tiles forward (negative means backward);
  void move(int i) {
    if (pos + i >= 0) {
      pos += i;
    }
  }

  // checkEvent() checks the event of the tile and perform it if applicable.
  void checkEvent() {
    // reaches last tile
    if (pos >= BOARD_SIZE - 1) {
      currentFrame = FINAL;
      return;
    }

    // tile with ladder/snake
    if (board[pos].event != null) {
      if (board[pos].event.equals("teleport")) {
        pos = board[pos].target;
      }
    }
  }

  // draw(n) remove n cards from drawPile and add them to hand  
  // requires: n >= 0
  void draw(int n) {
    for (int i = 0; i < n; i++) {
      if (drawPile.size() == 0) {
        drawPile.append(discardPile);
        discardPile.clear();
      }
      int index = int(random(drawPile.size()));
      hand.append(drawPile.get(index));
      drawPile.remove(index);
    }
  }

  // useCard(id) perform the ability of card with ID id.
  void useCard(int id) {
    switch(id) {
    case STRIKE:
      move(1);
      break;
    case POT:
      armor += 3;
      move(-1);
      break;
    case CHARGE:
      move(1); // unfinish
    }
  }

  void startTurn() {
    draw(3);
    armor = 0;
  }

  void endTurn() {
    //println("End Turn");
    for (int i = hand.size() - 1; i >= 0; i--) { 
      discardPile.append(hand.get(i));
      hand.remove(i);
    }  

    boss.action();

    startTurn();
  }
}  
