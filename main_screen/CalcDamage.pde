class CalcDamage extends Screen {
  boolean calc_finished = false;

  void display() {
    calc();
    DrawCharactor(100, 520);
    DrawCharactor(1100, 520);
    //delay(2000);
    fill(0);
    text(str(Gameflow.turn + 1) + "ターン目", width/2, 100);
    DrawActtion1( player1.NextAction.getName());
    DrawActtion2( player2.NextAction.getName());
    //delay(2000);
    DrawHeart(71, 50, player1.lifepoint);
    DrawLifePoint(70, 100, player1.lifepoint, 1);
    DrawHeart(1130, 50, player2.lifepoint);
    DrawLifePoint(620, 100, player2.lifepoint, 2);
    update();
  }
  //指定した位置にハートとライフを表示する
  void DrawHeart(int X, int Y, int life) {
    int R = 3;
    float x;
    float y;
    fill(255);
    strokeWeight(2);
    stroke(0);
    stroke(200, 0, 0);
    strokeJoin(ROUND); //線のつなぎ目について設定

    pushMatrix();
    translate(X, Y);

    beginShape();
    for (int theta = 0; theta < 360; theta++) {
      x = R * (16 * sin(radians(theta)) * sin(radians(theta)) * sin(radians(theta)));
      y = (-1) * R * (13 * cos(radians(theta)) - 5 * cos(radians(2 * theta)) 
        - 2 * cos(radians(3 * theta)) - cos(radians(4 * theta)));

      vertex(x, y);
    }
    endShape(CLOSE);

    popMatrix();
    fill(0);
    if (life < 10) {
      text(life, X-2, Y+18);
    } else {
      text(life, X-2, Y+18);
    }
  }
  //残りライフバーを表示する（player１は左、player２は右から表示する)
  void DrawLifePoint(int x, int y, int life, int player) {
    int rectX = x + 8;
    int rectY = y + 8;
    int life2 = 0;
    int life3 = 0;
    fill(255);
    rect(x, y, 510, 130);
    stroke(0);
    
    if (life >= 20) {
      life3 = life % 10;
      life = 10;
      life2 = 10;
    } else if(life >= 10){
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
      fill(255, 153, 0);
      for (int i = 0; i < life3; i++) {
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
      fill(255, 153, 0);
      for (int i = 0; i < life3; i++) {
        rect(rectX - 50 * i, rectY, 44, 114);
      }
    }
  }
  void DrawCharactor(int x, int y ) {
    fill(0);
    ellipse(x, y, 50, 50);
    rect(x-20, y+30, 40, 60);
    line(x-10, y + 50, x-10, y + 100);
    line(x+10, y + 50, x+10, y + 100);
  }
  void update() {
    fill(0);
    text("next turn to press h", width/2, height/2);
    if (keyPressed && key == 'h') {
      delay(50);
      Gameflow.setScreen(new MainScreen());
      player1.NextAction = null;
      player2.NextAction = null;
      calc_finished = false;
      Gameflow.turn += 1;
    }
    if ( player1.lifepoint <= 0 || player2.lifepoint <= 0) {
      delay(50);
      player1.NextAction = null;
      player2.NextAction = null;
      Gameflow.setScreen(new Result());
    }
    if ( player1.lifepoint <= 0 || player2.lifepoint <= 0) {
      Gameflow.setScreen(new Result());
    } else if (Gameflow.turn >= 3) {
      delay(50);
      Gameflow.setScreen(new ResultMove());
    }
  }
  void calc() {
    if (! calc_finished) {
      calc_finished = true;     
      player1.action();
      player2.action();
    }
  }
  void DrawActtion1(String action) {
    fill(0);
    int x=300;
    int y=400;
    int z=200;
    String HealorDamage="A";
    PImage imgA1, imgD1, imgH;
    color c1=color(255, 255, 255); 
    String s="NULL";
    imgA1 = loadImage("atack1.PNG");
    imgD1 = loadImage("sild.PNG");
    imgH = loadImage("heal2.PNG");
    strokeWeight(5);
    stroke(0, 0, 0);
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);//英語
    Japanfont = createFont("Meiryo", 50);//日本語
    if (action=="AttackAction") {
      image(imgA1, x, y, z, z);
      c1=color(255, 0, 0);
      s="Attack";
    }
    if (action=="DeffenceAction") {
      image(imgD1, x, y, z, z);
      c1=color(0, 0, 255);
      s="Diffence";
      HealorDamage="D";
    }
    if (action=="HealAction") {
      image(imgH, x, y, z, z);
      c1=color(0, 255, 0);
      s="Heal";
      HealorDamage="H";
    }
    if (action=="Counter Command") {
      image(imgA1, x, y, z, z);
      c1=color(255, 0, 0);
      s="カウンター";
    }
    if (action=="DragonRage Command") {
      image(imgA1, x, y, z, z);
      c1=color(0, 0, 255);
      s="りゅうのいかり";
    }
    if (action=="Drain Command") {
      image(imgH, x, y, z, z);
      c1=color(0, 255, 0);
      s="ドレイン";
    }
    fill(c1);
    quad(40, 620, 406, 620, 386, 780, 20, 780);
    textFont(Japanfont);
    fill(255);
    text(s, 213, 720);
    fill(0);
    if (HealorDamage=="A") { //AならAttack系 Hなら回復　 防御の時０が返されるからその時は例外処理になってる。
      text(player1.NextAction.getPoint()+"ダメージ", 300, height /2  + 50);
    } else if (HealorDamage=="H") {
      text(player1.NextAction.getPoint()+"回復", 300, height /2  + 50);
    } else {
      text("1回復", 300, height /2  + 50);
    }

  }

  void DrawActtion2(String action) { 
    int x=700;
    int y=400;
    int z=200;
    color c1=color(255, 0, 0); 
    String s="NULL"; 
    String HealorDamage="A";
    PImage  imgA2, imgD2, imgH;
    imgA2 = loadImage("atack2.png");
    imgD2 = loadImage("sild2.png");
    imgH = loadImage("heal2.PNG");
    strokeWeight(5);
    stroke(0, 0, 0);
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);//英語
    Japanfont = createFont("Meiryo", 50);//日本語
    strokeWeight(5);
    stroke(0, 0, 0);
    if (action=="AttackAction") {
      image(imgA2, x, y, z, z);
      c1=color(255, 0, 0);
      s="Attack";
    }
    if (action=="DeffenceAction") {
      image(imgD2, x, y, z, z);
      c1=color(0, 0, 255);
      s="Diffence";
      HealorDamage="D";
    }
    if (action=="HealAction") {
      image(imgH, x, y, z, z);
      c1=color(0, 255, 0);
      s="Heal";
      HealorDamage="H";
    }
    if (action=="Counter Command") {
      image(imgA2, x, y, z, z);
      c1=color(255, 0, 0);
      s="カウンター";
    }
    if (action=="DragonRage Command") {
      image(imgA2, x, y, z, z);
      c1=color(0, 0, 255);
      s="りゅうのいかり";
    }
    if (action=="Drain Command") {
      image(imgH, x, y, z, z);
      c1=color(0, 255, 0);
      s="ドレイン";
      HealorDamage="H";
    }

    fill(c1);
    quad(792, 620, 1158, 620, 1178, 780, 812, 780);
    textFont(Japanfont);
    fill(255);
    text(s, 985, 720);
    
    fill(0);
    if (HealorDamage=="A") { //AならAttack系 Hなら回復　 防御の時０が返されるからその時は例外処理になってる。
      text(player2.NextAction.getPoint()+"ダメージ", 900, height /2  + 50);
    } else if (HealorDamage=="H") {
      text(player2.NextAction.getPoint()+"回復", 900, height /2  + 50);
    } else {
      text("1回復", 900, height /2  + 50);
    }



    strokeWeight(1);
    stroke(0, 0, 0);
    textSize(40);
  }
}
