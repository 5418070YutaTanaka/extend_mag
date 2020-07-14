//calcDamageのアニメーションどうしよう
// これは多分全体で共有した方がいいかも？
class Player {
  Player enemy;
  int lifepoint = 10;
  String name;
  ActionCommand NextAction = null;
}

interface ActionCommand {
  void Action(Player player); // 選択したときにおこる行動を指定。
  String getName();
}
class AttackAction implements ActionCommand {
  int AttackPoint = int(random(3)) + 4;
  String getName(){
    return "AttackAction";
  }
  void Action(Player player){
    player.enemy.lifepoint -= AttackPoint;
  }
}
class DeffenceAction implements ActionCommand {
  String name = "DeffenceAction";
  void Action(Player player){
  }
  String getName(){
    return "DeffenceAction";
  }
}
class HealAction implements ActionCommand {
  int healpoint = int(random(3)) + 2;
  public String name = "HealAction";
  void Action(Player player){
    player.lifepoint += healpoint;
  }
  String getName(){
    return "HealAction";
  }
}
class CalcDamage{
  void display(){
    DrawCharactor(200,500);
    DrawCharactor(1000,500);
    fill(0);
    text(player1.NextAction.getName(), width/4, height * 3/4);
    text(player2.NextAction.getName(), width * 3/4, height * 3/4);
    update();
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
    text("next turn to press h", width/2, height/2);
    if(keyPressed && key == 'h') {
        Gameflow = "main";
        player1.NextAction = null;
        player2.NextAction = null;
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
  size(1600,1200);
}
void draw(){
  background(255);
  if (Gameflow == "main"){
    main.display();
  }else if (Gameflow == "calc_damage"){
    calcdamage.display();
  }
}
