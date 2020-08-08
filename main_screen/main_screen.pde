class Result {
  void display() {
    player1.lifepoint = 4;
    if (player1.lifepoint <=0 || player2.lifepoint <= 0) {
      print_ko(player1.lifepoint, player2.lifepoint);
    } else if (player1.lifepoint == player2.lifepoint) {
      print_draw(player1.lifepoint, player2.lifepoint);
    } else {
      print_judge(player1.lifepoint, player2.lifepoint);
    }
    fill(255, 0, 0);
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);    //英語
    Japanfont = createFont("Meiryo", 100);  //日本語 
    rect(width/2-113, height/2+182, 20, 20);
    fill(0);
    textSize(20);

    text("b press to back home ", width/2, height/2+height/4) ;
    if (keyPressed) {
      if (key == 'b') {
        delay(50);
        Gameflow = "start";
        player1.lifepoint = 10;
        player2.lifepoint = 10;
        
      }
    }
  }
  void print_ko(int player1Life, int player2Life) {
    fill(255, 0, 0);
    textSize(300);
    text("KO!", width/2, height/2-60);
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
    } else {
      text("player2 WIN", width/2, height/2+100);
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
}
class start {
  private PFont Englishfont;
  private PFont Japanesefont; 
  private boolean player1Ready = false, player2Ready = false;
  String GameFlow = "start";

  private void display() {
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
    text("スペース　でルール説明", width*7/8-80, height/12);
    text("a  を押して準備完了", width/4, height*3/4+80);
    text("j  を押して準備完了", width*3/4, height*3/4+80);

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
      Gameflow = "main";
      
      player1Ready = false;
      player2Ready = false;
    }
  }


  private void keyPressed() {
    if (key == 'a') {//キーボードでaを入力をしたら実行される
      player1Ready = true;
    }
    if (key == 'j') {//キーボードでjを入力をしたら実行される
      player2Ready = true;
    }
    if (key == 'b') {//キーボードでスペースを入力したら実行される
      delay(50);
      Gameflow = "rule";
      
    }
  }
}



class Rule {
  private PFont Englishfont;
  private PFont Japanesefont; 
  //private PImage img = loadImage("photo.jpg"); 画像持ってくるときに使う
  private int now = 1;
  private int count=0;
  void display() {

    Englishfont = createFont("Arial", 70);//英語
    Japanesefont = createFont("Meiryo", 100);//日本語

    textAlign( CENTER );  //ことばの真ん中に設定
    background(255);
    textFont(Japanesefont); //今は日本語のフォントを使う
    fill(0);
    textSize(100);
    text("ルール", width/2, height/4-30);

    strokeWeight(3);

    textSize(100);
    textFont(Englishfont);
    fill(255);

    rect(0, height/8, width/4-2, height/8);   //左上のタイトルへの四角
    if (now==1) {
      RectStep(width*3/4, 0, width/4-2, height/8);
      rect(width*3/4, 0, width/4-2, height/8);  //右上の→の四角
    } else if (now==2) {
      RectStep(width*3/4, 0, width/4-2, height/8);

      RectStep(0, 0, width/4-2, height/8);
    } else if (now==3) {
      RectStep(0, 0, width/4-2, height/8); //左上の←の四角
    }

    textFont(Japanesefont);
    fill(0);  
    textSize(40);
    text("mでタイトルへ", width*1/8, height*3/16+20);


    if (keyPressed) {
      //print(count);
      keyPressed(count);
      count+=1;
    } 

    if (now==1) {    //一枚目　ルール　勝利条件　操作方法
      text("jを長押し⇨", width*7/8, height/12+5);
      text("1/3", width-100, height-5);

      Slide1();
    } else if (now == 2) {              //二枚目　対戦画面の画像などを用いて　⇒などで説明をする　しんぷるなほう

      text("jを長押し⇨", width*7/8, height/12+5);
      text("⇦aを長押し", width*1/8, height/12+5);   
      text("2/3", width-100, height-5);
      Slide2();
    } else if (now == 3) {              //三枚目　二枚目と同じ　エクストラカードの説明など　　基本全部画像などで処理

      text("⇦aを長押し", width*1/8, height/12+5);
      text("3/3", width-100, height-5);
      Slide3();
    } else {
      delay(50);
      Gameflow="start";
      now = 0;
      
    }
  }

  void RectStep(int x1, int y1, int x2, int y2) {
    rect(x1, y1, x2, y2);
  }
  void  Slide1() {
    //text("");
  }
  void  Slide2() {
    //  print("ZXCVBN");
  }
  void  Slide3() {
    //  print("WERTYU");
  }
  void keyPressed(int count) {
    if ((keyPressed == true) && (key == 'a') && now!=1 && count%15==0) {
      now-=1;
    }
    if ((keyPressed == true) && (key == 'j')&& now!=3 && count%15==0) {
      now+=1;
    }
    if ((keyPressed == true) && (key == 'm')) {
      now=0;
    }
  }
}


class Player {
  Player enemy = null;
  int lifepoint = 10;
  ActionCommand NextAction = null;
  ActionCommand getAction() {
    return NextAction;
  }
  void setenemy(Player e) {
    enemy = e;
  }
  void action() {
    NextAction.Action(this);
  }
}

abstract class ActionCommand {
  int priority;
  String name;
  abstract void Action(Player player); // 選択したときにおこる行動を指定。
  abstract String getName();
  int getPriority() {
    return priority;
  }
  abstract int getPoint();
}
class AttackAction extends ActionCommand {
  int AttackPoint = int(random(3)) + 4;
  int priority = 10;
  String getName() {
    return "AttackAction";
  }
  void Action(Player player) {
    player.enemy.lifepoint -= AttackPoint;
  }
  int getPoint() {
    return AttackPoint;
  }
}
class DeffenceAction extends ActionCommand {
  String name = "DeffenceAction";
  int priority = 30;
  void Action(Player player) {
    if (player.enemy.NextAction.getName() == "AttackAction") {
      println(player.lifepoint);
      player.lifepoint += player.enemy.NextAction.getPoint();
      println(player.lifepoint);
    }
    player.lifepoint += 1;
  }
  String getName() {
    return "DeffenceAction";
  }
  int getPoint() {
    return -1;
  }
}
class HealAction extends ActionCommand {
  int HealPoint = int(random(3)) + 2;
  int priority = 50;
  public String name = "HealAction";
  void Action(Player player) {
    player.lifepoint += HealPoint;
  }
  String getName() {
    return "HealAction";
  }
  int getPoint() {
    return HealPoint;
  }
}
class CalcDamage {
  boolean calc_finished = false;
  void display() {
    calc();
    DrawCharactor(200, 500);
    DrawCharactor(1000, 500);
    DrawHeart(71, 50, player1.lifepoint);
    DrawLifePoint(70, 100, player1.lifepoint, 1);
    DrawHeart(1130, 50, player2.lifepoint);
    DrawLifePoint(620, 100, player2.lifepoint, 2);
    fill(0);
    text(player1.NextAction.getName(), width/4, height * 3/4);
    text(player1.NextAction.getPoint(), width/4, height * 3 / 4 + 50);
    text(player2.NextAction.getName(), width * 3/4, height * 3/4);
    text(player2.NextAction.getPoint(), width * 3/4, height * 3 / 4 + 50);
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
      text(life, X-9, Y+16);
    } else {
      text(life, X-18, Y+16);
    }
  }
  //残りライフバーを表示する（player１は左、player２は右から表示する)
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
  void DrawCharactor(int x, int y ) {
    ellipse(x, y, 50, 50);
    rect(x-20, y+30, 40, 60);
    line(x-10, y + 50, x-10, y + 100);
    line(x+10, y + 50, x+10, y + 100);
  }
  void update() {
    
    text("next turn to press h", width/2, height/2);
    if (keyPressed && key == 'h') {
      delay(50);
      Gameflow = "main";
      player1.NextAction = null;
      player2.NextAction = null;
      calc_finished = false;
    }
    if ( player1.lifepoint <= 0 || player2.lifepoint <= 0) {
      delay(50);
      Gameflow = "result";
    }
  }
  void calc() {
    if (! calc_finished) {
      calc_finished = true;
      player1.action();
      player2.action();
    }
  }
}

class MainScreen {
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
    text("3 ~ 7 ダメージ", 213, 270);
    fill(255);
    rect(95, 305, 80, 80);
    rect(251, 305, 80, 80);
    fill(0);
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
    text("攻撃無効化、1回復", 599, 270);
    fill(255);
    rect(481, 305, 80, 80);
    rect(637, 305, 80, 80);
    fill(0);
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
    fill(0);
    text("2 ~ 4 回復", 985, 270);
    fill(255);
    rect(867, 305, 80, 80);
    rect(1023, 305, 80, 80);
    fill(0);
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
      Gameflow = "calc_damage";
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
      } else {
        fill(0);
        text("invalid key", width/2, height - 100);
      }
    }
  }
}
start s = new start();
MainScreen main = new MainScreen();
Rule rule = new Rule();
CalcDamage calcdamage = new CalcDamage();
Player player1 = new Player();
Player player2 = new Player();
Result result = new Result();
//PImage img_player1;
//PImage img_player2;
PFont Japanfont, Englishfont;
//PImage action;
String Gameflow = "start";
void setup() {
  size(1200, 800);
  player1.setenemy(player2);
  player2.setenemy(player1);
}
void draw() {
  background(255);
  if (Gameflow == "start") {
    s.display();
  } else  if (Gameflow == "rule") {
    rule.display();
  } else if (Gameflow == "main") {
    main.display();
  } else if (Gameflow == "calc_damage") {
    calcdamage.display();
  } else if (Gameflow == "result") {
    result.display();
  }
}
