class Result extends Screen {
  int ko=0;
  void display() {

    if (player1.lifepoint <=0 || player2.lifepoint <= 0) {

      print_ko(player1.lifepoint, player2.lifepoint);
      if (ko==0) {
        player.play();  //再生
        player.rewind();  //再生が終わったら巻き戻しておく
      }
      ko+=1;
    } else if (player1.lifepoint == player2.lifepoint) {
      DrawLifePoint(70, 100, player1.lifepoint, 1);
      DrawLifePoint(620, 100, player2.lifepoint, 2);
      print_draw(player1.lifepoint, player2.lifepoint);
    } else {
      DrawLifePoint(70, 100, player1.lifepoint, 1);
      DrawLifePoint(620, 100, player2.lifepoint, 2);
      print_judge(player1.lifepoint, player2.lifepoint);
    } 
    fill(255, 0, 0);
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);    //英語
    Japanfont = createFont("Meiryo", 100);  //日本語 
    rect(width/2-113, height/2+182, 20, 20);
    if (player1.lifepoint <=0 || player2.lifepoint <= 0) {
      fill(255);
    } else {
      fill(0);
    }
    textSize(20);
    text("b press to back home ", width/2, height/2+height/4) ;
    if (keyPressed) {
      if (key == 'b') {
        ko=0;
        Gameflow = new GameFlow();
        Gameflow.setScreen(new start());
        player1 = new Player();
        player2 = new Player();
        player1.setenemy(player2);
        player2.setenemy(player1);
        delay(50);
      }
    }
  }


  void print_ko(int player1Life, int player2Life) {
    PImage imgK, imgO, imgKO2;
    imgK = loadImage("K.png");
    imgO = loadImage("O.png");
    imgKO2 = loadImage("KO2.png");
    if (frameCount /3  % 3 == 0) { // frameCount % 2 == 0 だと速すぎ
      image(imgK, 0, 0, width, height);
      fill(255, 0, 0);
      textSize(50);
      text("KO!", width /4, height/2 - 60);
    } else if (frameCount /3 % 3 ==1) {
      image(imgKO2, 0, 0, width, height);
      fill(255, 0, 0);
      textSize(150);
      text("KO!", width* 2/5, height/2 - 60);
    } else {
      image(imgO, 0, 0, width, height);
      fill(255, 0, 0);
      textSize(300);
      text("KO!", width/2, height/2-60);
    }
    drawstar();
    drawstar();

    fill(255, 0, 0);
    textSize(200);
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);    //英語
    Japanfont = createFont("Meiryo", 100);  //日本語 
    if (player1Life > player2Life) {
      text("player1 WIN", width/2, height/2+100);
    } else {
      text("player2 WIN", width/2, height/2+100);
    }
  }


  void print_judge(int player1Life, int player2Life) {
    fill(255, 0, 0);
    textSize(100);
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);    //英語
    Japanfont = createFont("Meiryo", 100);  //日本語 
    String s = player1Life + "-" + player2Life;
    text(s, width/2, height/2-60);
    textSize(200);

    if (player1Life > player2Life) {
      text("player1 WIN", width/2, height/2+100);
      DrawCharactor(200, 700);
      DrawCharactor(1000, 700);
      line(980, 730, 970, 760);
      line(1020, 730, 1030, 760);
      if (frameCount / 20 % 2 == 0) { // frameCount % 2 == 0 だと速すぎ
        line(180, 730, 170, 760);
        line(220, 730, 230, 760);
      } else {
        line(180, 730, 170, 700);
        line(220, 730, 230, 700);
      }
    } else {
      text("player2 WIN", width/2, height/2+100);
      DrawCharactor(200, 700);
      DrawCharactor(1000, 700);
      line(180, 730, 170, 760);
      line(220, 730, 230, 760);
      if (frameCount / 20 % 2 == 0) { // frameCount % 2 == 0 だと速すぎ
        line(980, 730, 970, 760);
        line(1020, 730, 1030, 760);
      } else {
        line(980, 730, 970, 700);
        line(1020, 730, 1030, 700);
      }
    }
  }
  void print_draw(int player1, int player2) {
    fill(255, 0, 0);
    textSize(100);
    Englishfont = createFont("Arial", 70);    //英語
    Japanfont = createFont("Meiryo", 100);  //日本語 
    textAlign( CENTER ); //中央揃え
    String s = player1 + "-" + player2;
    text(s, width/2, height/2-60);
    textSize(200);
    text("Draw", width/2, height/2+100);
  }

  void DrawCharactor(int x, int y ) {
    fill(0);
    ellipse(x, y, 50, 50);
    rect(x-20, y+30, 40, 60);
    line(x-10, y + 50, x-10, y + 100);
    line(x+10, y + 50, x+10, y + 100);
  }
  void drawstar() {
    float delta = TWO_PI /100;
    float A = 30;

    fill(255, 255, 0);
    stroke(0);
    strokeWeight(2);
    beginShape();
    for (int j = 0; j < 10; j++) {
      float i = random(width);
      float m = random(height);
      for (float t = 0; t < TWO_PI; t += delta) {
        vertex((width - i)+ A * pow(cos(t), 3), (height - m) + A * 1.4 * pow(sin(t), 3));
      }
      endShape(CLOSE);
      delay(3);
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
