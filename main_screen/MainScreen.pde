class MainScreen extends Screen {
  void display() {
    update();
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);//英語
    Japanfont = createFont("Meiryo", 50);//日本語
    strokeWeight(5);
    stroke(0, 0, 0);

    Attack();

    fill(0);
    textFont(Japanfont);
    textSize(37);
    text("3 ~ 7 ダメージ", 213, 270);
    fill(255);
    if (player1.NextAction != null){
      fill(255,255,0);
    }
    rect(95, 305, 80, 80);
    fill(255);
    if (player2.NextAction != null){
      fill(255,255,0);
    }
    
    rect(251, 305, 80, 80);
    fill(0);
    textFont(Englishfont);
    textSize(70);
    text("a", 135, 370);
    text("j", 291, 370);
    
    Kaunter();

    rect(95, 700, 80, 80);
    rect(251, 700, 80, 80);
    //追加内容
    fill(0);
    textFont(Japanfont);

    textSize(30);
    text("相手がAttack選択時、", 213, 630);
    text("Attack無効＆3～7ダメージ", 213, 660);
    fill(255);
    if (player1.NextAction != null){
      fill(255,255,0);
    }
    rect(95, 700, 80, 80);
    fill(255);
    if (player2.NextAction != null){
      fill(255,255,0);
    }
    
    rect(251, 700, 80, 80);
    fill(0);
    textSize(70);
    text("m", 291, 765);
    text("z", 135, 765);
    if (player1.extra){ 
      rect(95, 700, 80, 80);
    }
    
    if (player2.extra){
      rect(251, 700, 80, 80);
    }


    Diffence();

    fill(0);
    textFont(Japanfont);
    textSize(37);
    text("Attack無効、1回復", 599, 270);
    fill(255);
    if (player1.NextAction != null){
      fill(255,255,0);
    }
    rect(481, 305, 80, 80);
    fill(255);
    if (player2.NextAction != null){
      fill(255,255,0);
    }
    
    rect(637, 305, 80, 80);
    fill(0);
    textFont(Englishfont);
    textSize(70);
    text("s", 521, 370);
    text("k", 677, 370);


    Dragon();
    
    
    //追加内容
    fill(0);
    textFont(Japanfont);

    textSize(37);
    text("固定3ダメージ", 599, 650);

    fill(255);
    if (player1.NextAction != null){
      fill(255,255,0);
    }
    fill(255);
    if (player2.NextAction != null){
      fill(255,255,0);
    }
    rect(481, 700, 80, 80);
    rect(637, 700, 80, 80);
    fill(0);
    textSize(70);
    text(",", 677, 765);
    text("x", 521, 765);
    
    if (player1.extra){ 
      rect(481, 700, 80, 80);
    }
    if (player2.extra){
      rect(637, 700, 80, 80);
    }



    Heal();

    fill(0);
    textFont(Japanfont);
    textSize(37);
    text("2 ~ 4 回復", 985, 270);
    fill(255);
    if (player1.NextAction != null){
      fill(255,255,0);
    }
    rect(867, 305, 80, 80);
    fill(255);
    if (player2.NextAction != null){
      fill(255,255,0);
    }
    
    rect(1023, 305, 80, 80);
    fill(0);

    textFont(Englishfont);

    textSize(70);
    text("d", 907, 370);
    text("l", 1063, 370);
    
    
    Drain();
    
    //追加内容
    fill(0);
    textFont(Japanfont);
    textSize(30);
    text("相手がHeal選択時、", 985, 630);
    text("Heal無効＆相手の回復分回復", 985, 660);
    fill(255);
    if (player1.NextAction != null){
      fill(255,255,0);
    }
    rect(867, 700, 80, 80);
    fill(255);
    if (player2.NextAction != null){
      fill(255,255,0);
    }
    rect(1023, 700, 80, 80);
    fill(0);

    textSize(70);
    text("c", 907, 765);
    text(".", 1063, 765);
    textSize(40);
    fill(0);
   
    if (player1.extra){ 
      rect(867, 700, 80, 80);
    }
    
    if (player2.extra){
      rect(1023, 700, 80, 80);
    }

    //体力の表示　いるかいらないかの検討をしたい
    calcdamage.DrawHeart(71, 50, player1.lifepoint);
    calcdamage.DrawHeart(1130, 50, player2.lifepoint);
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
      }else if (key == 'z' && (! player1.extra)){
        player1.NextAction = new CounterAction();
      }else if (key == 'm' && (! player2.extra)) {
        player2.NextAction = new CounterAction();
      }else if (key == '.' && (! player2.extra)) {
        player2.NextAction = new DrainAction();
      }else if (key == 'c' && (! player1.extra)){
        player1.NextAction = new DrainAction();
      }else if (key == 'x' && (! player1.extra)){
        player1.NextAction = new DragonRageAction();
      }else if (key == ',' && (! player2.extra)){
        player2.NextAction = new DragonRageAction();
      } else {
        fill(0);
        text("invalid key", width/2, height - 100);
      }
    }
  }


  void Attack() {
    fill(255, 0, 0);
    quad(20, 40, 386, 40, 406, 200, 40, 200);
    textFont(Englishfont);
    fill(255);
    text("Attack", 213, 140);
  }
  void Diffence() {

    fill(0, 0, 255);
    quad(406, 40, 772, 40, 792, 200, 426, 200);
    textFont(Englishfont);
    fill(255);
    text("Deffence", 599, 140);
  }
  void Heal() {

    fill(0, 255, 0);
    quad(792, 40, 1158, 40, 1178, 200, 812, 200);
    textFont(Englishfont);
    fill(255);
    text("Heal", 985, 140);
  }
  void Kaunter() {
    fill(255, 0, 0);
    quad(20, 420, 386, 420, 406, 580, 40, 580);
    textFont(Japanfont);
    fill(255);
    text("カウンター", 213, 520);
  }
  void Dragon() {
    fill(0, 0, 255);
    quad(406, 420, 772, 420, 792, 580, 426, 580);
    textFont(Japanfont);
    fill(255);
    text("りゅうのいかり", 599, 520);
  }
  void Drain() {
    fill(0, 255, 0);
    quad(792, 420, 1158, 420, 1178, 580, 812, 580);
    textFont(Japanfont);
    fill(255);
    text("ドレイン", 985, 520);
  }
}
