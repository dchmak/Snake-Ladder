boolean showMap = false; // control toggle of map

// gameFrame() draws the frame for the game
void gameFrame() {  
  image(gameBackgroundImg, 0, 0, width, height);

  // add Hitbox to toggle the map
  Hitbox showMapHB = new Hitbox(width-100, MARGIN, 50, 50, "Map");
  showMapHB.debug();
  if (showMapHB.hover(mouseX, mouseY)) {
    if (mouseClicked) {
      showMap = !showMap;
      mouseClicked = false;
    }
  }

  //println(mouseClicked);

  if (showMap) {
    // display the map
    noStroke();
    for (int y = 0; y < BOARD_WIDTH; y++) {
      for (int x = 0; x < BOARD_LENGTH; x++) {

        color c = color(255, map(y * BOARD_LENGTH + x, 0, BOARD_SIZE, 255, 200), 
          map(y * BOARD_LENGTH + x, 0, BOARD_SIZE, 255, 200));        

        board[y * BOARD_LENGTH + x].id = y * BOARD_LENGTH + x;
        if (y % 2 == 0) {
          board[y * BOARD_LENGTH + x].x = BORDER_WIDTH_LR + x * TILE_WIDTH;
        } else { 
          board[y * BOARD_LENGTH + x].x = width - BORDER_WIDTH_LR - (x + 1) * TILE_WIDTH;
        }
        board[y * BOARD_LENGTH + x].y = BORDER_WIDTH_TB + y * TILE_LENGTH;
        board[y * BOARD_LENGTH + x].c = c;
      }
    }

    //int count = 0;
    for (Tile t : board) {
      //count++;
      t.display();
    }
    //println("count: " + count);

    for (Tile t : board) {
      t.legends();
    }

    player.mapDisplay();
  } else {
    // display the player    
    player.display();

    // display cell number
    textAlign(CENTER, CENTER);
    fill(BLACK);
    text(str(player.pos), width/2, height/2);

    // add Hitbox to end turn
    Hitbox endTurnHB = new Hitbox(END_TURN_ATT, "End Turn");
    endTurnHB.debug();
    if (endTurnHB.hover(mouseX, mouseY)) {
      if (mouseClicked) {
        player.endTurn();
        mouseClicked = false;
      }
    }    

    // add an array of Hitboxs for the hand
    Hitbox[] handsHB = new Hitbox[player.hand.size()];

    // display the hand in an arc shape using traslation and rotation
    mouse.pushMatrix();
    mouse.translate(CARD_SLOT_ARC_X, CARD_SLOT_ARC_Y);
    mouse.rotate(-(float(player.hand.size() - 1) / 2) * CARD_ANGLE);

    boolean hovered = false;
    for (int i = 0; i < player.hand.size(); i++) {
      //println(i);
      //fill(GREEN);
      //rect(-CARD_WIDTH / 2, -CARD_SLOT_ARC_RAD, CARD_WIDTH, CARD_HEIGHT);
      // add Hitbox for each card in hand
      handsHB[i] = new Hitbox(-CARD_WIDTH / 2, -CARD_SLOT_ARC_RAD, 
        CARD_WIDTH, CARD_HEIGHT, str(player.hand.get(i)));
      handsHB[i].debug();
      //println(mouseX, mouseY);

      if (handsHB[i].hover(mouse.mouseX(), mouse.mouseY()) && !hovered) {
        hovered = true;
        //println(hand.get(i));
        if (mouseClicked) {
          player.useCard(player.hand.get(i));
          player.discardPile.append(player.hand.get(i));
          player.hand.remove(i);
          mouseClicked = false;
        }
      }  
      mouse.rotate(CARD_ANGLE);
    }
    mouse.popMatrix();
    // all transformation is reverted    

    // add Hitbox for the drawPile
    Hitbox drawPileHB = new Hitbox(DRAW_PILE_ATT, "Draw Pile");
    drawPileHB.debug();
    if (drawPileHB.hover(mouseX, mouseY)) {
      //println(drawPile.size());
      if (mouseClicked) {
        //player.draw(3); // temporary method to draw
        println(player.drawPile); // temporary method to show the drawPile
        mouseClicked = false;
      }
    }

    // add Hitbox for the discardPile
    Hitbox discardPileHB = new Hitbox(DISCARD_PILE_ATT, "Discard Pile");
    discardPileHB.debug();
    if (discardPileHB.hover(mouseX, mouseY)) {
      //println(discardPile.size());
      if (mouseClicked) {
        println(player.discardPile); // temporary method to show the discardPile
        mouseClicked = false;
      }
    }

    boss.showIntent();
  }

  // check for tile event
  player.checkEvent();
}
