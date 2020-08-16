class start extends Screen{
  private PFont Englishfont;
  private PFont Japanesefont; 
  private boolean player1Ready = false, player2Ready = false;
  String GameFlow = "start";
  color c1=0;


  void display() {
    background(255);
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);//英語
    Japanesefont = createFont("Meiryo", 100);//日本語

    textFont(Japanesefont);
    fill(0);
    textSize(100);
    text("ゲームタイトル", width/2, height/4+30);

    fill(255);
    strokeWeight(3);
    rect(width/16+25, height*3/4+42, 50, 50);
    rect(width*9/16+25, height*3/4+42, 50, 50);
    rect(width*5/8-19, 15, 200, 70);

    textSize(40);
    fill(0);

    text("r　でルール説明", width*7/8-80, height/12);
    text("q  を押して準備完了", width/4, height*3/4+80);
    text("u  を押して準備完了", width*3/4, height*3/4+80);

    textFont(Englishfont); 
    textSize(70);
    text("player1", width/4, height/2);
    text("player2", width*3/4, height/2);

    if (keyPressed) {
      keyPressed();
    }

    textSize(100);
    if (player1Ready) {
      fill(255, 0, 0);
      text("OK", width/4, height*3/4-40);
    } else {
      fill(0, 0, 255);
      text("wait", width/4, height*3/4-40);
    }
    if (player2Ready) {
      fill(255, 0, 0);
      text("OK", width*3/4, height*3/4-50);
    } else {
      fill(0, 0, 255);
      text("wait", width*3/4, height*3/4-50);
    }

    if (player1Ready && player2Ready) {
      delay(50);
      Gameflow.setScreen(new MainScreen());
      player1Ready = false;
      player2Ready = false;
    }
  }


  private void keyPressed() {
    if (key == 'q') {//キーボードでaを入力をしたら実行される
      player1Ready = true;
    }
    if (key == 'u') {//キーボードでjを入力をしたら実行される
      player2Ready = true;
    }
    if (key == 'r') {//キーボードでスペースを入力したら実行される
      delay(50);
      Gameflow.setScreen(new Rule());
    }
  }
}
