// Window
final int SCREEN_WIDTH = 1360;
final int SCREEN_LENGTH = 768;

// Color
final color RED = color(255, 200, 200);
final color BLUE = color(100, 100, 255);
final color GREEN = color(200, 255, 200);
final color YELLOW = color(255, 204, 0);
final color PURPLE = color(255, 0, 255);
final color PINK = color(255, 200, 200);
final color WHITE = color(255);
final color LIGHTGREY = color(200);
final color DARKGREY = color(100);
final color BLACK = color(0);

// Frame
final int MAIN = 0;
final int CHAR_SEL = 10;
final int GAME = 11;
final int FINAL = 100;
final int MAX_FRAME = 100;

// In-game display
final int MARGIN = 30;

final int BOARD_WIDTH = 10;
final int BOARD_LENGTH = 10;
final int BOARD_SIZE = BOARD_WIDTH * BOARD_LENGTH;

final int TILE_WIDTH = 70;
final int TILE_LENGTH = 70;

final int BORDER_WIDTH_LR = (SCREEN_WIDTH - BOARD_WIDTH * TILE_WIDTH) / 2;
final int BORDER_WIDTH_TB = (SCREEN_LENGTH - BOARD_LENGTH * TILE_LENGTH) / 2;

final int PLAYER_IMAGE_WIDTH = 150;
final int PLAYER_IMAGE_HEIGHT = 250;
final int PLAYER_IMAGE_X = (SCREEN_WIDTH - PLAYER_IMAGE_WIDTH) / 4;
final int PLAYER_IMAGE_Y = 2 * (SCREEN_LENGTH - PLAYER_IMAGE_HEIGHT) / 3;
final int PLAYER_ICON_RADIUS = 20;

final int CARD_WIDTH = 100;
final int CARD_HEIGHT = 160;
final int CARD_SLOT_WIDTH = TILE_WIDTH * BOARD_WIDTH;

final int CARD_ARC_HEIGHT = CARD_HEIGHT;
final int CARD_SLOT_ARC_X = SCREEN_WIDTH / 2;
final int CARD_SLOT_ARC_Y = SCREEN_LENGTH + int((sq(CARD_SLOT_WIDTH / 2) / CARD_ARC_HEIGHT - CARD_ARC_HEIGHT) / 2);
final int CARD_SLOT_ARC_RAD = CARD_SLOT_ARC_Y - SCREEN_LENGTH + CARD_ARC_HEIGHT;
final int CARD_SLOT_ARC_DIA = CARD_SLOT_ARC_RAD * 2;
final float CARD_ANGLE = tan(float(CARD_WIDTH) / (2 * CARD_SLOT_ARC_RAD)) * 2;

final int DISCARD_PILE_ATT[] = {MARGIN, SCREEN_LENGTH - MARGIN - CARD_HEIGHT, 
  CARD_WIDTH, CARD_HEIGHT};

final int DRAW_PILE_ATT[] = {SCREEN_WIDTH - MARGIN - CARD_WIDTH, 
  SCREEN_LENGTH - MARGIN - CARD_HEIGHT, 
  CARD_WIDTH, CARD_HEIGHT};

final int HP_ATT[] = {MARGIN, MARGIN, 400, 40};
final int ARMOR_ATT[] = {MARGIN, MARGIN + HP_ATT[3], 400, 40};

final int END_TURN_ATT[] = {SCREEN_WIDTH - 100, SCREEN_LENGTH/2 - 70, 100, 70};

final int CELL_DISPLAY_X = 370;
final int CELL_DISPLAY_Y = 280;
final int CELL_DISPLAY_WIDTH = 60;
final int CELL_DISPLAY_HEIGHT = 40;

// Player
final int INIT_MAX_HP = 100;
final int TYPE_A = 0;
final IntList A_STARTING_DECK = new IntList(1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3);

// Card
final int STRIKE = 1;
final int POT = 2;
final int CHARGE = 3;

// Boss Intent
final int BOSS_IDLE = 0;
final int BOSS_ATTACK = 1;
final int BOSS_THREAT = 2;
