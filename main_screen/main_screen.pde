








start s = new start();
MainScreen main = new MainScreen();
Rule rule = new Rule();
CalcDamage calcdamage = new CalcDamage();
Player player1 = new Player();
Player player2 = new Player();
Result result = new Result();
ResultMove result_move = new ResultMove();

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
  } else if (Gameflow == "result_move") {
    result_move.display();

  } else if (Gameflow == "result") {
    result.display();
  }
}
