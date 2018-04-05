// Hitbox create hitbox for users to click on
class Hitbox {
  int x, y, w, h;
  String str;

  // constructor
  Hitbox(int x, int y, int w, int h, String str) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.str = str;
  }
  
  Hitbox(int att[], String str) {
    this.x = att[0];
    this.y = att[1];
    this.w = att[2];
    this.h = att[3];
    this.str = str;
  }

  // detect if (x, y) is inside the hitbox area
  boolean hover(int x, int y) {
    return (this.x < x && this.x + w > x &&
      this.y < y && this.y + h > y);
  }
  
  // show the area of hitbox and str
  void debug() {
    stroke(0);
    color c = get(this.x + w/2, this.y + h/2);
    color anti = color(255 - red(c), 255 - green(c), 255 - blue(c));

    fill(anti);
    // println(255 - red(c), 255 - green(c), 255 - blue(c));
    rect(this.x, this.y, w, h);

    fill(c);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(str, this.x, this.y, w, h);
  }
}
