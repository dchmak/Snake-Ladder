// mainFrame() draws the main frame
void mainFrame() {  
  image(mainImg, 0, 0);

  // add Hitbox to go to character selection
  Hitbox mainCharSelHB = new Hitbox(1000, 400, 150, 50, "Start Game");
  mainCharSelHB.debug();
  if (mainCharSelHB.hover(mouseX, mouseY)) {
    if (mousePressed) {
      currentFrame = CHAR_SEL;
    }
  }    

  // add Hitbox to quit the game
  Hitbox mainQuitHB = new Hitbox(1000, 450, 150, 50, "Quit");
  mainQuitHB.debug();
  if (mainQuitHB.hover(mouseX, mouseY)) {
    if (mousePressed) {
      exit();
    }
  }
}
