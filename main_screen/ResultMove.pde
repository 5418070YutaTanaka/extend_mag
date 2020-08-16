class ResultMove extends Screen{
  int i = 0;
  int j = 0;
  void display() {
    DrawLifePoint(70, 100, i, 1);
    DrawLifePoint(620, 100, j, 2);
    delay(1000);
    if (player1.lifepoint > i) {
      i++;
    }
    if (player2.lifepoint > j) {
      j++;
    }
    if (player1.lifepoint == i && player2.lifepoint == j) {
      Gameflow.setScreen(new Result());
    }
  }
  void DrawLifePoint(int x, int y, int life, int player) {
    int rectX = x + 8;
    int rectY = y + 8;
    int life2 = 0;
    fill(255);
    rect(x, y, 510, 130);
    stroke(0);
    if (life >= 10) {
      life2 = life % 10;
      life = 10;
    }
    if (player == 1) {
      fill(0, 255, 0);
      for (int i = 0; i < life; i++) {
        rect(rectX + 50 * i, rectY, 44, 114);
      }
      fill(255, 0, 150);
      for (int i = 0; i < life2; i++) {
        rect(rectX + 50 * i, rectY, 44, 114);
      }
    }
    if (player == 2) {
      rectX += 450;
      fill(0, 255, 0);
      for (int i = 0; i < life; i++) {
        rect(rectX - 50 * i, rectY, 44, 114);
      }
      fill(255, 0, 150);
      for (int i = 0; i < life2; i++) {
        rect(rectX - 50 * i, rectY, 44, 114);
      }
    }
  }
}
