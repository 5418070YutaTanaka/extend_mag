class GameFlow{
  Screen now_screen = null;
  int turn = 0;
  void setScreen(Screen nextScreen){
    now_screen = nextScreen;
  }
  void display(){
    now_screen.display();
  }
}
