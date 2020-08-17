import ddf.minim.*;  //minimライブラリのインポート

Minim minim;  //Minim型変数であるminimの宣言
AudioPlayer player;  //サウンドデータ格納用の変数

start s = new start();
MainScreen main = new MainScreen();
Rule rule = new Rule();
CalcDamage calcdamage = new CalcDamage();
Player player1 = new Player();
Player player2 = new Player();
Result result = new Result();
ResultMove result_move = new ResultMove();
GameFlow Gameflow = new GameFlow();
PFont Japanfont, Englishfont;
//PImage action;
void setup() {
  size(1200, 800);
  player1.setenemy(player2);
  player2.setenemy(player1);
  Gameflow.setScreen(new start());
}
void draw() {
  background(255);
  Gameflow.display();
}
