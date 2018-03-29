// finalFrame() draw the end scene
void finalFrame() {
  background(LIGHTGREY);

  // add Hitbox for returning to main frame
  Hitbox returnMainHB = new Hitbox(1110, 600, 150, 50, "Return");
  returnMainHB.debug();
  if (returnMainHB.hover(mouseX, mouseY)) {
    if (mousePressed) {
      currentFrame = MAIN;
      reset();
    }
  }
}
