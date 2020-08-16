class MainScreen extends Screen{
  void display() {
    update();
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);//英語
    Japanfont = createFont("Meiryo", 50);//日本語
    strokeWeight(5);

    fill(255, 0, 0);
    quad(20, 40, 386, 40, 406, 200, 40, 200);
    textFont(Englishfont);
    fill(255);
    text("Attack", 213, 140);
    textSize(40);
    fill(0);
    textFont(Japanfont);
    text("3 ~ 7 ダメージ", 213, 270);
    fill(255);
    rect(95, 305, 80, 80);
    rect(251, 305, 80, 80);
    fill(0);
    textFont(Englishfont);
    textSize(70);
    text("A", 135, 370);
    text("J", 291, 370);

    fill(255, 0, 0);
    quad(20, 420, 386, 420, 406, 580, 40, 580);
    textFont(Japanfont);
    fill(255);
    text("カウンター", 213, 520);

    fill(0, 0, 255);
    quad(406, 40, 772, 40, 792, 200, 426, 200);
    textFont(Englishfont);
    fill(255);
    text("Deffence", 599, 140);
    textSize(40);
    fill(0);
    textFont(Japanfont);
    text("攻撃無効化、1回復", 599, 270);
    fill(255);
    rect(481, 305, 80, 80);
    rect(637, 305, 80, 80);
    fill(0);
    textFont(Englishfont);
    textSize(70);
    text("S", 521, 370);
    text("K", 677, 370);


    fill(0, 0, 255);
    quad(406, 420, 772, 420, 792, 580, 426, 580);
    textFont(Japanfont);
    fill(255);
    text("りゅうのいかり", 599, 520);

    fill(0, 255, 0);
    quad(792, 40, 1158, 40, 1178, 200, 812, 200);
    textFont(Englishfont);
    fill(255);
    text("Heal", 985, 140);
    textSize(40);

    textFont(Japanfont);

    fill(0);
    text("2 ~ 4 回復", 985, 270);
    fill(255);
    rect(867, 305, 80, 80);
    rect(1023, 305, 80, 80);
    fill(0);

    textFont(Englishfont);

    textSize(70);
    text("D", 907, 370);
    text("L", 1063, 370);

    fill(0, 255, 0);
    quad(792, 420, 1158, 420, 1178, 580, 812, 580);
    textFont(Japanfont);
    fill(255);
    text("ドレイン", 985, 520);
  }
  void update() {
    if (player1.NextAction != null && player2.NextAction != null) {
      delay(50);
      Gameflow.setScreen(new CalcDamage());
    }
    if (keyPressed) {
      if (key == 'a') {
        player1.NextAction = new AttackAction();
      } else if ( key == 's') {
        player1.NextAction = new DeffenceAction();
      } else if (key == 'd') {
        player1.NextAction = new HealAction();
      } else if (key == 'j') {
        player2.NextAction = new AttackAction();
      } else if (key == 'k') {
        player2.NextAction = new DeffenceAction();
      } else if (key == 'l') {
        player2.NextAction = new HealAction();

      }else if (key == 'z'){
        player1.NextAction = new CounterAction();
      }else if (key == 'm') {
        player2.NextAction = new CounterAction();
      }else if (key == '.') {
        player2.NextAction = new DrainAction();
      }else if (key == 'c'){
        player1.NextAction = new DrainAction();
      }else if (key == 'x'){
        player1.NextAction = new DragonRageAction();
      }else if (key == ','){
        player2.NextAction = new DragonRageAction();
      } else {
        fill(0);
        text("invalid key", width/2, height - 100);
      }
    }
  }
}
