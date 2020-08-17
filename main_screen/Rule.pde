class Rule extends Screen{
  private PFont Englishfont;
  private PFont Japanesefont; 
  PImage scene1;
  PImage scene2;
  PImage scene3; 
  private int now = 1;
  
  void display() {
    scene1 = loadImage("scene1.PNG"); 
    scene2 = loadImage("scene2.PNG"); 
    scene3 = loadImage("scene3.PNG"); 
    Englishfont = createFont("Arial", 70);//英語
    Japanesefont = createFont("Meiryo", 100);//日本語
    textAlign( CENTER );  //ことばの真ん中に設定
    background(255);
    
    command(); //　ルールの説明以外のコマンド
    
    if (keyPressed) {
      //print(count);
      keyPressed();
    } 
    
    textAlign( LEFT );  //ことばの真ん中に設定
    if (now==1) {    //一枚目　ルール　勝利条件　操作方法
    textAlign( CENTER );  //ことばの真ん中に設定
      Slide1();
    } else if (now == 2) {    //二枚目　対戦画面の画像などを用いて　⇒などで説明をする　しんぷるなほう
      Slide2();
    }else if (now == 3) {    //二枚目　対戦画面の画像などを用いて　⇒などで説明をする　しんぷるなほう
      Slide3();
    } else if (now == 4) {    //三枚目　二枚目と同じ　エクストラカードの説明など　　基本全部画像などで処理
      Slide4();
    } else if (now == 5) {    //三枚目　二枚目と同じ　エクストラカードの説明など　　基本全部画像などで処理
      Slide5();
    } else {    
      now=1;
      Gameflow.setScreen(new start());
    }
    delay(10);
  }
  
  void keyPressed() {
    if ((keyPressed == true) && (key == 'a') && now!=1 ) {
      now-=1;
    }
    if ((keyPressed == true) && (key == 'j')&& now!=5 ) {
      now+=1;
    }
    if ((keyPressed == true) && (key == 'm')) {
      now=0;
    }
  }
  
  void command(){
    textFont(Japanesefont); //今は日本語のフォントを使う
    fill(0);
    textSize(100);
    text("ルール", width/2, height/4-30);
    strokeWeight(3);
    textSize(100);
    textFont(Englishfont);
    fill(255);
    rect(0, height/8, width/4-2, height/8);   //左上のタイトルへの四角
    rect(width*3/4, 0, width/4-2, height/8);  //右上の→の四角
    rect(0, 0, width/4-2, height/8);
    textFont(Japanesefont);
    fill(0);  
    textSize(40);
    text("mでタイトルへ", width*1/8, height*3/16+20);

    text("jを長押し⇨", width*7/8, height/12+5);
    text("⇦aを長押し", width*1/8, height/12+5);  
  }
  
  void  Slide1() { 
    text("1/5", width-100, height-5);
    text("どんな風に遊ぶゲーム？", width/2, height/4+60);
    textSize(60);
    text("二人プレイの5ターン制カードゲーム", width/2, height/4+60+(540/7*1));
    textSize(40);
    text("勝利条件", width/2, height/4+60+(540/7*3));
    textSize(60);
    text("相手の体力を0以下にする", width/2, height/4+60+(540/7*4));
    text("5ターン経過後、相手より体力が多い", width/2, height/4+60+(540/7*5));
    
  }
  void  Slide2() { 
    image(scene1, 10, height/4+100, width/2, height/2);
    text("2/5", width-100, height-5);
    
    textAlign( CENTER );  //ことばの真ん中に設定
    
    text("ノーマルアクション（∞）", width/2, height/4+60);
    textAlign( LEFT );  //ことばの真ん中に設定
    text("3～7のダメージ", width/5*3, height/4+60+(540/7*2));
    text("ダメージ無効＆1回復", width/5*3, height/4+60+(540/7*4));
    text("3～5回復", width/5*3, height/4+60+(540/7*6));
    fill(255,0,0);
    text("Attack", width/4*2+20, height/4+60+(540/7*1));
    fill(0,0,255);
    text("Deffence", width/4*2+20, height/4+60+(540/7*3));
    fill(0,255,0);
    text("Heal", width/4*2+20, height/4+60+(540/7*5));
  }
  void  Slide3() { 
    
    image(scene1, 10, height/4+100, width/2, height/2);
    text("3/5", width-100, height-5);
    textAlign( CENTER );  //ことばの真ん中に設定
    text("エクストラアクション（1度のみ）", width/2, height/4+60);
    textAlign( LEFT );  //ことばの真ん中に設定
    
    textSize(30);
    text("相手のAttack使用時、", width/5*3, height/4+60+(540/14*3)+15);
    text("Attaack無効＆3～7ダメージ", width/5*3, height/4+60+(540/14*4)+15);
    text("相手のDeffence使用時、", width/5*3, height/4+60+(540/14*7)+15);
    text("Deffence無効＆固定4ダメージ", width/5*3, height/4+60+(540/14*8)+15);
    text("相手のHeal使用時、", width/5*3, height/4+60+(540/14*11)+15);
    text("Heal無効＆相手の回復分回復", width/5*3, height/4+60+(540/14*12)+15);
    fill(255,0,0);
    textSize(40);
    text("カウンター", width/4*2+20, height/4+60+(540/7*1));
    fill(0,0,255);
    text("りゅうのいかり", width/4*2+20, height/4+60+(540/7*3));
    fill(0,255,0);
    text("ドレイン", width/4*2+20, height/4+60+(540/7*5));
  }
  void  Slide4() { 
    image(scene2, 10, height/4+100, width/2, height/2);
    text("4/5", width-100, height-5);
    textAlign( CENTER );  //ことばの真ん中に設定
    text("アクション結果", width/2, height/4+60);
    textAlign( LEFT );  //ことばの真ん中に設定
    
    text("お互いの現在のHP", width/5*3, height/4+60+(540/7*2));
    text("次のターンへ推移", width/5*3, height/4+60+(540/7*4));
    text("何を選択したかの確認", width/5*3, height/4+60+(540/7*6));
    //fill(255,0,0);
    text("⇦HP", width/4*2+20, height/4+60+(540/7*1));
    //fill(0,0,255);
    text("⇦NEXTボタン", width/4*2+20, height/4+60+(540/7*3));
    //fill(0,255,0);
    text("⇦使用アクション", width/4*2+20, height/4+60+(540/7*5));
    
    //写真を入れる
  }
  
  void Slide5(){  
    image(scene3, 10, height/4+100, width/2, height/2);
    text("5/5", width-100, height-5);
    
    textAlign( CENTER );  //ことばの真ん中に設定
    text("勝敗確認", width/2, height/4+60);
    textAlign( LEFT );  //ことばの真ん中に設定
    
    text("勝利条件を満たしたら", width/5*3-30, height/4+60+(540/7*2));
    text("ゲーム終了", width/5*3+30, height/4+60+(540/7*3));
    
    //写真を入れる
  }
}
