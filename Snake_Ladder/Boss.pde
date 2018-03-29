class Boss {
  int intent, str, scr;
  Boss() {
    intent = 0;
    str = 3;
    scr = -2;
  }

  void showIntent() {
    int x = width/2 - 50;
    int y = 0;
    fill(BLACK);
    textAlign(CENTER, CENTER);
    textSize(20);

    switch (intent) {
    case BOSS_IDLE:
      text(str(intent), x, y, 100, 100);  
      break;
    case BOSS_ATTACK:
      text(str(intent), x, y, 100, 100);
      break;
    case BOSS_THREAT:
      text(str(intent), x, y, 100, 100);
      break;
    }
  }

  void action() {
    switch (intent) {
    case BOSS_IDLE:
      break;
    case BOSS_ATTACK:
      player.hp -= str;
      break;
    case BOSS_THREAT:
      player.move(scr);
      break;
    }
    
    intent = int(random(3));
  }
}
