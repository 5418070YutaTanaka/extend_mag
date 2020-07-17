//calcDamageのアニメーションどうしよう
// これは多分全体で共有した方がいいかも？
class Player {
  Player enemy = null;
  int lifepoint = 10;
  ActionCommand NextAction = null;
  ActionCommand getAction(){
    return NextAction;
  }
  void setenemy(Player e){
    enemy = e;
  }
  void action(){
    NextAction.Action(this);
  }
}

abstract class ActionCommand {
  int priority;
  String name;
  abstract void Action(Player player); // 選択したときにおこる行動を指定。
  abstract String getName();
  int getPriority(){
    return priority;
  }
  abstract int getPoint();
  
}
class AttackAction extends ActionCommand {
  int AttackPoint = int(random(3)) + 4;
  int priority = 10;
  String getName(){
    return "AttackAction";
  }
  void Action(Player player){
    player.enemy.lifepoint -= AttackPoint;
  }
  int getPoint(){
    return AttackPoint;
  }
}
class DeffenceAction extends ActionCommand {
  String name = "DeffenceAction";
  int priority = 30;
  void Action(Player player){
    if (player.enemy.NextAction.getName() == "AttackAction") {
      player.lifepoint += player.enemy.NextAction.getPoint();
    }
    player.lifepoint += 1;
  }
  String getName(){
    return "DeffenceAction";
  }
  int getPoint(){
    return -1;
  }
}
class HealAction extends ActionCommand {
  int HealPoint = int(random(3)) + 2;
  int priority = 50;
  public String name = "HealAction";
  void Action(Player player){
    player.lifepoint += HealPoint;
  }
  String getName(){
    return "HealAction";
  }
  int getPoint(){
    return HealPoint;
  }

}
class CalcDamage{
  boolean calc_finished = false;
  void display(){
    DrawCharactor(200,500);
    DrawCharactor(1000,500);
    DrawHeart(71, 50, player1.lifepoint);
    DrawLifePoint(70,100,player1.lifepoint, 1);
    DrawHeart(1360, 50, player2.lifepoint);
    DrawLifePoint(750,100,player2.lifepoint, 2);
    fill(0);
    text(player1.NextAction.getName(), width/4, height * 3/4);
    text(player1.NextAction.getPoint(), width/4, height * 3 / 4 + 50) ;
    text(player2.NextAction.getName(), width * 3/4, height * 3/4);
    text(player2.NextAction.getPoint(), width * 3/4, height * 3 / 4 + 50) ;
    update();
  }
  //指定した位置にハートとライフを表示する
  void DrawHeart(int X, int Y, int life){
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
   if(life < 10){
     text(life, X-9, Y+16);
   } else {
     text(life, X-18, Y+16);
   }
  }
  //残りライフバーを表示する（player１は左、player２は右から表示する)
  void DrawLifePoint(int x, int y, int life, int player) {
    int rectX = x + 10;
    int rectY = y + 10;
    int life2 = 0;
    fill(255);;
    rect(x, y, 610, 150);
    stroke(0);
    if(life >= 10){
      life2 = life % 10;
      life = 10;
    }
    if(player == 1){
      fill(0,255,0);
      for(int i = 0; i < life; i++){
        rect(rectX + 60 * i, rectY, 50, 130);
      }
      fill(255, 0, 150);
      for(int i = 0; i < life2; i++){
        rect(rectX + 60 * i, rectY, 50, 130);
      }
    }
    if(player == 2){
      rectX += 540;
      fill(0,255,0);
      for(int i = 0; i < life; i++){
        rect(rectX - 60 * i, rectY, 50, 130);
      }
      fill(255, 0, 150);
      for(int i = 0; i < life2; i++){
        rect(rectX - 60 * i, rectY, 50, 130);
      }
    }
  }
  void DrawCharactor(int x, int y ){
    ellipse(x, y, 50,50);
    rect(x-20,y+30,40,60);
    line(x-10,y + 50,x-10,y + 100);
    line(x+10,y + 50,x+10,y + 100);
  }
  void DrawLifePoint() {
  }
  void update(){
    fill(0);
    calc();
    text("next turn to press h", width/2, height/2);
    if(keyPressed && key == 'h') {
        Gameflow = "main";
        player1.NextAction = null;
        player2.NextAction = null;
        calc_finished = false;
    }
  }
  void calc(){
    if (! calc_finished) {
      calc_finished = true;
      player1.action();
      player2.action();
    }
  }
}
// これは多分全体で共有した方がいいかも？
class MainScreen{
  void display(){
    update();
    //attack
    textSize(30);
    fill(255);
    square(100,100,200);
    fill(0);
    text("Attack", 110,150);
    text("a", 110, 350);
    text("j", 250, 350);
    
    //deffence
    fill(255);
    square(500,100,200);
    fill(0);
    text("diffence", 510, 150);
    text("s", 510, 350);
    text("k", 650, 350);
    
    //heal
    fill(255);
    square(900,100,200);
    fill(0);
    text("Heal", 910, 150);
    text("d", 910, 350);
    text("l", 1050, 350);
    
    
  }
  void update(){
    if (player1.NextAction != null && player2.NextAction != null) {
      Gameflow = "calc_damage";
    }
    if (keyPressed) {
      if(key == 'a'){
        player1.NextAction = new AttackAction();
      }else if ( key == 's'){
        player1.NextAction = new DeffenceAction();
      }else if (key == 'd'){
        player1.NextAction = new HealAction();
      }else if (key == 'j'){
        player2.NextAction = new AttackAction();
      }else if (key == 'k'){
        player2.NextAction = new DeffenceAction();
      }else if (key == 'l'){
        player2.NextAction = new HealAction();
      }else{
        fill(0);
        text("invalid key", width/2, height - 100);
      }
    }
  }
}

MainScreen main = new MainScreen();
CalcDamage calcdamage = new CalcDamage();
Player player1 = new Player();
Player player2 = new Player();

String Gameflow = "main";
void setup(){
  size(1200,800);
  player1.setenemy(player2);
  player2.setenemy(player1);
}
void draw(){
  background(255);
  if (Gameflow == "rule"){
    
  }else if (Gameflow == "main"){
    main.display();
  }else if (Gameflow == "calc_damage"){
    calcdamage.display();
  }
}
