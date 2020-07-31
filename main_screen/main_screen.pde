//calcDamageのアニメーションどうしよう
// これは多分全体で共有した方がいいかも？
PImage img_player1;
PImage img_player2;
PFont Japanfont, Englishfont;
PImage action;


class Player {
  Player enemy;
  int lifepoint = 10;
  ActionCommand NextAction = null;
  ActionCommand getAction() {
    return NextAction;
  }
  void printA() {
    println("A");
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
}
class DeffenceAction extends ActionCommand {
  String name = "DeffenceAction";
  int priority = 30;
  void Action(Player player) {
  }
  String getName() {
    return "DeffenceAction";
  }
}
class HealAction extends ActionCommand {
  int healpoint = int(random(3)) + 2;
  int priority = 50;
  
  public String name = "HealAction";
  void Action(Player player) {
    action = loadImage("heal.png");
    player.lifepoint += healpoint;
    image(action, width/2, height*3/4, 300, 300);
    delay(10000);
  }
  String getName() {
    return "HealAction";
  }
}
class CalcDamage {
  boolean calc_finished = false;
  void display() {
    img_player1 = loadImage("player1.png");
    img_player2 = loadImage("player2.png");
    DrawCharactor(width/6, 500, img_player1);
    DrawCharactor(width*2/3, 500, img_player2);
    DrawHeart(71, 50, player1.lifepoint);
    DrawLifePoint(70, 100, player1.lifepoint, 1);
    DrawHeart(1360, 50, player2.lifepoint);
    DrawLifePoint(750, 100, player2.lifepoint, 2);
    fill(0);
    text(player1.NextAction.getName(), width/4, height * 3/4);
    text(player2.NextAction.getName(), width * 3/4, height * 3/4);
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
  //残りライフバーを表示する（player１は左、player２は右から表示する）git
  void DrawLifePoint(int x, int y, int life, int player) {
    int rectX = x + 10;
    int rectY = y + 10;
    int life2 = 0;
    fill(255);
    ;
    rect(x, y, 610, 150);
    stroke(0);
    if (life >= 10) {
      life2 = life % 10;
      life = 10;
    }
    if (player == 1) {
      fill(0, 255, 0);
      for (int i = 0; i < life; i++) {
        rect(rectX + 60 * i, rectY, 50, 130);
      }
      fill(255, 0, 150);
      for (int i = 0; i < life2; i++) {
        rect(rectX + 60 * i, rectY, 50, 130);
      }
    }
    if (player == 2) {
      rectX += 540;
      fill(0, 255, 0);
      for (int i = 0; i < life; i++) {
        rect(rectX - 60 * i, rectY, 50, 130);
      }
      fill(255, 0, 150);
      for (int i = 0; i < life2; i++) {
        rect(rectX - 60 * i, rectY, 50, 130);
      }
    }
  }
  void DrawCharactor(int x, int y, PImage img) {
    /*ellipse(x, y, 50,50);
     rect(x-20,y+30,40,60);
     line(x-10,y + 50,x-10,y + 100);
     line(x+10,y + 50,x+10,y + 100);
     */
    image(img, x, y-100, 300, 300);
    
      
  }
  void DrawLifePoint() {
  }
  void update() {
    fill(0);
    calc();
    text("next turn to press h", width/2, height/2);
    if (keyPressed && key == 'h') {
      Gameflow = "main";
      player1.NextAction = null;
      player2.NextAction = null;
      calc_finished = false;
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
// これは多分全体で共有した方がいいかも？
class MainScreen {
  void display() {
    update();
    //attack
    textSize(30);
    fill(255);
    square(100, 100, 200);
    fill(0);
    text("Attack", 110, 150);
    text("a", 110, 350);
    text("j", 250, 350);

    //deffence
    fill(255);
    square(500, 100, 200);
    fill(0);
    text("diffence", 510, 150);
    text("s", 510, 350);
    text("k", 650, 350);

    //heal
    fill(255);
    square(900, 100, 200);
    fill(0);
    text("Heal", 910, 150);
    text("d", 910, 350);
    text("l", 1050, 350);
  }
  void update() {
    if (player1.NextAction != null && player2.NextAction != null) {
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


class Result {
  
  void display() {
    player1.lifepoint = 4;
    if (player1.lifepoint == 0 || player2.lifepoint == 0) {
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
    /*if (keyPressed){
      if(key == 'b'){
        Gameflow = Start;
      }
    }*/
  }




  void print_ko(int player1, int player2) {
    fill(255, 0, 0);
    textSize(300);
    text("KO!", width/2, height/2-60);
    textSize(200);
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);    //英語
    Japanfont = createFont("Meiryo", 100);  //日本語 
    if (player1 > player2) {
      text("player1 WIN", width/2, height/2+100);
    } else {
      text("player2 WIN", width/2, height/2+100);
    }
  }


  void print_judge(int player1, int player2) {
    fill(255, 0, 0);
    textSize(100);
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);    //英語
    Japanfont = createFont("Meiryo", 100);  //日本語 
    String s = player1 + "-" + player2;
    text(s, width/2, height/2-60);
    textSize(200);

    if (player1 > player2) {
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



MainScreen main = new MainScreen();
CalcDamage calcdamage = new CalcDamage();
Result result = new Result();
Player player1 = new Player();
Player player2 = new Player();
String Gameflow = "result";
void setup() {
  size(1200, 800);
}
void draw() {
  background(255);
  if (Gameflow == "main") {
    main.display();
  } else if (Gameflow == "calc_damage") {
    calcdamage.display();
  }else if (Gameflow == "result"){
    result.display();
  }
}
