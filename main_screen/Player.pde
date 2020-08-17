class Player {
  Player enemy = null;
  int lifepoint = 10;
  ActionCommand NextAction = null;
  boolean extra = false;

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
