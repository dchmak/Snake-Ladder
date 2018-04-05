int selecting = -1; // store character selection

// charSelFrame() draw the character selection frame.
// effects: mutate currentFrame, selecting
void charSelFrame() {
  // change background color according to the selection
  switch(selecting) {
  case TYPE_A:
    background(RED);
    break;
  default:
    background(WHITE);
  }

  // add Hitbox for returning to main frame
  Hitbox charSelReturnHB = new Hitbox(100, 600, 150, 50, "Return");
  charSelReturnHB.debug();
  if (charSelReturnHB.hover(mouseX, mouseY)) {
    if (mousePressed) {
      selecting = -1;
      currentFrame = MAIN;
    }
  }

  // add Hitbox for selecting character A
  Hitbox charSelAHB = new Hitbox(550, 500, 100, 100, "A");
  charSelAHB.debug();
  if (charSelAHB.hover(mouseX, mouseY)) {
    if (mousePressed) {
      selecting = TYPE_A;
      player.type = TYPE_A;
    }
  }

  // add Hitbox for showing there will be future character
  Hitbox charSelFutureHB = new Hitbox(750, 500, 100, 100, "Locked");
  charSelFutureHB.debug();
  
  // add Hitbox for starting the game
  Hitbox charSelStartGameHB = new Hitbox(1110, 600, 150, 50, "Start");
  charSelStartGameHB.debug();
  if (charSelStartGameHB.hover(mouseX, mouseY)) {
    if (selecting != -1) {
      if (mousePressed) {
        currentFrame = GAME;
        player.startTurn();
      }
    }
  }
}
